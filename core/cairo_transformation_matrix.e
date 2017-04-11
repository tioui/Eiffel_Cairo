note
	description: "Class that represent an affine transformation matrix."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_TRANSFORMATION_MATRIX

inherit
	CAIRO_MATRIX_ERROR
		undefine
			is_equal
		redefine
			default_create
		end
	CAIRO_INTERNAL_MEMORY_POINTER
		rename
			make as make_from_item
		redefine
			default_create, is_equal, make_from_item
		end

create {CAIRO_ANY}
	make_from_item

create {CAIRO_TRANSFORMATION_MATRIX}
	make

create
	default_create,
	make_from_components,
	make_translate,
	make_scale,
	make_rotate

feature {NONE} -- Initialization

	make
			-- Initialization of `Current'
		do
			item := item.memory_alloc ({CAIRO_EXTERNALS}.c_sizeof_cairo_matrix)
			error_code := {CAIRO_EXTERNALS}.CAIRO_STATUS_SUCCESS
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_from_item(a_item:POINTER)
			-- <Precursor>
		do
			Precursor(a_item)
			error_code := {CAIRO_EXTERNALS}.CAIRO_STATUS_SUCCESS
		end

	default_create
			-- Initialization an identity version of `Current'
		do
			make
			{CAIRO_EXTERNALS}.cairo_matrix_init_identity(item)
		ensure then
			Is_Created: not item.is_default_pointer
		end

	make_from_components(a_xx, a_yx, a_xy, a_yy, a_x0, a_y0:REAL_64)
			-- Initialization of `Current' using `a_xx' as `xx',
			-- `a_yx' as `yx', `a_xy' as `xy', `a_yy' as `yy',
			-- `a_x0' as `x0' and `a_y0' as `y0'
		do
			make
			{CAIRO_EXTERNALS}.cairo_matrix_init(item, a_xx, a_yx, a_xy, a_yy, a_x0, a_y0)
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_translate(a_translate_x, a_translate_y:REAL_64)
			-- Initialization of `Current' that translate `a_translate_x'
			-- position horizontally and `a_translate_y' position vertically
		do
			make
			{CAIRO_EXTERNALS}.cairo_matrix_init_translate(item, a_translate_x, a_translate_y)
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_scale(a_scale_x, a_scale_y:REAL_64)
			-- Initialization of `Current' that vetically sclale
			-- of `a_scale_x' and horizontally scale of `a_scale_y'
		do
			make
			{CAIRO_EXTERNALS}.cairo_matrix_init_scale(item, a_scale_x, a_scale_y)
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_rotate(a_radian:REAL_64)
			-- Initialization of `Current' that rotate of `a_radian'
		do
			make
			{CAIRO_EXTERNALS}.cairo_matrix_init_rotate(item, a_radian)
		ensure
			Is_Created: not item.is_default_pointer
		end

feature -- Access

	product alias "*" (a_other:CAIRO_TRANSFORMATION_MATRIX): CAIRO_TRANSFORMATION_MATRIX
			-- The result of `Current' multiplyed by `a_other'
		do
			create Result.make
			{CAIRO_EXTERNALS}.cairo_matrix_multiply(Result.item, item, a_other.item)
		end

	transform_distance(a_dx, a_dy:REAL_64):TUPLE[dx, dy:REAL_64]
			-- Transforms the distance vector (`a_dx' ,`a_dy' ) by `Current'
			-- Similar to `transform_point' except that the translation components of the
			-- transformation are ignored. The calculation of the returned vector is as follows:
			-- dx_new = dx1 * a + dy1 * c;
			-- dy_new = dx1 * b + dy1 * d;
		local
			l_in_out_dx, l_in_out_dy:REAL_64
		do
			l_in_out_dx := a_dx
			l_in_out_dy := a_dy
			{CAIRO_EXTERNALS}.cairo_matrix_transform_distance(item, $l_in_out_dx, $l_in_out_dy)
			Result := [l_in_out_dx, l_in_out_dy]
		end

	transform_point(a_x, a_y:REAL_64):TUPLE[dx, dy:REAL_64]
			-- Transforms the point (`a_x' ,`a_y' ) by `Current'
			-- The calculation of the returned vector is as follows:
			-- x_new = xx * x + xy * y + x0;
			-- y_new = yx * x + yy * y + y0;
		local
			l_in_out_x, l_in_out_y:REAL_64
		do
			l_in_out_x := a_x
			l_in_out_y := a_y
			{CAIRO_EXTERNALS}.cairo_matrix_transform_point(item, $l_in_out_x, $l_in_out_y)
			Result := [l_in_out_x, l_in_out_y]
		end

	xx:REAL_64 assign set_xx
			-- xx component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_xx(item)
		end

	yx:REAL_64 assign set_yx
			-- yx component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_yx(item)
		end

	xy:REAL_64 assign set_xy
			-- xy component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_xy(item)
		end

	yy:REAL_64 assign set_yy
			-- yy component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_yy(item)
		end

	x0:REAL_64 assign set_x0
			-- x0 component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_x0(item)
		end

	y0:REAL_64 assign set_y0
			-- y0 component of the affine transformation
		do
			Result := {CAIRO_EXTERNALS}.get_cairo_matrix_struct_y0(item)
		end

feature -- Settings

	translate(a_translate_x, a_translate_y:REAL_64)
			-- Modify `Current' so that it also translate `a_translate_x'
			-- position horizontally and `a_translate_y' position vertically
		do
			{CAIRO_EXTERNALS}.cairo_matrix_translate(item, a_translate_x, a_translate_y)
		end

	scale(a_scale_x, a_scale_y:REAL_64)
			-- Modify `Current' so that it also vetically sclale
			-- of `a_scale_x' and horizontally scale of `a_scale_y'
		do
			{CAIRO_EXTERNALS}.cairo_matrix_scale(item, a_scale_x, a_scale_y)
		end

	rotate(a_radian:REAL_64)
			-- Modify `Current' so that it also rotate of `a_radian'
		do
			{CAIRO_EXTERNALS}.cairo_matrix_rotate(item, a_radian)
		end

	inverse
			-- Modify `Current' to be the inverse of its original value.
			-- Not all transformation matrices have inverses; if the matrix
			-- collapses points together (it is degenerate), then it has no
			-- inverse and this function will fail (`is_invalid_matrix' will be `True').
		do
			error_code := {CAIRO_EXTERNALS}.cairo_matrix_invert(item)
		end

	set_xx(a_xx:REAL_64)
			-- Assign `xx' with the value of `a_xx'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_xx(item, a_xx)
		end

	set_yx(a_yx:REAL_64)
			-- Assign `yx' with the value of `a_yx'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_yx(item, a_yx)
		end

	set_xy(a_xy:REAL_64)
			-- Assign `xy' with the value of `a_xy'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_xy(item, a_xy)
		end

	set_yy(a_yy:REAL_64)
			-- Assign `yy' with the value of `a_yy'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_yy(item, a_yy)
		end

	set_x0(a_x0:REAL_64)
			-- Assign `x0' with the value of `a_x0'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_x0(item, a_x0)
		end

	set_y0(a_y0:REAL_64)
			-- Assign `y0' with the value of `a_y0'
		do
			{CAIRO_EXTERNALS}.set_cairo_matrix_struct_y0(item, a_y0)
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result :=	Precursor {CAIRO_INTERNAL_MEMORY_POINTER}(a_other) or (
						xx ~ a_other.xx and
						yx ~ a_other.yx and
						xy ~ a_other.xy and
						yy ~ a_other.yy and
						x0 ~ a_other.x0 and
						y0 ~ a_other.y0
					)
		end
end
