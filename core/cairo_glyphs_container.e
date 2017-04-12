note
	description: "A memory array of {CAIRO_GLYPH}"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_GLYPHS_CONTAINER

inherit
	CAIRO_INTERNAL_CONTAINER[CAIRO_GLYPH]

create {CAIRO_ANY}
	make_from_pointer

create
	make

feature {NONE} -- Initialization

	make(a_count:INTEGER)
			-- <Precursor>
		do
			item_pointer := {CAIRO_EXTERNALS}.cairo_glyph_allocate(a_count)
			if item_pointer.is_default_pointer then
				count := 0
			else
				count := a_count
			end
			compare_objects
		end

feature {NONE} -- Implementation

	create_item(a_pointer:POINTER):like item
			-- <Precursor>
		do
			create Result.make_by_pointer(a_pointer)
		end

	item_size:INTEGER
			-- <Precursor>
		once
			Result := {CAIRO_EXTERNALS}.c_sizeof_glyph
		end

feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			if not item_pointer.is_default_pointer then
				{CAIRO_EXTERNALS}.cairo_glyph_free(item_pointer)
			end
		end

end
