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
	GAME_CAIRO_STREAMING

create
	make
	
end
