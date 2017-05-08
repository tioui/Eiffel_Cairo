note
	description: "Example using {CAIRO_PATTERN_GRADIENT_*}."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
	revision: "0.1"
	license: "GPL Version 3"



class
	APPLICATION

inherit
	DOUBLE_MATH

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_surface:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
			l_x, l_y, l_aspect, l_height, l_width, l_corner_radius, l_radius, l_degrees:REAL_64
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 256, 256)
			create l_context.make (l_surface)

			l_x := 25.6
			l_y := 25.6
			l_aspect := 1
			l_width := 204.8
			l_height := 204.8
			l_corner_radius := l_height / 10
			l_radius := l_corner_radius / l_aspect
			l_degrees := Pi / 180

			l_context.new_sub_path
			l_context.arc (l_x + l_width - l_radius, l_y + l_radius, l_radius, -90 * l_degrees, 0 * l_degrees)
			l_context.arc (l_x + l_width - l_radius, l_y + l_height - l_radius, l_radius, 0 * l_degrees, 90 * l_degrees)
			l_context.arc (l_x + l_radius, l_y + l_height - l_radius, l_radius, 90 * l_degrees, 180 * l_degrees)
			l_context.arc (l_x + l_radius, l_y + l_radius, l_radius, 180 * l_degrees, 270 * l_degrees)
			l_context.close_path

			l_context.set_source_rgb (0.5, 0.5, 1)
			l_context.fill_preserve
			l_context.set_source_rgba (0.5, 0, 0, 0.5)
			l_context.set_line_width (10)
			l_context.stroke

			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
