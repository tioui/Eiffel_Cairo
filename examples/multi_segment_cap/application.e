note
	description: "Example using multi segment dans line cap."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
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
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
		do
			create l_surface.make ("output.pdf", 256, 256)
			create l_context.make (l_surface)

			l_context.move_to (50, 75)
			l_context.line_to (200, 75)

			l_context.move_to (50, 125)
			l_context.line_to (200, 125)

			l_context.move_to (50, 175)
			l_context.line_to (200, 175)

			l_context.set_line_width (30)
			l_context.set_line_cap_round
			l_context.stroke

			l_surface.show_page
		end

end
