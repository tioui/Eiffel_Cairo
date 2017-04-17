note
	description: "The main manager of th game"
	author: "Louis Marchand"
	date: "Mon, 17 Apr 2017 15:27:49 +0000"
	revision: "0.1"

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
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_scene, l_tower:CAIRO_SURFACE_IMAGE
			l_game_surface_scene, l_game_cairo_surface_tower:GAME_SURFACE_CAIRO
			l_game_surface_tower:GAME_SURFACE
			l_tower_image:IMG_IMAGE_FILE
			l_context:CAIRO_CONTEXT
			l_pattern:CAIRO_PATTERN_GRADIENT_LINEAR
			l_pixel_format:GAME_PIXEL_FORMAT
		do
			game_library.enable_video
			create l_window_builder
			window := l_window_builder.generate_window

			create l_scene.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 200, 300)
			create l_context.make (l_scene)

			-- Creating the sunset
			create l_pattern.make (50, 200, 200, 300)
			l_pattern.add_color_stop_rgb (0, 1, 0.8, 0)
			l_pattern.add_color_stop_rgb (100, 1, 0, 0)
			l_context.set_source (l_pattern)
			l_context.arc (100, 250, 100, 0, 2*Pi)
			l_context.fill

			-- Creating the tower
			create l_tower_image.make ("tower.png")
			if l_tower_image.is_openable then
				l_tower_image.open
				if l_tower_image.is_open then
					create l_game_surface_tower.share_from_image (l_tower_image)
					create l_pixel_format
					l_pixel_format.set_argb8888
					create l_game_cairo_surface_tower.make_from_other (l_game_surface_tower.as_converted_to_pixel_format (l_pixel_format))
					l_tower := l_game_cairo_surface_tower.translated_cairo_surface
					l_context.set_source_surface (l_tower, 1, 0)
					l_context.move_to (0, 0)
					l_context.line_to (0, l_tower.height)
					l_context.line_to (l_tower.width, l_tower.height)
					l_context.line_to (l_tower.width, 0)
					l_context.line_to (0, 0)
					l_context.fill
				end
			end

			l_scene.show_page

			create l_game_surface_scene.make_from_cairo_surface (l_scene)
			create scene.make_from_surface(window.renderer, l_game_surface_scene)

		end

feature -- Access

	run
			-- Execution of `Current'
		do
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.launch
		end

	scene:GAME_TEXTURE

	window:GAME_WINDOW_RENDERED

feature {NONE} -- Initialization

	on_iteration(a_timestamp:NATURAL)
			-- Launched at each frame
		do
			window.renderer.set_drawing_color (create {GAME_COLOR}.make_rgb (255, 255, 255))
			window.renderer.clear
			window.renderer.draw_texture (scene, 100, 100)
			window.update
		end

	on_quit(a_timestamp:NATURAL)
			-- Lanched when the user quit the application
		do
			game_library.stop
		end

end
