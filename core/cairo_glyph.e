note
	description: "[
					Class that holds information about a single glyph when drawing
					or measuring text
				]"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 03:25:52 +0000"
	revision: "0.1"

class
	CAIRO_GLYPH

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

	index:NATURAL_32 assign set_index
			-- glyph index in the font.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_glyph_index(item)
		end

	set_index(a_index:NATURAL_32)
			-- Assign `index' with the value of `a_index'
		do
			{CAIRO_EXTERNALS}.set_cairo_glyph_index(item, a_index)
		ensure
			Is_Assign: index ~ a_index
		end

	x:REAL_64 assign set_x
			-- the offset in the X direction between the origin
			-- used for drawing or measuring the string and the
			-- origin of this glyph.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_glyph_x(item)
		end

	set_x(a_x:REAL_64)
			-- Assign `x' with the value of `a_x'
		do
			{CAIRO_EXTERNALS}.set_cairo_glyph_x(item, a_x)
		ensure
			Is_Assign: x ~ a_x
		end

	y:REAL_64 assign set_y
			-- the offset in the Y direction between the origin
			-- used for drawing or measuring the string and the
			-- origin of this glyph.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_glyph_y(item)
		end

	set_y(a_y:REAL_64)
			-- Assign `y' with the value of `a_y'
		do
			{CAIRO_EXTERNALS}.set_cairo_glyph_y(item, a_y)
		ensure
			Is_Assign: y ~ a_y
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result :=	item = a_other.item or (
						index ~ a_other.index and
						x ~ a_other.x and
						y ~ a_other.y 
					)
		end

feature {NONE} -- Measurement

	structure_size: INTEGER
			-- Size to allocate (in bytes)
		do
			Result := {CAIRO_EXTERNALS}.c_sizeof_glyph
		end
end
