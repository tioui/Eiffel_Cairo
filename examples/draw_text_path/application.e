note
	description: "Exemple for drawing text like other path elements."
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
			l_font_face:CAIRO_TOY_FONT_FACE		-- The toy API is used for presentation purpose
			l_scaled_font:CAIRO_SCALED_FONT
			l_glyphs: CAIRO_GLYPHS_CONTAINER
		do
			create l_surface.make ("text.pdf", 300, 300)
			create l_context.make (l_surface)

			create l_font_face
			l_context.set_font_face (l_font_face)
			l_context.set_font_size (30)
			l_scaled_font := l_context.scaled_font
			l_glyphs := l_scaled_font.text_to_glyphs ("Hello World", 0, 50).glyphs
			l_context.set_source_rgba (0.2, 0.2, 0.2, 0.1)
			l_context.glyph_path (l_glyphs)
			l_context.fill_preserve
			l_context.set_source_rgba (0, 1, 0, 1)
			l_context.stroke
			l_surface.show_page
		end

end
