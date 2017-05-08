note
	description: "Drawing curve line."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Sun, 07 May 2017 15:57:43 +0000"
	revision: "0.1"
	license: "GPL Version 3"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_context:CAIRO_CONTEXT
			l_surface:CAIRO_SURFACE_IMAGE
			l_x, l_y, l_x1, l_y1, l_x2, l_y2, l_x3, l_y3:REAL_64
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 300, 300)
			create l_context.make (l_surface)

			-- Curve coordinates
			l_x  := 25.6;  l_y  := 128.0
			l_x1 := 102.4; l_y1 := 230.4
			l_x2 := 153.6; l_y2 := 25.6
			l_x3 := 230.4; l_y3 := 128.0

			-- Drawing the curve
			l_context.move_to (l_x, l_y)
			l_context.curve_to (l_x1, l_y1, l_x2, l_y2, l_x3, l_y3)
			l_context.set_line_width (10)
			l_context.stroke

			-- Drawing the helping lines
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.set_line_width (6)
			l_context.move_to (l_x, l_y); l_context.line_to (l_x1, l_y1)
			l_context.move_to (l_x2, l_y2); l_context.line_to (l_x3, l_y3)
			l_context.stroke


			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
