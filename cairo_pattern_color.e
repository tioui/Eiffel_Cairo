note
	description: "A {CAIRO_PATTERN} that used a plain color"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_COLOR

inherit
	CAIRO_PATTERN
		rename
			make_from_item as make_pattern_from_item
		end

create {CAIRO_ANY}
	make_from_item

create
	make_from_rgb,
	make_from_rgba

feature {NONE} -- Initialization

	make_from_item(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		require
			Item_Not_Null: not a_item.is_default_pointer
			Item_Type_Valid: {CAIRO_EXTERNALS}.cairo_pattern_get_type(a_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_SOLID
		do
			make_pattern_from_item(a_item)
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

	make_from_rgb(a_red, a_green, a_blue:REAL_64)
			-- Initialization of `Current' filled with an opaque
			-- RGB color using `a_red', `a_green' and `a_blue' as
			-- color composite. Color can be clamped if out of range.
		do
			item := {CAIRO_EXTERNALS}.cairo_pattern_create_rgb(a_red, a_green, a_blue)
			validate_item
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

	make_from_rgba(a_red, a_green, a_blue, a_alpha:REAL_64)
			-- Initialization of `Current' filled with a translucent
			-- RGBA color using `a_red', `a_green' and `a_blue' as
			-- color composite and `a_alpha' as translucent value.
			-- Color can be clamped if out of range.
		do
			item := {CAIRO_EXTERNALS}.cairo_pattern_create_rgba(a_red, a_green, a_blue, a_alpha)
			validate_item
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

feature -- Access

	rgba_color:TUPLE[red, green, blue, alpha:REAL_64]
			-- The color in `Current'
		require
			Is_Valid: is_valid
		local
			l_red, l_green, l_blue, l_alpha:REAL_64
		do
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_get_rgba(item, $l_red, $l_green, $l_blue, $l_alpha)
			Result := [l_red, l_green, l_blue, l_alpha]
		end


end
