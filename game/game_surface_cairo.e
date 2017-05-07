note
	description: "[
					A {GAME_SURFACE} that can be streamed or translated from and
					to a {CAIRO_SURFACE_IMAGE}.
				]"
	author: "Louis Marchand"
	date: "Sat, 15 Apr 2017 00:56:53 +0000"
	revision: "0.1"

class
	GAME_SURFACE_CAIRO

inherit
	GAME_SURFACE
	GAME_CAIRO_STREAMING

create
	make,
	share_from_image,
	make_from_image,
	share_from_other,
	make_from_other,
	make_for_window,
	make_for_display,
	make_for_display_mode,
	make_for_pixel_format,
	make_with_masks,
	make_from_cairo_pixel_buffer,
	make_from_cairo_surface

feature {NONE} -- Initialization

	make_from_cairo_pixel_buffer(a_pixel_buffer:CAIRO_PIXEL_BUFFER)
			-- Initialization of `Current' copying (and adapting) the data
			-- in `a_pixel_buffer' inside `Current'
		require
			a_pixel_buffer.pixel_format.is_argb32
		local
			l_pixel_format:GAME_PIXEL_FORMAT
			l_pixels:GAME_PIXEL_READER_WRITER
		do
			create l_pixel_format
			l_pixel_format.set_argb8888
			make_for_pixel_format (l_pixel_format, a_pixel_buffer.width, a_pixel_buffer.height)
			lock
			l_pixels := pixels
			premultiply_to_postmultiply(
								a_pixel_buffer.item, l_pixels.item,
								a_pixel_buffer.width, a_pixel_buffer.height,
								a_pixel_buffer.stride, l_pixels.pitch
							)
			unlock
		end

	make_from_cairo_surface(a_cairo_surface:CAIRO_SURFACE_IMAGE)
			-- Initialization of `Current' copying (and adapting) the data
			-- in `a_cairo_surface' inside `Current'
		require
			a_cairo_surface.pixel_buffer.pixel_format.is_argb32
		do
			make_from_cairo_pixel_buffer(a_cairo_surface.pixel_buffer)
		end

feature -- Access

	translated_cairo_pixel_buffer:CAIRO_PIXEL_BUFFER
			-- Translate the pixels of `Current' into a {CAIRO_PIXEL_BUFFER}
			-- (Including alpha value)
			-- The translation can be heavy. Should not be used in real time streaming
		require
			Pixel_Format_Valid: pixel_format.is_argb8888
		local
			l_must_unlock:BOOLEAN
			l_pixels:GAME_PIXEL_READER_WRITER
		do
			create Result.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, width, height)
			if must_lock and not is_locked then
				lock
				l_must_unlock := True
			end
			l_pixels := pixels
			postmultiply_to_premultiply (l_pixels.item, Result.item, width, height, l_pixels.pitch, Result.stride)
			if l_must_unlock then
				unlock
			end
		end

	translated_cairo_surface:CAIRO_SURFACE_IMAGE
			-- Translate the pixels of `Current' into a {CAIRO_SURFACE}
			-- (Including alpha value)
			-- The translation can be heavy. Should not be used in real time streaming
		require
			Pixel_Format_Valid: pixel_format.is_argb8888
		do
			create Result.make_with_pixel_buffer (translated_cairo_pixel_buffer)
		end

feature {NONE} -- Implementation

	premultiply_to_postmultiply(
							a_source, a_destination:POINTER;
							a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER
						)
			-- Since Cairo use premultiplied alpha value and the game library use
			-- a postmultiplied alpha value, a transcription need to be made. This
			-- copy the data (in premultiplied format) in `a_souce' to `a_destination'
			-- (in postmultiplied format). The matrix of pixel is `a_width' x `a_height'
			-- and the lenght of each line in `a_source' is `a_source_pitch' and in
			-- `a_destination', it is `a_destination_pitch'.
		external
			"C inline use <stdint.h>"
		alias
			"[
				uint32_t *l_source = (uint32_t *)$a_source;
				uint32_t *l_destination = (uint32_t *)$a_destination;
				int i, j;
				uint32_t l_color, l_alpha, l_red, l_green, l_blue;
				int l_source_pitch = $a_source_pitch / 4;
				int l_destination_pitch = $a_destination_pitch / 4;
				for(i=0; i < $a_height; i = i + 1)
				{
					for(j=0; j < $a_width; j = j + 1)
					{
						l_color = l_source[(i * l_source_pitch) + j];
						l_alpha = (l_color >> 24) & 0xFF;
						if (l_alpha != 0)
						{
							l_blue = l_color & 0xFF;
							l_green = (l_color >> 8) & 0xFF;
							l_red = (l_color >> 16) & 0xFF;
							l_blue = (l_blue * 255) / l_alpha;
							l_green = (l_green * 255) / l_alpha;
							l_red = (l_red * 255) / l_alpha;
							l_color = (l_alpha << 24) | (l_red << 16) | (l_green << 8) | l_blue;
						}
						l_destination[(i * l_destination_pitch) + j] = l_color;
					}
				}
			]"
		end

	postmultiply_to_premultiply(
							a_source, a_destination:POINTER;
							a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER
						)
			-- Since Cairo use premultiplied alpha value and the game library use
			-- a postmultiplied alpha value, a transcription need to be made. This
			-- copy the data (in postmultiplied format) in `a_souce' to `a_destination'
			-- (in premultiplied format). The matrix of pixel is `a_width' x `a_height'
			-- and the lenght of each line in `a_source' is `a_source_pitch' and in
			-- `a_destination', it is `a_destination_pitch'.
		external
			"C inline use <stdint.h>"
		alias
			"[
				uint32_t *l_source = (uint32_t *)$a_source;
				uint32_t *l_destination = (uint32_t *)$a_destination;
				int i, j;
				uint32_t l_color, l_alpha, l_red, l_green, l_blue;
				int l_source_pitch = $a_source_pitch / 4;
				int l_destination_pitch = $a_destination_pitch / 4;
				for(i=0; i < $a_height; i = i + 1)
				{
					for(j=0; j < $a_width; j = j + 1)
					{
						l_color = l_source[(i * l_source_pitch) + j];
						l_alpha = (l_color >> 24) & 0xFF;
						if (l_alpha != 0)
						{
							l_blue = l_color & 0xFF;
							l_green = (l_color >> 8) & 0xFF;
							l_red = (l_color >> 16) & 0xFF;
							l_blue = (l_blue * l_alpha) / 255;
							l_green = (l_green * l_alpha) / 255;
							l_red = (l_red * l_alpha) / 255;
							l_color = (l_alpha << 24) | (l_red << 16) | (l_green << 8) | l_blue;
						}
						l_destination[(i * l_destination_pitch) + j] = l_color;
					}
				}
			]"
		end
end
