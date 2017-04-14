note
	description: "A memory array of {CAIRO_TEXT_CLUSTER}"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_TEXT_CLUSTERS_CONTAINER

inherit
	CAIRO_INTERNAL_CONTAINER[CAIRO_TEXT_CLUSTER]
		rename
			make_from_pointer as make_container_from_pointer
		end

create {CAIRO_ANY}
	make_from_pointer,
	make

feature {NONE} -- Initialization

	make(a_count:INTEGER)
			-- <Precursor>
		do
			item_pointer := {CAIRO_EXTERNALS}.cairo_text_cluster_allocate(a_count)
			if item_pointer.is_default_pointer then
				count := 0
			else
				count := a_count
			end
			compare_objects
			flag_backward := 0
			create text_c.make_empty (0)
		end

	make_from_pointer(a_pointer:POINTER; a_count, a_flag_backward:INTEGER; a_text:C_STRING)
			-- Initialization of `Current' using `a_pointer' as
			-- `pointer' and `a_count' as `count'
		require
			a_count > 0
			Pointer_Not_Null: not a_pointer.is_default_pointer
		do
			make_container_from_pointer(a_pointer, a_count)
			flag_backward := a_flag_backward
			text_c := a_text
		end

feature -- Status report

	is_backward:BOOLEAN
			-- The clusters in the cluster array map to glyphs in the
			-- glyph array from end to start.
		do
			Result := flag_backward = {CAIRO_EXTERNALS}.CAIRO_TEXT_CLUSTER_FLAG_BACKWARD
		end

	text:STRING_32
			-- The text that is used to create `Current'
		local
			l_utf_converter:UTF_CONVERTER
		do
			Result := l_utf_converter.utf_8_string_8_to_string_32 (text_c.string)
		end

feature {CAIRO_ANY} -- Implementation

	flag_backward:INTEGER
			-- The internal representation of `text'

	text_c:C_STRING
			-- The internal representation of `Current'

feature {NONE} -- Implementation

	create_item(a_pointer:POINTER):like item
			-- <Precursor>
		do
			create Result.make_by_pointer(a_pointer)
		end

	item_size:INTEGER
			-- <Precursor>
		once
			Result := {CAIRO_EXTERNALS}.c_sizeof_text_cluster
		end

feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			if not item_pointer.is_default_pointer then
				{CAIRO_EXTERNALS}.cairo_text_cluster_free(item_pointer)
			end
		end


end
