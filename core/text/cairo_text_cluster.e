note
	description: "[
					Class that holds information about a single text cluster.
					A text cluster is a minimal mapping of some glyphs corresponding
					to some UTF-8 text.
				]"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 03:25:52 +0000"
	revision: "0.1"

class
	CAIRO_TEXT_CLUSTER

inherit
	CAIRO_ANY
		redefine
			default_create,
			is_equal
		end
	MEMORY_STRUCTURE
		export
			{NONE} make, make_by_pointer;
			{CAIRO_ANY} item, shared
		redefine
			default_create,
			is_equal
		end

create {CAIRO_ANY}
	make_by_pointer

create
	default_create

feature {NONE} -- Initialization

	default_create
			-- Initialization of `Current'
		do
			make
		end

feature -- Access

	bytes_count:INTEGER assign set_bytes_count
			-- the number of bytes of UTF-8 text covered by `Current'
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_cluster_num_bytes(item)
		end

	set_bytes_count(a_bytes_count:INTEGER)
			-- Assign `bytes_count' with the value of `a_bytes_count'
		do
			{CAIRO_EXTERNALS}.set_cairo_text_cluster_num_bytes(item, a_bytes_count)
		ensure
			Is_Assign: bytes_count ~ a_bytes_count
		end

	glyphs_count:INTEGER assign set_glyphs_count
			-- the number of {CAIRO_GLYPH} covered by `Current'
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_cluster_num_glyphs(item)
		end

	set_glyphs_count(a_glyphs_count:INTEGER)
			-- Assign `glyphs_count' with the value of `a_glyphs_count'
		do
			{CAIRO_EXTERNALS}.set_cairo_text_cluster_num_glyphs(item, a_glyphs_count)
		ensure
			Is_Assign: glyphs_count ~ a_glyphs_count
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result :=	item = a_other.item or (
						bytes_count ~ a_other.bytes_count and
						glyphs_count ~ a_other.glyphs_count
					)
		end

feature {NONE} -- Measurement

	structure_size: INTEGER
			-- Size to allocate (in bytes)
		do
			Result := {CAIRO_EXTERNALS}.c_sizeof_glyph
		end

end
