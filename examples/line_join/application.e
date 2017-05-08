note
	description: "Example of multiple line join."
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

			l_context.set_line_width (40.96)
			l_context.move_to (76.8, 84.48)
			l_context.relative_line_to (51.2, -51.2)
			l_context.relative_line_to (51.2, 51.2)
			l_context.set_line_join_miter
			l_context.stroke

			l_context.move_to (76.8, 161.28)
			l_context.relative_line_to (51.2, -51.2)
			l_context.relative_line_to (51.2, 51.2)
			l_context.set_line_join_bevel
			l_context.stroke

			l_context.move_to (76.8, 238.08)
			l_context.relative_line_to (51.2, -51.2)
			l_context.relative_line_to (51.2, 51.2)
			l_context.set_line_join_round
			l_context.stroke

			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
