note
	description: "Class to represent the most basic drawing tools."
	author: "Louis Marchand"
	date: "Sun, 09 Apr 2017 15:09:40 +0000"
	revision: "0.1"
	ToDo: "Getting the data points. See: https://www.cairographics.org/manual/cairo-Paths.html#cairo-path-data-t"

class
	CAIRO_PATH

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		redefine
			make
		end
	CAIRO_DEVICE_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make,
	make_shared

feature {NONE} -- Initialization

	make(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		do
			item := a_item
			error_code := {CAIRO_EXTERNALS}.get_cairo_path_struct_status(item)
			is_valid := is_success
			is_shared := False
		end

	make_shared(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		require
			Item_Exists: not a_item.is_default_pointer
		do
			make(a_item)
			is_shared := True
		ensure
			Exists: not item.is_default_pointer
		end

feature {CAIRO_ANY} -- Implementation

	is_shared:BOOLEAN
			-- If `True', `dispose' will not free the memory uesd in `Current'

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			if not is_shared then
				{CAIRO_EXTERNALS}.cairo_path_destroy(item)
			end
		end

end
