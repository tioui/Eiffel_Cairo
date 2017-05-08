note
	description: "Example using different fill rules.."
	source: "https://www.cairographics.org/samples/"
	author: "Louis Marchand"
	date: "Sun, 07 May 2017 16:07:05 +0000"
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
			l_surface:CAIRO_SURFACE_SVG
			l_context:CAIRO_CONTEXT
		do
			create l_surface.make ("output.svg", 300, 300)
			create l_context.make (l_surface)
			l_context.set_line_width (6)

			l_context.rectangle (12, 12, 232, 70)
			l_context.new_sub_path; l_context.arc (64, 64, 40, 0, 2*Pi)
			l_context.new_sub_path; l_context.arc_negative (192, 64, 40, 0, -2*Pi)

			l_context.set_fill_rule_even_odd
			l_context.set_source_rgb (0, 0.7, 0); l_context.fill_preserve
			l_context.set_source_rgb (0, 0, 0); l_context.stroke

			l_context.translate (0, 128)
			l_context.rectangle (12, 12, 232, 70)
			l_context.new_sub_path; l_context.arc (64, 64, 40, 0, 2*Pi)
			l_context.new_sub_path; l_context.arc_negative (192, 64, 40, 0, -2*Pi)

			l_context.set_fill_rule_winding
			l_context.set_source_rgb (0, 0, 0.9); l_context.fill_preserve
			l_context.set_source_rgb (0, 0, 0); l_context.stroke

			l_surface.show_page
		end

end
