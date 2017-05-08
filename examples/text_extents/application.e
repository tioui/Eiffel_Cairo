note
	description: "Example using {CAIRO_TEXT_EXTENTS}."
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
			l_font_face:CAIRO_TOY_FONT_FACE
			l_text:STRING_32
			l_x, l_y:REAL_64
			l_extents:CAIRO_TEXT_EXTENTS
		do
			create l_surface.make ("output.pdf", 300, 256)
			create l_context.make (l_surface)
			create l_font_face.make ("Sans", False)
			l_text := "Cairo"
			l_x := 25
			l_y := 150


			-- Drawing the text
			l_context.set_font_face (l_font_face)
			l_context.set_font_size (100)
			l_extents := l_context.text_extents (l_text)
			l_context.move_to (l_x, l_y)
			l_context.show_text (l_text)


			-- Drawing helping lines
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.set_line_width (6)
			l_context.arc (l_x, l_y, 10, 0, 2 * Pi)
			l_context.fill
			l_context.move_to (l_x, l_y)
			l_context.relative_line_to (0, -l_extents.height)
			l_context.relative_line_to (l_extents.width, 0)
			l_context.relative_line_to (l_extents.x_bearing, -l_extents.y_bearing)
			l_context.stroke

			l_surface.show_page
		end

end
