note
	description: "A {CAIRO_PATTERN} created from a surface."
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_SURFACE

inherit
	CAIRO_PATTERN
		rename
			make_from_item as make_pattern_from_item
		end

create {CAIRO_ANY}
	make_from_item

create
	make

feature {NONE} -- Initialization

	make_from_item(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		require
			Item_Not_Null: not a_item.is_default_pointer
			Item_Type_Valid: {CAIRO_EXTERNALS}.cairo_pattern_get_type(a_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_SURFACE
		local
			l_surface_item:POINTER
		do
			make_pattern_from_item(a_item)
			error_code :=  {CAIRO_EXTERNALS}.cairo_pattern_get_surface(item, $l_surface_item)
			create surface.make_from_item (l_surface_item)
		end

	make(a_surface:CAIRO_SURFACE)
			-- Initialization of `Current' using `a_surface' as `surface'
		do
			item := {CAIRO_EXTERNALS}.cairo_pattern_create_for_surface(a_surface.item)
			surface := a_surface
			validate_item
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

feature -- Access

	surface:CAIRO_SURFACE

end
