note
	description: "Exemple for showing text using the Freetype font library."
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
			l_font_factory:FT_FACTORY
			l_font_face:CAIRO_FT_FONT_FACE
			l_scaled_font:CAIRO_SCALED_FONT
			l_glyphs_and_clusters:TUPLE [glyphs: CAIRO_GLYPHS_CONTAINER; clusters: CAIRO_TEXT_CLUSTERS_CONTAINER]
		do
			create l_font_factory
			if l_font_factory.is_valid then
				l_font_face := l_font_factory.new_face ("font.ttf", 1, False)
				if l_font_face.is_valid then
					create l_surface.make ("text.pdf", 300, 300)
					if l_surface.is_valid then
						create l_context.make (l_surface)
						if l_context.is_valid then
							l_text := "Hello World"
							l_context.set_font_face (l_font_face)
							l_context.set_font_size (30)
							l_scaled_font := l_context.scaled_font
							l_glyphs_and_clusters := l_scaled_font.text_to_glyphs (l_text, 0, l_scaled_font.text_extents (l_text).height)
							l_context.show_text_glyphs (l_glyphs_and_clusters.glyphs, l_glyphs_and_clusters.clusters)
							l_context.stroke
							l_surface.show_page
						else
							io.error.put_string (l_context.error_string.out + "%N")
						end
					else
						io.error.put_string (l_surface.error_string.out + "%N")
					end
				else
					io.error.put_string (l_font_face.error_string.out + "%N")
				end
			else
				io.error.put_string ("Cannot open freetype font library%N")
			end



		end

end
