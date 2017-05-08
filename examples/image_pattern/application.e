note
	description: "Example using {CAIRO_SURFACE_IMAGE} as pattern."
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
			l_source_pattern:CAIRO_PATTERN_SURFACE
			l_destination_surface:CAIRO_SURFACE_PDF
			l_context:CAIRO_CONTEXT
			l_matrix:CAIRO_TRANSFORMATION_MATRIX
			l_width, l_height:INTEGER
		do
			create l_source_surface.make_from_png_file ("source.png")
			if l_source_surface.is_valid then
				l_width := l_source_surface.width
				l_height := l_source_surface.height
				create l_source_pattern.make (l_source_surface)
				create l_destination_surface.make ("output.pdf", 256, 256)
				create l_context.make (l_destination_surface)

				l_source_pattern.set_extend_repeat
				l_context.translate (128, 128)
				l_context.rotate (Pi / 4)
				l_context.scale (1 / sqrt (2), 1 / sqrt (2))
				l_context.translate (-128, -128)

				create l_matrix.make_scale (l_width / 256.0 * 5.0, l_height / 256.0 * 5.0)
				l_source_pattern.set_transformation_matrix (l_matrix)

				l_context.set_source (l_source_pattern)
				l_context.rectangle (0, 0, 256, 256)
				l_context.fill

				l_destination_surface.show_page
			else
				io.error.put_string ("Cannot open file source.png.%N")
			end
		end

end
