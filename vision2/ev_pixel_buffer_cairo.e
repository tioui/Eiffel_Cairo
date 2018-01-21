note
	description: "An {EV_PIXEL_BUFFER} used to transfert pixel data from and to a {CAIRO_SURFACE_IMAGE} or {CAIRO_PIXEL_BUFFER}"
	author: "Louis Marchand"
	date: "Sat, 20 Jan 2018 18:39:47 +0000"
	revision: "0.1"

class
	EV_PIXEL_BUFFER_CAIRO

inherit
	EV_PIXEL_BUFFER
		redefine
			make_with_pixmap, make_with_size
		end


create
	make,
	make_with_pixmap,
	make_with_size,
	make_from_cairo_pixel_buffer,
	make_from_cairo_surface

feature {NONE} -- Initialization

	make
			-- Initialization of `Current'
		do
			create premultiplier
			default_create
		ensure
			is_coupled: implementation /= Void
			is_initialized: is_initialized
			default_create_called: default_create_called
			is_in_default_state: is_in_default_state
		end

	make_with_pixmap (a_pixmap: EV_PIXMAP)
			-- <Precursor>
		do
			create premultiplier
			Precursor(a_pixmap)
		end

	make_with_size (a_width, a_height: INTEGER)
			-- <Precursor>
		do
			create premultiplier
			Precursor(a_width, a_height)
		end


	make_from_cairo_pixel_buffer(a_cairo_pixel_buffer:CAIRO_PIXEL_BUFFER)
			-- Initialization of `Current' copying (and adapting) the data
			-- in `a_cairo_pixel_buffer' inside `Current'
		require
			Cairo_Pixel_Buffer_Format_Valid: a_cairo_pixel_buffer.pixel_format.is_argb32
		do
			make_with_size (a_cairo_pixel_buffer.width, a_cairo_pixel_buffer.height)
			updating_from_cairo_pixel_buffer (a_cairo_pixel_buffer, 0, 0, width, height)
		end

	make_from_cairo_surface(a_cairo_surface:CAIRO_SURFACE_IMAGE)
			-- Initialization of `Current' copying (and adapting) the data
			-- in `a_cairo_surface' inside `Current'
		require
			Cairo_Surface_Pixel_Format_Valid: a_cairo_surface.pixel_buffer.pixel_format.is_argb32
		do
			make_from_cairo_pixel_buffer(a_cairo_surface.pixel_buffer)
		end

feature -- Access


	updating_from_cairo_pixel_buffer(a_cairo_pixel_buffer:CAIRO_PIXEL_BUFFER; a_from_x, a_from_y, a_width, a_height:INTEGER)
		require
			Cairo_Pixel_Buffer_Format_Valid: a_cairo_pixel_buffer.pixel_format.is_argb32
			Cairo_Pixel_Buffer_Width_Valid: a_from_x + a_width <= a_cairo_pixel_buffer.width
			Width_Valid: a_from_x + a_width <= width
			Cairo_Pixel_Buffer_Height_Valid: a_from_y + a_height <= a_cairo_pixel_buffer.height
			Width_Valid: a_from_y + a_height <= height
		local
			l_pointer: POINTER
		do
			if attached {EV_PIXEL_BUFFER_IMP} implementation as l_imp then
				l_pointer := l_imp.data_ptr
				if not l_pointer.is_default_pointer then
					premultiplier.updating_vision2_from_cairo(
										a_cairo_pixel_buffer.item, l_pointer,
										a_from_x, a_from_y,
										a_width, a_height,
										a_cairo_pixel_buffer.stride, width * 4
									)
					l_imp.unlock
				end
			end
		end

	updating_from_cairo_surface(a_cairo_surface:CAIRO_SURFACE_IMAGE; a_from_x, a_from_y, a_width, a_height:INTEGER)
		require
			Cairo_Surface_Pixel_Format_Valid: a_cairo_surface.pixel_format.is_argb32
			Cairo_Surface_Width_Valid: a_from_x + a_width <= a_cairo_surface.width
			Width_Valid: a_from_x + a_width <= width
			Cairo_Surface_Height_Valid: a_from_y + a_height <= a_cairo_surface.height
			Width_Valid: a_from_y + a_height <= height
		do
			updating_from_cairo_pixel_buffer(a_cairo_surface.pixel_buffer, a_from_x, a_from_y, a_width, a_height)
		end

	updating_cairo_pixel_buffer(a_cairo_pixel_buffer:CAIRO_PIXEL_BUFFER; a_from_x, a_from_y, a_width, a_height:INTEGER)
		require
			Cairo_Pixel_Buffer_Format_Valid: a_cairo_pixel_buffer.pixel_format.is_argb32
			Cairo_Pixel_Buffer_Width_Valid: a_from_x + a_width <= a_cairo_pixel_buffer.width
			Width_Valid: a_from_x + a_width <= width
			Cairo_Pixel_Buffer_Height_Valid: a_from_y + a_height <= a_cairo_pixel_buffer.height
			Width_Valid: a_from_y + a_height <= height
		local
			l_pointer: POINTER
		do
			if attached {EV_PIXEL_BUFFER_IMP} implementation as l_imp then
				l_pointer := l_imp.data_ptr
				if not l_pointer.is_default_pointer then
					premultiplier.updating_cairo_from_vision2(
										l_pointer, a_cairo_pixel_buffer.item,
										a_from_x, a_from_y,
										a_width, a_height,
										width * 4, a_cairo_pixel_buffer.stride
									)
					l_imp.unlock
				end
			end
		end

	updating_cairo_surface(a_cairo_surface:CAIRO_SURFACE_IMAGE; a_from_x, a_from_y, a_width, a_height:INTEGER)
		require
			Cairo_Surface_Format_Valid: a_cairo_surface.pixel_format.is_argb32
			Cairo_Surface_Width_Valid: a_from_x + a_width <= a_cairo_surface.width
			Width_Valid: a_from_x + a_width <= width
			Cairo_Surface_Height_Valid: a_from_y + a_height <= a_cairo_surface.height
			Width_Valid: a_from_y + a_height <= height
		do
			updating_cairo_pixel_buffer(a_cairo_surface.pixel_buffer, a_from_x, a_from_y, a_width, a_height)
		end


	translated_cairo_pixel_buffer:CAIRO_PIXEL_BUFFER
			-- Translate the pixels of `Current' into a {CAIRO_PIXEL_BUFFER}
			-- (Including alpha value)
			-- The translation can be heavy. Should not be used in real time streaming
		do
			create Result.make (create {CAIRO_PIXEL_FORMAT}.make_argb32, width, height)
			updating_cairo_pixel_buffer(Result, 0, 0, width, height)
		end

	translated_cairo_surface:CAIRO_SURFACE_IMAGE
			-- Translate the pixels of `Current' into a {CAIRO_SURFACE}
			-- (Including alpha value)
			-- The translation can be heavy. Should not be used in real time streaming
		do
			create Result.make_with_pixel_buffer (translated_cairo_pixel_buffer)
		end


feature {NONE} -- Implementation

	premultiplier:EV_PIXEL_BUFFER_CAIRO_PREMULTIPLIER
			-- Internal implementation of `Current'

end
