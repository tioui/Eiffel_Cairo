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
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_pattern_linear:CAIRO_PATTERN_GRADIENT_LINEAR
			l_pattern_radial:CAIRO_PATTERN_GRADIENT_RADIAL
		do
			create l_surface.make ("output.pdf", 300, 300)
			create l_context.make (l_surface)

			create l_pattern_linear.make (0, 0, 0, 256)
			l_pattern_linear.add_color_stop_rgba (1, 0, 0, 0, 1)
			l_pattern_linear.add_color_stop_rgba (0, 1, 1, 1, 1)
			l_context.rectangle (0, 0, 256, 256)
			l_context.set_source (l_pattern_linear)
			l_context.fill

			create l_pattern_radial.make (115.2, 102.4, 25.6, 102.4,  102.4, 128)
			l_pattern_radial.add_color_stop_rgba (0, 1, 1, 1, 1)
			l_pattern_radial.add_color_stop_rgba (1, 0, 0, 0, 1)
			l_context.set_source (l_pattern_radial)
			l_context.arc (128, 128, 76.8, 0, 2 * Pi)
			l_context.fill

			l_surface.show_page
		end

end
