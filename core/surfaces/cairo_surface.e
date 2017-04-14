note
	description: "[
					Represents an image, either as the destination of a drawing operation or 
					as source when drawing onto another surface.
				]"
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_SURFACE

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		rename
			make as make_from_item
		redefine
			make_from_item
		end
	CAIRO_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make_from_item

create
	make_sub_surface,
	make_similar

feature {NONE} -- Implementation

	make_similar(a_other:CAIRO_SURFACE; a_content:CAIRO_CONTENT_TYPE; a_width, a_height:INTEGER)
			-- Initialization of `Current' that is as compatible as possible with `a_other'
			-- `Current' will have only content base on `a_content' and will have a dimension
			-- of `a_width'x`a_height'.
		do
			item := {CAIRO_EXTERNALS}.cairo_surface_create_similar(
														a_other.item,
														a_content.item,
														a_width, a_height
													)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_sub_surface(a_other:CAIRO_SURFACE; a_x, a_y, a_width, a_height:REAL_64)
			-- Initialization of `Current' representing a section of `a_other'
			-- delimited by th point (`a_x',`a_y') with the dimension `a_width'x`a_height'.
			-- It is to note that `a_x', `a_y', `a_width' and `a_height' are in device space
			-- unit.
		do
			item := {CAIRO_EXTERNALS}.cairo_surface_create_for_rectangle(
														a_other.item,
														a_x, a_y,
														a_width, a_height
													)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_from_item(a_item:POINTER)
			-- <Precursor>
		do
			item := {CAIRO_EXTERNALS}.cairo_surface_reference(a_item)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		end

feature -- Access

	content_type:CAIRO_CONTENT_TYPE
			-- Type of content in `Current'
		require
			Is_Valid:is_valid
		do
			create Result.make({CAIRO_EXTERNALS}.cairo_surface_get_content(item))
		end

	mark_dirty
			-- `Current' has been modified from the extern and must be redraw
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_mark_dirty(item)
			check_for_error
		end

	mark_dirty_portion(a_x, a_y, a_width, a_height:INTEGER)
			-- A portion of `Current' has been modified from the extern and must be redraw.
			-- The portion is delimited by the point (`a_x',`a_y') and the dimension
			-- `a_width' x `a_height'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_mark_dirty_rectangle(item, a_x, a_y, a_width, a_height)
			check_for_error
		end

	device:CAIRO_DEVICE
			-- The device type used as backend for `Current'
		require
			Is_Valid:is_valid
		do
			create Result.make({CAIRO_EXTERNALS}.cairo_surface_get_device(item))
			check_for_error
		end

	device_offset:TUPLE[x, y:REAL_64]
			-- Offset that is added to the device coordinates determined
			-- by the CTM when drawing to `Current'
		require
			Is_Valid:is_valid
		local
			l_x, l_y:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_surface_get_device_offset(item, $l_x, $l_y)
			Result := [l_x, l_y]
		end

	set_device_offset(a_x, a_y:REAL_64)
			-- Assign `device_offset' with the value of `a_x' and `a_y'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_set_device_offset(item, a_x, a_y)
			check_for_error
		ensure
			Is_Assign: attached device_offset as la_device_offset and then
								(la_device_offset.x = a_x and
								la_device_offset.y = a_y)
		end

	flush
			-- Do any pending drawing for the surface and also restore any
			-- temporary modifications cairo has made to the surface's state
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_flush(item)
		end

	retreive_font_options(a_option:CAIRO_FONT_OPTIONS)
			-- Store the default font option of `Current' in `a_option'.
			-- All existing values are overwritten
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_get_font_options(item, a_option.item)
		end

	font_options:CAIRO_FONT_OPTIONS
			-- The default font option of `Current'
		require
			Is_Valid:is_valid
		do
			create Result
			retreive_font_options(Result)
		end

	device_scale:TUPLE[x, y:REAL_64]
			-- A scale that is multiplied to the device coordinates
			-- determined by the CTM when drawing to `Current'
		require
			Is_Valid:is_valid
		local
			l_x, l_y:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_surface_get_device_scale(item, $l_x, $l_y)
			Result := [l_x, l_y]
		end

	set_device_scale(a_x, a_y:REAL_64)
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_set_device_scale(item, a_x, a_y)
		ensure
			Is_Assign: attached device_scale as la_device_scale and then
								(la_device_scale.x = a_x and
								la_device_scale.y = a_y)
		end

	fallback_resolution:TUPLE[x_pixels_per_inch, y_pixels_per_inch:REAL_64]
			-- The horizontal and vertical resolution for image fallbacks.
		require
			Is_Valid:is_valid
		local
			l_x, l_y:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_surface_get_fallback_resolution(item, $l_x, $l_y)
			Result := [l_x, l_y]
		end

	set_fallback_resolution(a_x_pixels_per_inch, a_y_pixels_per_inch:REAL_64)
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_set_fallback_resolution(item,
									a_x_pixels_per_inch, a_y_pixels_per_inch)
		ensure
			Is_Assign: attached fallback_resolution as la_fallback_resolution and then
								(la_fallback_resolution.x_pixels_per_inch = a_x_pixels_per_inch and
								la_fallback_resolution.y_pixels_per_inch = a_y_pixels_per_inch)
		end

	copy_page
			-- Emits the current page for backends that support multiple
			-- pages, but doesn't clear it
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_copy_page(item)
		end

	show_page
			-- Emits and clears the current page for backends that support multiple pages.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_surface_show_page(item)
		end

	can_show_text_glyphs:BOOLEAN
			-- `True' if `Current' supports sophisticated text glyph operations.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_surface_has_show_text_glyphs(item)
		end

	save_to_png(a_file_name:READABLE_STRING_GENERAL)
			-- Save the data of `Current' in the png file `a_file_name'.
		require
			File_Name_Not_Empty:not a_file_name.is_empty
		local
			l_utf_converter:UTF_CONVERTER
			l_c_filename:C_STRING
		do
			create l_utf_converter
			create l_c_filename.make (l_utf_converter.string_32_to_utf_8_string_8 (a_file_name.to_string_32))
			error_code := {CAIRO_EXTERNALS}.cairo_surface_write_to_png(item, l_c_filename.item)
		end

feature {NONE} -- Implementation

	check_for_error
			-- <Precursor>
		do
			error_code := {CAIRO_EXTERNALS}.cairo_surface_status(item)
		end

feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_surface_destroy(item)
		end

end
