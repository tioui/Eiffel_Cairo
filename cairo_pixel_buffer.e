note
	description: "A memory buffer containing pixels data."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_PIXEL_BUFFER

inherit
	CAIRO_ANY
	DISPOSABLE

create
	make,
	make_from_pointer,
	own_from_pointer,
	share_from_pointer

feature {NONE} -- Initialization

	make(a_pixel_format:CAIRO_PIXEL_FORMAT; a_width, a_height:INTEGER)
			-- Initialization of `Current' using `a_pixel_format' as `pixel_format'
			-- `a_width' as `width' and `a_height' as `height'
		do
			pixel_format := a_pixel_format
			width := a_width
			height := a_height
			stride := {CAIRO_EXTERNALS}.cairo_format_stride_for_width(a_pixel_format.item, a_width)
			item := item.memory_alloc (stride * height)
			is_shared := False
		end

	make_from_pointer(a_pixel_format:CAIRO_PIXEL_FORMAT; a_item:POINTER; a_width, a_height, a_stride:INTEGER)
			-- Initialization of `Current' using `a_pixel_format' as `pixel_format', a copy of `a_item' as `item',
			-- `a_width' as `width', `a_height' as `height' and `a_stride' as `stride'. `a_item' will not be freed
			-- at collection.
		do
			pixel_format := a_pixel_format
			width := a_width
			height := a_height
			stride := a_stride
			item := item.memory_alloc (stride * height)
			item.memory_copy (a_item, stride * height)
			is_shared := False
		end

	share_from_pointer(a_pixel_format:CAIRO_PIXEL_FORMAT; a_item:POINTER; a_width, a_height, a_stride:INTEGER)
			-- Initialization of `Current' using `a_pixel_format' as `pixel_format', `a_item' as `item',
			-- `a_width' as `width', `a_height' as `height' and `a_stride' as `stride'. `a_item' will not be freed
			-- at collection.
		do
			pixel_format := a_pixel_format
			width := a_width
			height := a_height
			stride := a_stride
			item := a_item
			is_shared := True
		end

	own_from_pointer(a_pixel_format:CAIRO_PIXEL_FORMAT; a_item:POINTER; a_width, a_height, a_stride:INTEGER)
			-- Initialization of `Current' using `a_pixel_format' as `pixel_format', `a_item' as `item',
			-- `a_width' as `width', `a_height' as `height' and `a_stride' as `stride'. `a_item' will be freed
			-- at collection.
		do
			pixel_format := a_pixel_format
			width := a_width
			height := a_height
			stride := a_stride
			item := a_item
			is_shared := False
		end

feature -- Access

	pixel_format:CAIRO_PIXEL_FORMAT
			-- The format of the pixels in `Current'

	width:INTEGER
			-- Horizontal dimension of `Current'

	height:INTEGER
			-- Vertical dimension of `Current'

	stride:INTEGER
			-- Number of bytes between the start of rows in the buffer as allocated.

	item:POINTER
			-- Internal pointer to the pixel data

	is_shared:BOOLEAN
			-- `item' must not be freed at collection


feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			if not is_shared then
				item.memory_free
			end
		end
end
