note
	description: "Simple text examples."
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
		do
			create l_surface.make ("output.pdf", 256, 256)
			create l_context.make (l_surface)

			-- Hello
			create l_font_face.make ("Sans", True)
			l_context.set_font_face (l_font_face)
			l_context.set_font_size (90)
			l_context.move_to (10, 135)
			l_context.show_text ("Hello")

			-- void
			l_context.move_to (70, 165)
			l_context.text_path ("void")
			l_context.set_source_rgb (0.5, 0.5, 1)
			l_context.fill_preserve
			l_context.set_source_rgb (0, 0, 0)
			l_context.set_line_width (2.56)
			l_context.stroke


			-- Helping lines
			l_context.set_source_rgba (1, 0.2, 0.2, 0.6)
			l_context.arc (10, 135, 5.12, 0, 2 * Pi)
			l_context.close_path
			l_context.arc (70, 165, 5.12, 0, 2 * Pi)
			l_context.fill

			l_surface.show_page
		end

end
