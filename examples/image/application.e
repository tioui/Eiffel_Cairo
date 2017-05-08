note
	description: "Example using {CAIRO_SURFACE_IMAGE} as source."
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
			l_source_surface:CAIRO_SURFACE_IMAGE
			l_height, l_width:INTEGER
			l_destination_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
		do
			create l_source_surface.make_from_png_file ("source.png")
			if l_source_surface.is_valid then
				l_height := l_source_surface.height
				l_width := l_source_surface.width
				create l_destination_surface.make ("output.pdf", 200, 200)
				create l_context.make (l_destination_surface)

				l_context.translate (100, 100)
				l_context.rotate (45 * Pi / 180)
				l_context.scale (200 / l_width, 200 / l_height)
				l_context.translate (-0.5 * l_width, -0.5 * l_height)

				l_context.set_source_surface (l_source_surface, 0, 0)
				l_context.paint
				l_destination_surface.show_page
			else
				io.error.put_string ("Cannot open sourc.png file%N")
			end
		end

end
