note
	description: "[
					A {GAME_SURFACE} that can be streamed from a {CAIRO_SURFACE_IMAGE}.
					Note that you cannot used transparency when streaming to `Current'
				]"
	author: "Louis Marchand"
	date: "Sat, 15 Apr 2017 00:56:53 +0000"
	revision: "0.1"

class
	GAME_SURFACE_STREAMING_CAIRO

inherit
	GAME_SURFACE
		rename
			make as make_surface
		end
	GAME_CAIRO_STREAMING

create
	make

feature {NONE} -- Initialization

	make(a_pixel_format: GAME_PIXEL_FORMAT_READABLE; a_width, a_height: INTEGER_32)
			-- Create an empty `Current` of dimension `a_width` x `a_height`
			-- conforming to `a_pixel_format`.
		require
			surface_make_video_enabled: Game_library.is_video_enable
			Is_Pixel_Format_Valid: 	a_pixel_format.is_argb8888 or a_pixel_format.is_rgb565 or
									a_pixel_format.is_argb2101010
		do
			make_for_pixel_format (a_pixel_format, a_width, a_height)
		ensure
			surface_make_is_open: has_error or is_open
		end
end
