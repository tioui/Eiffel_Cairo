note
	description: "Filling and stroking the same object."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Sun, 07 May 2017 16:07:05 +0000"
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
			l_surface:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 300, 300)
			create l_context.make (l_surface)

			-- Path the first object
			l_context.move_to (128, 25.6)
			l_context.line_to (230.4, 230.4)
			l_context.relative_line_to (-102.4, 0.0)
			l_context.curve_to (51.2, 230.4, 51.2, 128.0, 128.0, 128.0)
			l_context.close_path

			-- Path the second object
			l_context.move_to (64.0, 25.6)
			l_context.relative_line_to (51.2, 51.2)
			l_context.relative_line_to (-51.2, 51.2)
			l_context.relative_line_to (-51.2, -51.2)
			l_context.close_path

			-- Blue fill with black stroke drawing
			l_context.set_line_width (10)
			l_context.set_source_rgb (0, 0, 1)
			l_context.fill_preserve
			l_context.set_source_rgb (0, 0, 0)
			l_context.stroke

			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
