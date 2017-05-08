note
	description: "Example center align text."
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
			l_extents:CAIRO_TEXT_EXTENTS
			l_x, l_y:REAL_64
			l_text:STRING_32
		do
			create l_surface.make ("output.pdf", 256, 256)
			create l_context.make (l_surface)
			create l_font_face.make ("Sans", False)
			l_text := "Cairo"

			-- Show text
			l_context.set_font_face (l_font_face)
			l_context.set_font_size (52)
			l_extents := l_context.text_extents (l_text)
			l_x := 128 - (l_extents.width / 2 + l_extents.x_bearing)
			l_y := 128 - (l_extents.height / 2 + l_extents.y_bearing)
			l_context.move_to (l_x, l_y)
			l_context.show_text (l_text)

			-- Helping lines
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.set_line_width (6)
			l_context.arc (l_x, l_y, 10.0, 0, 2 * Pi)
			l_context.fill
			l_context.move_to (128, 0)
			l_context.relative_line_to (0, 256)
			l_context.move_to (0, 128)
			l_context.relative_line_to (256, 0)
			l_context.stroke

			l_surface.show_page
		end

end
