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
		rename
			share_from_other as share_surface_from_other,
			make_from_other as make_surface_from_other,
			make_for_window as make_surface_for_window,
			make_for_pixel_format as make_surface_for_pixel_format,
			make_for_display as make_surface_for_display,
			make as make_surface,
			make_for_display_mode as make_surface_for_display_mode
		end
	GAME_CAIRO_STREAMING

create
	make,
	share_from_other,
	make_from_other,
	make_from_cairo,
	make_for_window,
	make_for_display,
	make_for_display_mode,
	make_from_cairo_surface

feature {NONE} -- Initialization

	share_from_other(a_other:GAME_SURFACE)
			-- Create a `Current' from `a_other'.
			-- The image source in memory is not copied.
			-- If multiple surface is done with the same `image',
			-- every modification to surface will affect all.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
			Surface_Make_Other_Opened: a_other.is_open
			Is_Pixel_Format_Valid: 	a_other.pixel_format.is_argb8888 or
									a_other.pixel_format.is_rgb565 or
									a_other.pixel_format.is_argb2101010
		do
			share_from_image(a_other.image)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make_from_other(a_other:GAME_SURFACE)
			-- Create a `Current' from `a_other'.
			-- The image source in memory will be copied.
			-- Slower than `share_from_other' and use more memory.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
			Surface_Make_Other_Opened: a_other.is_open
			Is_Pixel_Format_Valid: 	a_other.pixel_format.is_argb8888 or
									a_other.pixel_format.is_rgb565 or
									a_other.pixel_format.is_argb2101010
		do
			make_from_image(a_other.image)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make_for_window(a_window:GAME_WINDOW; a_width,a_height:INTEGER)
			-- Create an empty `Current' of dimension `a_width' x `a_height'
			-- conforming to `a_window'.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
			Is_Pixel_Format_Valid: 	a_window.pixel_format.is_argb8888 or
									a_window.pixel_format.is_rgb565 or
									a_window.pixel_format.is_argb2101010
		do
			make_for_pixel_format(a_window.pixel_format,a_width,a_height)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make_for_display(a_display:GAME_DISPLAY; a_width,a_height:INTEGER)
			-- Create an empty `Current' of dimension `a_width' x `a_height'
			-- conforming to `a_display'.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
			Is_Pixel_Format_Valid: 	a_display.current_mode.pixel_format.is_argb8888 or
									a_display.current_mode.pixel_format.is_rgb565 or
									a_display.current_mode.Pixel_format.is_argb2101010
		do
			make_for_display_mode(a_display.current_mode,a_width,a_height)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make(a_width,a_height:INTEGER)
			-- Create an empty `Current' of dimension `a_width' x `a_height'
			-- conforming to the first founded {GAME_DISPLAY}.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
		local
			l_pixel_format:GAME_PIXEL_FORMAT
		do
			create l_pixel_format
			l_pixel_format.set_argb8888
			make_for_pixel_format(l_pixel_format, a_width, a_height)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make_for_display_mode(a_display_mode:GAME_DISPLAY_MODE; a_width,a_height:INTEGER)
			-- Create an empty `Current' of dimension `a_width' x `a_height'
			-- conforming to `a_display_mode'.
		require
			Surface_Make_Video_Enabled: game_library.is_video_enable
			Is_Pixel_Format_Valid: 	a_display_mode.pixel_format.is_argb8888 or
									a_display_mode.pixel_format.is_rgb565 or
									a_display_mode.pixel_format.is_argb2101010
		do
			make_for_pixel_format(a_display_mode.pixel_format,a_width,a_height)
		ensure
			Surface_Make_is_open: has_error or is_open
		end

	make_for_pixel_format(a_pixel_format: GAME_PIXEL_FORMAT_READABLE; a_width, a_height: INTEGER_32)
			-- Create an empty `Current` of dimension `a_width` x `a_height`
			-- conforming to `a_pixel_format`.
		require
			surface_make_video_enabled: Game_library.is_video_enable
			Is_Pixel_Format_Valid: 	a_pixel_format.is_argb8888 or a_pixel_format.is_rgb565 or
									a_pixel_format.is_argb2101010
		do
			make_surface_for_pixel_format (a_pixel_format, a_width, a_height)
		ensure
			surface_make_is_open: has_error or is_open
		end

	make_from_cairo(a_pixel_buffer:CAIRO_PIXEL_BUFFER)
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
			make_from_cairo(a_cairo_surface.pixel_buffer)
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
