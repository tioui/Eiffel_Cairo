note
	description: "A {CAIRO_SURFACE} in memory"
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_SURFACE_IMAGE

inherit
	CAIRO_SURFACE
		rename
			make_similar as make_similar_with_content_type
		end

create
	make,
	make_similar,
	make_with_pixel_buffer

feature {NONE} -- Implementation

	make(a_pixel_format:CAIRO_PIXEL_FORMAT; a_width, a_height:INTEGER)
		require
			Width_Positive: a_width >= 0
			Height_Positive: a_height >= 0
		do
			item := {CAIRO_EXTERNALS}.cairo_image_surface_create(a_pixel_format.item, a_width, a_height)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
			Is_Format_Assign: is_valid implies pixel_format ~ a_pixel_format
			Is_Width_Assign: is_valid implies width ~ a_width
			Is_Height_Assign: is_valid implies height ~ a_height
		end

	make_with_pixel_buffer(a_pixel_buffer:CAIRO_PIXEL_BUFFER)
		do
			item := {CAIRO_EXTERNALS}.cairo_image_surface_create_for_data(
												a_pixel_buffer.item,
												a_pixel_buffer.pixel_format.item,
												a_pixel_buffer.width, a_pixel_buffer.height,
												a_pixel_buffer.stride
											)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
			Is_Format_Assign: is_valid implies pixel_format ~ a_pixel_buffer.pixel_format
			Is_Width_Assign: is_valid implies width ~ a_pixel_buffer.width
			Is_Height_Assign: is_valid implies height ~ a_pixel_buffer.height
			Is_Stride_Assign: is_valid implies stride ~ a_pixel_buffer.stride
		end

	make_similar(a_other:CAIRO_SURFACE; a_pixel_format:CAIRO_PIXEL_FORMAT; a_width, a_height:INTEGER)
			-- Initialization of `Current' that is as compatible as possible for uploading to and
			-- the use in conjunction with `a_other'. Using `a_pixel_format' as `pixel_format',
			-- `a_width' as `width' and `a_height' as `height'
		require
			Other_Valid: a_other.is_valid
			Width_Positive: a_width >= 0
			Height_Positive: a_height >= 0
		do
			item := {CAIRO_EXTERNALS}.cairo_surface_create_similar_image(
														a_other.item,
														a_pixel_format.item,
														a_width, a_height
													)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
			Is_Format_Assign: is_valid implies pixel_format ~ a_pixel_format
			Is_Width_Assign: is_valid implies width ~ a_width
			Is_Height_Assign: is_valid implies height ~ a_height
		end

feature -- Access

	pixel_format:CAIRO_PIXEL_FORMAT
			-- The reprensentation of the pixels in memory
		require
			Is_Valid:is_valid
		do
			create Result.make_from_item ({CAIRO_EXTERNALS}.cairo_image_surface_get_format(item))
		end

	width:INTEGER
			-- Horizontal dimension of `Current'
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_image_surface_get_width(item)
		end

	height:INTEGER
			-- Horizontal dimension of `Current'
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_image_surface_get_height(item)
		end

	stride:INTEGER
			-- Number of bytes between the start of rows in the memory pixel.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_image_surface_get_stride(item)
		end

	pixel_buffer:CAIRO_PIXEL_BUFFER
			-- The pixels of `Current'
		require
			Is_Valid:is_valid
		local
			l_pointer:POINTER
		do
			l_pointer := {CAIRO_EXTERNALS}.cairo_image_surface_get_data(item)
			create Result.share_from_pointer (pixel_format, l_pointer, width, height, stride)
		end

	pixel_buffer_copy:CAIRO_PIXEL_BUFFER
			-- A copy of the pixels of `Current'
		require
			Is_Valid:is_valid
		local
			l_pointer:POINTER
		do
			{CAIRO_EXTERNALS}.cairo_surface_flush(item)
			l_pointer := {CAIRO_EXTERNALS}.cairo_image_surface_get_data(item)
			create Result.make_from_pointer (pixel_format, l_pointer, width, height, stride)
		end
end
