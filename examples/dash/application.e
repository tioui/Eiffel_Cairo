note
	description: "Exemple for using dashed line."
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
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_dashes:ARRAY[REAL_64]
		do
			create l_surface.make ("dash.pdf", 300, 300)
			create l_context.make (l_surface)
			l_dashes := <<
					50,	-- Ink
					10, -- Skip
					10, -- Ink
					10	-- Skip
				>>
			l_context.set_dashes (l_dashes, -50)
			l_context.set_line_width (10)
			l_context.move_to (128, 25.6)
			l_context.line_to (230.4, 230.4)
			l_context.relative_line_to (-102.4, 0)
			l_context.curve_to (51.2, 230.4, 51.2, 128, 128, 128)
			l_context.stroke
			l_surface.show_page
		end

end
