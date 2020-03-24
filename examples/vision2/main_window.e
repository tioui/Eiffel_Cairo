note
	description: "Main window for this application"
	author: "Generated by the New Vision2 Application Wizard."
	date: "$Date: 2018/1/19 12:57:22 $"
	revision: "1.0.0"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize,
			is_in_default_state
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy
		end

	DOUBLE_MATH
		undefine
			default_create, copy
		end

create
	default_create

feature {NONE} -- Initialization

	create_interface_objects
			-- <Precursor>
		do
				-- Create main container.
			create main_container
			create drawing_area
		end

	initialize
			-- Build the interface for this window.
		do
			Precursor {EV_TITLED_WINDOW}

			build_main_container
			extend (main_container)


				-- Execute `request_close_window' when the user clicks
				-- on the cross in the title bar.
			close_request_actions.extend (agent request_close_window)

				-- Set the title of the window.
			set_title (Window_title)

				-- Set the initial size of the window.
			set_size (Window_width, Window_height)
		end

	is_in_default_state: BOOLEAN
			-- Is the window in its default state?
			-- (as stated in `initialize')
		do
			Result := (width = Window_width) and then
				(height = Window_height) and then
				(title.is_equal (Window_title))
		end


feature {NONE} -- Implementation, Close event

	request_close_window
			-- Process user request to close the window.
		local
			question_dialog: EV_CONFIRMATION_DIALOG
		do
			create question_dialog.make_with_text (Label_confirm_close_window)
			question_dialog.show_modal_to_window (Current)

			if question_dialog.selected_button ~ (create {EV_DIALOG_CONSTANTS}).ev_ok then
					-- Destroy the window.
				destroy

					-- End the application.
					--| TODO: Remove next instruction if you don't want the application
					--|       to end when the first window is closed..
				if attached (create {EV_ENVIRONMENT}).application as a then
					a.destroy
				end
			end
		end

feature {NONE} -- Implementation

	main_container: EV_VERTICAL_BOX
			-- Main container (contains all widgets displayed in this window).

	build_main_container
			-- Populate `main_container'.
		do
			main_container.extend (drawing_area)
			drawing_area.expose_actions.extend(agent refresh_drawing_area)
		ensure
			main_container_created: main_container /= Void
		end



	drawing_area:EV_DRAWING_AREA


	refresh_drawing_area(x, y, a_width, a_height: INTEGER)
		local
			l_arc:CAIRO_SURFACE_IMAGE
			l_pixel_buffer:EV_PIXEL_BUFFER_CAIRO
			l_pixmap:EV_PIXMAP
		do
			drawing_area.clear
			l_arc := create_arc
			create l_pixel_buffer.make_from_cairo_surface (l_arc)
			create l_pixmap.make_with_pixel_buffer (l_pixel_buffer)
			drawing_area.draw_sub_pixel_buffer (0, 0, l_pixel_buffer, create {EV_RECTANGLE}.make (0, 0, l_pixel_buffer.width, l_pixel_buffer.height))
		end


	create_arc:CAIRO_SURFACE_IMAGE
			-- Draw an arc
		local
			l_context:CAIRO_CONTEXT
			l_surface:CAIRO_SURFACE_IMAGE
			l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end:REAL_64
		do
			create l_surface.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, 256, 256)
			create l_context.make (l_surface)

			-- Draw the arc
			l_context.set_source_rgba (0, 0, 0, 1)
			l_x_center := 128
			l_y_center := 128
			l_radius := 100
			l_angle_start := 45  * (Pi/180)			-- Angle are specified
			l_angle_end := 180.0 * (Pi/180.0)		-- In radians
			l_context.set_line_width (10)
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_end)
			l_context.stroke

			-- Draw the helpers
			l_context.set_source_rgba (0.2, 1, 1, 0.6)
			l_context.set_line_width (6)
			l_context.arc (l_x_center, l_y_center, 10, 0, 2*Pi)
			l_context.fill
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_start, l_angle_start)
			l_context.line_to (l_x_center, l_y_center)
			l_context.arc (l_x_center, l_y_center, l_radius, l_angle_end, l_angle_end)
			l_context.line_to (l_x_center, l_y_center)
			l_context.stroke

			l_surface.show_page

			Result := l_surface

		end


feature {NONE} -- Implementation / Constants

	Window_title: STRING = "eiffel_cairo_vision2"
			-- Title of the window.

	Window_width: INTEGER = 400
			-- Initial width for this window.

	Window_height: INTEGER = 400
			-- Initial height for this window.

end