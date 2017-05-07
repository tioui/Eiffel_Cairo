note
	description: "Exemple of drawing an ellipse."
	author: "Louis Marchand"
	date: "Sun, 07 May 2017 14:51:06 +0000"
	revision: "0.1"

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
			l_context:CAIRO_CONTEXT
			l_surface:CAIRO_SURFACE_IMAGE
			l_matrix:CAIRO_TRANSFORMATION_MATRIX
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 100, 100)
			create l_context.make (l_surface)

			l_context.set_line_width (10)
			l_matrix := l_context.transformation_matrix
			l_context.scale (1, 2)							-- Apply the scaling on the path drawing
			l_context.arc (25, 25, 15, 0, 2*Pi)
			l_context.set_transformation_matrix (l_matrix)	-- Do not apply the scaling on the stroke line
			l_context.stroke

			l_surface.show_page
			l_surface.save_to_png ("output.png")
		end

end
