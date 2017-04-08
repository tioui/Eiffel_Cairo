note
	description: "[
					A {CAIRO_PATTERN} that used a gradient pattern
			
					A Gradient can be linear or radial.
					A linear gradient's control vector is from (`x1', `y1') to (`x2', `y2').
					A radial gradient's control vector is from any point on the start circle
					to the corresponding point on the end circle.
				]"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

deferred class
	CAIRO_PATTERN_GRADIENT

inherit
	CAIRO_PATTERN

feature -- Access

	add_color_stop_rgb(a_offset, a_red, a_green, a_blue:REAL_64)
			-- Adds an opaque color stop to a gradient pattern. The color is
			-- defined by the composite `a_red', `a_green' and `a_blue'. The `a_offset'
			-- is the location along the gradient's control vector.
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_add_color_stop_rgb(item, a_offset, a_red, a_green, a_blue)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
		ensure
			Valid_Count: is_success implies (color_stop_count = old color_stop_count + 1)
		end

	add_color_stop_rgba(a_offset, a_red, a_green, a_blue, a_alpha:REAL_64)
			-- Adds an translucent color stop to a gradient pattern. The color is
			-- defined by the composite `a_red', `a_green' and `a_blue' ant the translucent
			-- by `a_alpha'. The `a_offset' is the location along the gradient's control vector.
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_add_color_stop_rgba(item, a_offset, a_red, a_green, a_blue, a_alpha)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
		ensure
			Valid_Count: is_success implies (color_stop_count = old color_stop_count + 1)
		end

	color_stop_count:INTEGER
			-- The number of color stop in `Current'
		require
			Is_Valid: is_valid
		local
			l_result:INTEGER
		do
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_get_color_stop_count(item, $l_result)
			Result := l_result
		end

	color_stop_at(a_index:INTEGER):TUPLE[offset, red, green, blue, alpha:REAL_64]
			-- The color and offset of the `a_index'-th color stop
		require
			Is_Valid: is_valid
			Index_Valid: a_index >= 1 and a_index <= color_stop_count
		local
			l_offset, l_red, l_green, l_blue, l_alpha:REAL_64
		do
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_get_color_stop_rgba(
												item, a_index - 1, $l_offset,
												$l_red, $l_green, $l_blue, $l_alpha
											)
			Result := [l_offset, l_red, l_green, l_blue, l_alpha]
		end
end
