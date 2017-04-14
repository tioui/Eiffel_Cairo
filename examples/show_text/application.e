note
	description: "Exemple for showing text."
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
			l_text:READABLE_STRING_GENERAL
			l_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_font_face:CAIRO_TOY_FONT_FACE		-- The toy API is used for presentation purpose
			l_scaled_font:CAIRO_SCALED_FONT
			l_glyphs_and_clusters:TUPLE [glyphs: CAIRO_GLYPHS_CONTAINER; clusters: CAIRO_TEXT_CLUSTERS_CONTAINER]
		do
			create l_surface.make ("text.pdf", 300, 300)
			create l_context.make (l_surface)

			l_text := "Hello World"
			create l_font_face
			l_context.set_font_face (l_font_face)
			l_context.set_font_size (30)
			l_scaled_font := l_context.scaled_font
			l_glyphs_and_clusters := l_scaled_font.text_to_glyphs (l_text, 0, l_scaled_font.text_extents (l_text).height)
			l_context.show_text_glyphs (l_glyphs_and_clusters.glyphs, l_glyphs_and_clusters.clusters)
			l_context.stroke
			l_surface.show_page
		end

end
