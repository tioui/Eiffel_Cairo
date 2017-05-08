note
	description: "Example using different line cap."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
	revision: "0.1"
	license: "GPL Version 3"



class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_surface:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 256, 256)
			create l_context.make (l_surface)

			-- Lines
			l_context.set_line_width (30)
			l_context.set_line_cap_butt
			l_context.move_to (64, 50); l_context.line_to (64, 200)
			l_context.stroke

			l_context.set_line_cap_round
			l_context.move_to (128, 50); l_context.line_to (128, 200)
			l_context.stroke

			l_context.set_line_cap_square
			l_context.move_to (192, 50); l_context.line_to (192, 200)
			l_context.stroke


			-- Helping lines
			l_context.set_source_rgb (1, 0.2, 0.2)
			l_context.set_line_width (2.56)
			l_context.move_to (64, 50); l_context.line_to (64, 200)
			l_context.move_to (128, 50); l_context.line_to (128, 200)
			l_context.move_to (192, 50); l_context.line_to (192, 200)
			l_context.stroke

			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
