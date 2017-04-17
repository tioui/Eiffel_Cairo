note
	description: "[
					A {GAME_TEXTURE_STREAMING} that can be streamed from a {CAIRO_SURFACE_IMAGE}.
					Note that you cannot used transparency when streaming to `Current'
				]"
	author: "Louis Marchand"
	date: "Sat, 15 Apr 2017 00:56:53 +0000"
	revision: "0.1"

class
	GAME_TEXTURE_CAIRO

inherit
	GAME_TEXTURE_STREAMING
		rename
			make as make_streaming_texture
		end
	GAME_CAIRO_STREAMING

create
	make

feature {NONE} -- Initialization

	make(a_renderer:GAME_RENDERER; a_pixel_format:GAME_PIXEL_FORMAT_READABLE;
							a_width, a_height:INTEGER)
			-- Initialization for `CuRrent' of dimension (`a_width' , `a_height)
			-- for use on `a_renderer', having `a_pixel_format'. `Current'
			-- can be locked to be modified with cairo (using `cairo_surface')
			-- Be careful, streaming cairo value does not support alpha.
		require
			Is_Pixel_Format_Valid: 	a_pixel_format.is_argb8888 or a_pixel_format.is_rgb565 or
									a_pixel_format.is_argb2101010
		do
			make_streaming_texture(a_renderer, a_pixel_format, a_width, a_height)
		ensure
			Error_Or_Exist: not has_error implies exists
			Is_Not_Shared: not shared
			Is_Streamable: is_streamable
		end
end
