note
	description: "Metric information for a {CAIRO_SCALED_FONT}"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_FONT_EXTENTS

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

	ascent:REAL_64 assign set_ascent
			-- The distance that the font extends above the baseline.
			-- Note that this is not always exactly equal to the maximum
			-- of the extents of all the glyphs in the font, but rather
			-- is picked to express the font designer's intent as to how
			-- the font should align with elements above it.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_font_extents_ascent (item)
		end

	set_ascent(a_ascent:REAL_64)
			-- Assign `ascent' with the value of `a_ascent'.
		do
			{CAIRO_EXTERNALS}.set_cairo_font_extents_ascent (item, a_ascent)
		ensure
			Is_Assign: ascent ~ a_ascent
		end

	descent:REAL_64 assign set_descent
			-- The distance that the font extends below the baseline.
			-- This value is positive for typical fonts that include
			-- portions below the baseline.
			-- Note that this is not always exactly equal to the maximum
			-- of the extents of all the glyphs in the font, but rather
			-- is picked to express the font designer's intent as to how
			-- the font should align with elements below it.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_font_extents_descent (item)
		end

	set_descent(a_descent:REAL_64)
			-- Assign `descent' with the value of `a_descent'.
		do
			{CAIRO_EXTERNALS}.set_cairo_font_extents_descent (item, a_descent)
		ensure
			Is_Assign: descent ~ a_descent
		end

	height:REAL_64 assign set_height
			-- The recommended vertical distance between baselines when
			-- setting consecutive lines of text with the font.
			-- This is greater than `ascent' + `descent' by a quantity
			-- known as the line spacing or external leading.
			-- When space is at a premium, most fonts can be set with
			-- only a distance of `ascent' + `descent' between lines.
		require

		do
			Result := {CAIRO_EXTERNALS}.get_cairo_font_extents_height (item)
		end

	set_height(a_height:REAL_64)
			-- Assign `height' with the value of `a_height'.
		do
			{CAIRO_EXTERNALS}.set_cairo_font_extents_height (item, a_height)
		ensure
			Is_Assign: height ~ a_height
		end

	maximum_x_advance:REAL_64 assign set_maximum_x_advance
			-- The maximum distance in the horizontal direction that the
			-- origin is advanced for any glyph in the font.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_font_extents_max_x_advance (item)
		end

	set_maximum_x_advance(a_maximum_x_advance:REAL_64)
			-- Assign `maximum_x_advance' with the value of `a_maximum_x_advance'.
		do
			{CAIRO_EXTERNALS}.set_cairo_font_extents_max_x_advance (item, a_maximum_x_advance)
		ensure
			Is_Assign: maximum_x_advance ~ a_maximum_x_advance
		end

	maximum_y_advance:REAL_64 assign set_maximum_y_advance
			-- The maximum distance in the vertical direction that the
			-- origin is advanced for any glyph in the font.
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_font_extents_max_y_advance (item)
		end

	set_maximum_y_advance(a_maximum_y_advance:REAL_64)
			-- Assign `maximum_y_advance' with the value of `a_maximum_y_advance'.
		do
			{CAIRO_EXTERNALS}.set_cairo_font_extents_max_y_advance (item, a_maximum_y_advance)
		ensure
			Is_Assign: maximum_y_advance ~ a_maximum_y_advance
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := item = a_other.item or (
						ascent ~ a_other.ascent and
						descent ~ a_other.descent and
						height ~ a_other.height and
						maximum_x_advance ~ a_other.maximum_x_advance and
						maximum_y_advance ~ a_other.maximum_y_advance
					)
		end

feature {NONE} -- Measurement

	structure_size: INTEGER
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.c_sizeof_font_extents
		end
end
