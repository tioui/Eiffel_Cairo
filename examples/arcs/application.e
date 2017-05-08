note
	description: "Exemple for using arcs."
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
			-- Run application
		do
			create_arc
			create_arc_negative
		end

	create_arc
			-- Draw an arc
		local
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end:REAL_64
		do
			create l_surface.make ("arc.pdf", 256, 256)
			create l_context.make (l_surface)

			-- Draw the arc
			l_x_center := 128
			l_y_center := 128
			l_radius := 100
			l_angle_start := 45  * (Pi/180)			-- Angle are specified
			l_angle_end := 180.0 * (Pi/180.0)		-- In radians
			l_context.set_line_width (10)
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end)
			l_context.stroke

			-- Draw the helpers
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.set_line_width (6)
			l_context.arc (l_x_center, l_y_center, 10, 0, 2*Pi)
			l_context.fill
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_start)
			l_context.line_to (l_x_center, l_y_center)
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_end, l_angle_end)
			l_context.line_to (l_x_center, l_y_center)
			l_context.stroke

			l_surface.show_page
		end

	create_arc_negative
			-- Draw a negative arc
		local
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end:REAL_64
		do
			create l_surface.make ("arc_negative.pdf", 256, 256)
			create l_context.make (l_surface)

			-- Draw the arc
			l_x_center := 128
			l_y_center := 128
			l_radius := 100
			l_angle_start := 45  * (Pi/180)			-- Angle are specified
			l_angle_end := 180.0 * (Pi/180.0)		-- In radians
			l_context.set_line_width (10)
			l_context.arc_negative (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end)
			l_context.stroke

			-- Draw the helpers
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.set_line_width (6)
			l_context.arc (l_x_center, l_y_center, 10, 0, 2*Pi)
			l_context.fill
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_start)
			l_context.line_to (l_x_center, l_y_center)
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_end, l_angle_end)
			l_context.line_to (l_x_center, l_y_center)
			l_context.stroke

			l_surface.show_page
		end

end
