note
	description: "[
					Describe a user-space rectangle that encloses the "inked"
					portion of the text drawn at the origin (0,0) (as it
					would be drawn if the graphics state were set to the
					same `font_face', `font_matrix', `ctm_matrix', and
					`font_options' as {CAIRO_SCALED_FONT}).
					
					Additionally, the `x_advance' and `y_advance' values
					indicate the amount by which the current point would be
					advanced by the text drawing.
				]"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_TEXT_EXTENTS

inherit
	CAIRO_ANY
		redefine
			default_create,
			is_equal
		end
	MEMORY_STRUCTURE
		export
			{NONE} exists, make, make_by_pointer, structure_size;
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
			-- <Precursor>
		do
			make
		end

feature -- Access

	x_bearing:REAL_64 assign set_x_bearing
			-- The horizontal distance from the origin to the leftmost
			-- part of the glyphs as drawn. Positive if the glyphs lie
			-- entirely to the right of the origin.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_x_bearing (item)
		end

	set_x_bearing(a_x_bearing:REAL_64)
			-- Assign `x_bearing' with the value of `a_x_bearing'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_x_bearing (item, a_x_bearing)
		ensure
			Is_Assign: x_bearing ~ a_x_bearing
		end

	y_bearing:REAL_64 assign set_y_bearing
			-- The vertical distance from the origin to the topmost part of
			-- the glyphs as drawn. Positive only if the glyphs lie
			-- completely below the origin; will usually be negative.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_y_bearing (item)
		end

	set_y_bearing(a_y_bearing:REAL_64)
			-- Assign `y_bearing' with the value of `a_y_bearing'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_y_bearing (item, a_y_bearing)
		ensure
			Is_Assign: y_bearing ~ a_y_bearing
		end

	width:REAL_64 assign set_width
			-- The horizontal dimension of the glyphs as drawn
		require

		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_width (item)
		end

	set_width(a_width:REAL_64)
			-- Assign `width' with the value of `a_width'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_width (item, a_width)
		ensure
			Is_Assign: width ~ a_width
		end

	height:REAL_64 assign set_height
			-- The vertical dimension of the glyphs as drawn
		require

		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_height (item)
		end

	set_height(a_height:REAL_64)
			-- Assign `height' with the value of `a_height'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_height (item, a_height)
		ensure
			Is_Assign: height ~ a_height
		end

	x_advance:REAL_64 assign set_x_advance
			-- The distance to advance in the horizontale direction after
			-- drawing these glyphs
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_x_advance (item)
		end

	set_x_advance(a_x_advance:REAL_64)
			-- Assign `x_advance' with the value of `a_x_advance'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_x_advance (item, a_x_advance)
		ensure
			Is_Assign: x_advance ~ a_x_advance
		end

	y_advance:REAL_64 assign set_y_advance
			-- The distance to advance in the vertical direction after
			-- drawing these glyphs
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_text_extents_y_advance (item)
		end

	set_y_advance(a_y_advance:REAL_64)
			-- Assign `y_advance' with the value of `a_y_advance'.
		do
			{CAIRO_EXTERNALS}.set_cairo_text_extents_y_advance (item, a_y_advance)
		ensure
			Is_Assign: y_advance ~ a_y_advance
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := item = a_other.item or (
						x_bearing ~ a_other.x_bearing and
						y_bearing ~ a_other.y_bearing and
						width ~ a_other.width and
						height ~ a_other.height and
						x_advance ~ a_other.x_advance and
						y_advance ~ a_other.y_advance
					)
		end

feature {NONE} -- Measurement

	structure_size: INTEGER
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.c_sizeof_text_extents
		end

end
