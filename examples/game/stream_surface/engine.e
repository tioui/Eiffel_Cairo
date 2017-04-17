note
	description: "Main manager for the game."
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
	revision: "0.1"
	license: "GPL Version 3"

class
	ENGINE

inherit
	GAME_LIBRARY_SHARED
	DOUBLE_MATH

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization of `Current'
		local
			l_game_pixel_format:GAME_PIXEL_FORMAT
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
		do
			angle := 0
			game_library.enable_video
			create l_window_builder
			window := l_window_builder.generate_window
			create l_game_pixel_format
			l_game_pixel_format.set_argb8888
			create game_surface.make_for_pixel_format (l_game_pixel_format, 50, 50)
		end

feature -- Access

	run
			-- Execute `Current'
		do
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.launch
		end

	window:GAME_WINDOW_SURFACED
			-- The window to draw `game_surface'

	game_surface:GAME_SURFACE_CAIRO
			-- The image to show on `window'

	on_iteration(a_timestamp:NATURAL)
			-- Launched at each frame
		local
			l_surface:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
		do

			game_surface.lock
			l_surface := game_surface.cairo_surface
			create l_context.make (l_surface)

			-- Clear the l_context
			l_context.set_source_rgb (0, 0, 0)
			l_context.move_to (0, 0)
			l_context.line_to (game_surface.width, 0)
			l_context.line_to (game_surface.width, game_surface.height)
			l_context.line_to (0, game_surface.height)
			l_context.line_to (0, 0)
			l_context.fill

			-- Draw the arc
			l_context.set_source_rgb (1, 0, 0)
			l_context.move_to (25, 25)
			l_context.arc (25, 25, 15, 0, angle)
			l_context.line_to (25, 25)
			l_context.fill

			l_surface.show_page
			game_surface.unlock


			window.surface.draw_surface (game_surface, 100, 100)
			window.update

			angle := angle + 0.01
			if angle > 2 * Pi then
				angle := 0
			end
		end

	on_quit(a_timestamp:NATURAL)
			-- Launched when the usr close the application
		do
			game_library.stop
		end

	angle:REAL_64
			-- The next angle that the arc will have.


end
