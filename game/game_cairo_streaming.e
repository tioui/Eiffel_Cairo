note
	description: "[
					Every {GAME_*} that can be stream from a {CAIRO_SURFACE_IMAGE}.
					must inherit from this class.
					Note that you cannot used transparency when streaming to `Current'
				]"
	author: "Louis Marchand"
	date: "Sat, 15 Apr 2017 00:56:53 +0000"
	revision: "0.1"

deferred class
	GAME_CAIRO_STREAMING

feature -- Access

	is_locked:BOOLEAN
			-- `Current` is locked to access `pixels'.
		deferred
		end

	pixel_format: GAME_PIXEL_FORMAT_READABLE
			-- Informations about the internal representation of pixels in `Current`
		deferred
		end

	pixels: GAME_PIXEL_WRITER
			-- Used to modify pixels color in `Current`
		deferred
		end

	cairo_pixel_buffer:CAIRO_PIXEL_BUFFER
			-- The {CAIRO_PIXEL_BUFFER} that will be streamed into `Current'
			-- Do not work with alpha value
		require
			Is_Locked: is_locked
			Is_Pixel_Format_Valid: pixel_format.is_argb8888 or pixel_format.is_rgb565 or
									pixel_format.is_argb2101010
		local
			l_pixel_format:CAIRO_PIXEL_FORMAT
			l_pixels:GAME_PIXEL_WRITER
		do
			if pixel_format.is_rgb565 then
				create l_pixel_format.make_rgb16_565
			elseif pixel_format.is_argb2101010 then
				create l_pixel_format.make_rgb30
			else
				create l_pixel_format.make_rgb24
			end
			l_pixels := pixels
			create Result.share_from_pointer (l_pixel_format, l_pixels.item, l_pixels.width, l_pixels.height, l_pixels.pitch)
		end

	cairo_surface:CAIRO_SURFACE_IMAGE
			-- The {CAIRO_SURFACE} that will be streamed into `Current'
			-- Do not work with alpha value
		require
			Is_Locked: is_locked
			Is_Pixel_Format_Valid: pixel_format.is_argb8888 or pixel_format.is_rgb565 or
									pixel_format.is_argb2101010
		do
			create Result.make_with_pixel_buffer (cairo_pixel_buffer)
		end

end
