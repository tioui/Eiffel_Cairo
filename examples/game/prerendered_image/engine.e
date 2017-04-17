note
	description: "The main manager of the game."
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
	revision: "0.1"
	license: "GPL Version 3"

class
	ENGINE

inherit
	GAME_LIBRARY_SHARED
create
	make

feature {NONE} -- Initialization

	make
			-- Initialization of `Current'
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_pixel_format:CAIRO_PIXEL_FORMAT
			l_cairo_surface:CAIRO_SURFACE_IMAGE
			l_context:CAIRO_CONTEXT
			l_game_surface:GAME_SURFACE_CAIRO
		do
			game_library.enable_video

			create l_pixel_format.make_argb32
			create l_cairo_surface.make (l_pixel_format, 50, 50)
			create l_context.make (l_cairo_surface)

			-- Clear the l_context
			l_context.set_source_rgba (0, 0, 0, 0)
			l_context.move_to (0, 0)
			l_context.line_to (l_cairo_surface.width, 0)
			l_context.line_to (l_cairo_surface.width, l_cairo_surface.height)
			l_context.line_to (0, l_cairo_surface.height)
			l_context.line_to (0, 0)
			l_context.fill

			-- Create a semitransparent triangle
			l_context.set_source_rgba (1, 0, 0, 0.5)
			l_context.move_to (10, 10)
			l_context.line_to (40, 10)
			l_context.line_to (25, 40)
			l_context.line_to (10, 10)
			l_context.fill

			l_cairo_surface.show_page

			create l_game_surface.make_from_cairo_surface (l_cairo_surface)

			create l_window_builder
			window := l_window_builder.generate_window
			create texture.make_from_surface (window.renderer, l_game_surface)
		end

feature -- Access

	run
			-- Execute `Current'
		do
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.launch
		end

	window:GAME_WINDOW_RENDERED
			-- The Window to draw `texture'

	texture:GAME_TEXTURE
			-- The image to show

	on_iteration(a_timestamp:NATURAL)
			-- Launched at each frame
		do
			window.renderer.clear
			window.renderer.draw_texture (texture, 100, 100)
			window.renderer.present
		end

	on_quit(a_timestamp:NATURAL)
			-- When the user close the application.
		do
			game_library.stop
		end

end
