note
	description: "Exemple for PNG files, source mask, and clip functionnality."
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
			l_pixel_format:CAIRO_PIXEL_FORMAT
			l_source, l_destination:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
		do
			create l_pixel_format.make_argb32
			create l_source.make_from_png_file ("source.png")
			create l_destination.make (l_pixel_format, l_source.width, l_source.height)
			create l_context.make (l_destination)
			l_context.arc (75, 75, 50, 0, 2*Pi)
			l_context.clip
			l_context.new_path
			l_context.set_source_surface (l_source, 0, 0)
			l_context.paint
			l_destination.show_page
			l_destination.save_to_png ("destination.png")
		end

end
