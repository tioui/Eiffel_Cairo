note
	description: "A {CAIRO_PATTERN_GRADIENT} that used a linear gradient pattern."
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_GRADIENT_LINEAR

inherit
	CAIRO_PATTERN_GRADIENT
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
			Item_Type_Valid: {CAIRO_EXTERNALS}.cairo_pattern_get_type(a_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_LINEAR
		do
			make_pattern_from_item(a_item)
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

	make(a_x1, a_y1, a_x2, a_y2:REAL_64)
			-- Initialization of `Current' as a linear gradient
			-- along the line defined by (`a_x1', `a_y1') and (`a_x2', `a_y2').
		do
			item := {CAIRO_EXTERNALS}.cairo_pattern_create_linear(a_x1, a_y1, a_x2, a_y2)
			validate_item
		ensure
			Item_Not_Null: not item.is_default_pointer
			Is_Valid_Vector: is_success implies (
								 attached vector_endpoints as la_vector and then (
										la_vector.x1 = a_x1 and
										la_vector.y1 = a_y1 and
										la_vector.x2 = a_x2 and
										la_vector.y2 = a_y2
									)
								)
		end

feature -- Access

	vector_endpoints:TUPLE[x1, y1, x2, y2:REAL_64]
			-- The starting and ending points of the control vector
		require
			Is_Valid: is_valid
		local
			l_x1, l_y1, l_x2, l_y2:REAL_64
		do
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_get_linear_points(
												item, $l_x1, $l_y1, $l_x2, $l_y2
											)
			Result := [l_x1, l_y1, l_x2, l_y2]
		end

end
