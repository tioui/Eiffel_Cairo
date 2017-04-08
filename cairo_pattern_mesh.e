note
	description: "[
					 A Mesh pattern
				Mesh patterns are tensor-product patch meshes (type 7 shadings in PDF). 
				Mesh patterns may also be used to create other types of shadings that are
				special cases of tensor-product patch meshes such as Coons patch meshes
				(type 6 shading in PDF) and Gouraud-shaded triangle meshes (type 4 and 5
				shadings in PDF).
				
				Mesh patterns consist of one or more tensor-product patches, which should
				be defined before using the mesh pattern. Using a mesh pattern with a
				partially defined patch as source or mask will put the context in an
				error status with a status of CAIRO_STATUS_INVALID_MESH_CONSTRUCTION.

				A tensor-product patch is defined by 4 Bézier curves (side 0, 1, 2, 3) and
				by 4 additional control points (P0, P1, P2, P3) that provide further control
				over the patch and complete the definition of the tensor-product patch. The
				corner C0 is the first point of the patch.

				Degenerate sides are permitted so straight lines may be used. A zero length
				line on one side may be used to create 3 sided patches.

				      C1     Side 1       C2
				       +---------------+
				       |               |
				       |  P1       P2  |
				       |               |
				Side 0 |               | Side 2
				       |               |
				       |               |
				       |  P0       P3  |
				       |               |
				       +---------------+
				     C0     Side 3        C3

				Each patch is constructed by first calling cairo_mesh_pattern_begin_patch(),
				then cairo_mesh_pattern_move_to() to specify the first point in the patch (C0).
				Then the sides are specified with calls to cairo_mesh_pattern_curve_to() and
				cairo_mesh_pattern_line_to().

				The four additional control points (P0, P1, P2, P3) in a patch can be specified
				with cairo_mesh_pattern_set_control_point().

				At each corner of the patch (C0, C1, C2, C3) a color may be specified with
				cairo_mesh_pattern_set_corner_color_rgb() or
				cairo_mesh_pattern_set_corner_color_rgba(). Any corner whose color is not
				explicitly specified defaults to transparent black.

				A Coons patch is a special case of the tensor-product patch where the control
				points are implicitly defined by the sides of the patch. The default value for
				any control point not specified is the implicit value for a Coons patch,
				i.e. if no control points are specified the patch is a Coons patch.

				A triangle is a special case of the tensor-product patch where the control
				points are implicitly defined by the sides of the patch, all the sides are
				lines and one of them has length 0, i.e. if the patch is specified using
				just 3 lines, it is a triangle. If the corners connected by the 0-length
				side have the same color, the patch is a Gouraud-shaded triangle.

				Patches may be oriented differently to the above diagram. For example the
				first point could be at the top left. The diagram only shows the relationship
				between the sides, corners and control points. Regardless of where the first
				point is located, when specifying colors, corner 0 will always be the first
				point, corner 1 the point between side 0 and side 1 etc.

				Calling cairo_mesh_pattern_end_patch() completes the current patch. If less
				than 4 sides have been defined, the first missing side is defined as a line
				from the current point to the first point of the patch (C0) and the other sides
				are degenerate lines from C0 to C0. The corners between the added sides will
				all be coincident with C0 of the patch and their color will be set to be the
				same as the color of C0.
				
				Additional patches may be added with additional calls to
				cairo_mesh_pattern_begin_patch()/cairo_mesh_pattern_end_patch().
				
				When two patches overlap, the last one that has been added is drawn over the first one.

				When a patch folds over itself, points are sorted depending on their parameter coordinates
				inside the patch. The v coordinate ranges from 0 to 1 when moving from side 3 to side 1;
				the u coordinate ranges from 0 to 1 when going from side 0 to side

			    Points with higher v coordinate hide points with lower v coordinate. When two points have
			    the same v coordinate, the one with higher u coordinate is above. This means that points
			    nearer to side 1 are above points nearer to side 3; when this is not sufficient to decide
			    which point is above (for example when both points belong to side 1 or side 3) points nearer
			    to side 2 are above points nearer to side 0.

				For a complete definition of tensor-product patches, see the PDF specification (ISO32000),
				which describes the parametrization in detail.

				Note: The coordinates are always in pattern space. For a new pattern, pattern space is
				identical to user space, but the relationship between the spaces can be changed with
				cairo_pattern_set_matrix().
			]"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_MESH

inherit
	CAIRO_PATTERN_MESH_ERROR
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
			Item_Type_Valid: {CAIRO_EXTERNALS}.cairo_pattern_get_type(a_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_MESH
		do
			make_pattern_from_item(a_item)
			is_drawing_patch := False
			is_move_to_done := False
			patch_side_count := 0
		ensure
			Item_Not_Null: not item.is_default_pointer
		end

	make
			-- Intitialization of `Current'
		do
			item := {CAIRO_EXTERNALS}.cairo_pattern_create_mesh
			validate_item
			is_drawing_patch := False
			is_move_to_done := False
			patch_side_count := 0
		ensure
			Item_Not_Null: not item.is_default_pointer
		end


feature -- Access

	patch_side_count:INTEGER
			-- The number of side that the current patch has

	begin_patch
			-- Begin the construction of a patch.
			-- Must be match to a call to `end_patch'
		require
			Is_Valid: is_valid
			No_Incomplete_Patch: not is_drawing_patch
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_begin_patch(item)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
			if is_success then
				is_drawing_patch := True
				is_move_to_done := False
				patch_side_count := 0
			end
		ensure
			Is_Patch_Begin: is_success implies (
								is_drawing_patch and
								not is_move_to_done and
								patch_side_count = 0
							)
		end

	end_patch
			-- Finish the constructio of a patch
			-- Must match a call to `begin_patch'
		require
			Is_Valid: is_valid
			Has_Incomplete_Patch: is_drawing_patch
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_end_patch(item)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
			if is_success then
				is_drawing_patch := False
				is_move_to_done := False
				patch_side_count := 0
			end
		ensure
			Is_Patch_Finished: is_success implies not is_drawing_patch
		end

	move_to(a_x, a_y:REAL_64)
			-- Define the first point of the current patch in `Current'
			-- Can be call only once, at the beginning of a patch.
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			Not_Already_Move: not is_move_to_done
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_move_to(item, a_x, a_y)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
			if is_success then
				is_move_to_done := True
			end
		ensure
			Is_Move_To_Done: is_success implies is_move_to_done
		end

	line_to(a_x, a_y:REAL_64)
			-- Adds a line to the current patch from the current point to
			-- position (`a_x' , `a_y') in pattern-space coordinates.
			-- After this call the current point will be (`a_x' , `a_y')
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			First_Move_Done: is_move_to_done
			Not_4_Side: patch_side_count < 4
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_line_to(item, a_x, a_y)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
			if is_success then
				patch_side_count := patch_side_count + 1
			end
		ensure
			Side_Count_Increment: is_success implies patch_side_count = old patch_side_count + 1
		end

	curve_to(a_x1, a_y1, a_x2, a_y2, a_x3, a_y3:REAL_64)
			-- Adds a cubic Bézier spline to the current patch from the
			-- current point to position (`a_x3' , `a_y3') in pattern-space
			-- coordinates, using (`a_x1' , `1_y1') and (`a_x2' , `a_y2')
			-- as the control points.
			-- If the current patch has no current point before the call
			-- this feature will behave as if preceded by a call to
			-- move_to(`a_x1' , `a_y1')
			-- After this call the current point will be (`a_x3' , `a_y3')
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			Not_4_Side: patch_side_count < 4
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_curve_to(item, a_x1, a_y1, a_x2, a_y2, a_x3, a_y3)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
			if is_success then
				patch_side_count := patch_side_count + 1
			end
		ensure
			Side_Count_Increment: is_success implies patch_side_count = old patch_side_count + 1
		end

	set_control_point(a_index:INTEGER; a_x, a_y:REAL_64)
			-- Set the position of the control point at index `a_index'
			-- to (`a_x',`a_y').
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			Is_Index_Valid: a_index >= 1 and a_index <= 4
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_set_control_point(item, a_index.to_natural_32 - 1, a_x, a_y)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
		end

	set_corner_color_rgb(a_index:INTEGER; a_red, a_green, a_blue:REAL_64)
			-- Specifie the opaque color of the corner `a_index' of the current patch.
			-- The color is represented with the composite `a_red', `a_green' and `a_blue'
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			Is_Index_Valid: a_index >= 1 and a_index <= 4
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_set_corner_color_rgb(item, a_index.to_natural_32 - 1, a_red, a_green, a_blue)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
		end

	set_corner_color_rgba(a_index:INTEGER; a_red, a_green, a_blue, a_alpha:REAL_64)
			-- Specifie the translucent color of the corner `a_index' of the current patch.
			-- The color is represented with the composite `a_red', `a_green' and `a_blue'
			-- The translucent is represented by `a_alpha'
		require
			Is_Valid: is_valid
			Has_Patch: is_drawing_patch
			Is_Index_Valid: a_index >= 1 and a_index <= 4
		do
			{CAIRO_EXTERNALS}.cairo_mesh_pattern_set_corner_color_rgba(item, a_index.to_natural_32 - 1, a_red, a_green, a_blue, a_alpha)
			error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
		end

	patch_count:NATURAL
			-- The number of finished patchs in `Current'
			-- Note: Fonction not pure. Modify `error_code'
		require
			Is_Valid: is_valid
		local
			l_count:NATURAL
		do
			error_code := {CAIRO_EXTERNALS}.cairo_mesh_pattern_get_patch_count(item, $l_count)
			Result := l_count
		end

	control_point(a_patch_index:NATURAL; a_point_index:INTEGER):TUPLE[x, y:REAL_64]
			-- The position of the control point at index `a_point_index' in the finished
			-- patch `a_patch_index'
			-- Note: Fonction not pure. Modify `error_code'
		require
			Is_Valid: is_valid
			Is_Patch_Index_Valid: a_patch_index >= 1 and a_patch_index <= patch_count
			Is_Point_Index_Valid: a_point_index >= 1 and a_point_index <= 4
		local
			l_x, l_y:REAL_64
		do
			error_code := {CAIRO_EXTERNALS}.cairo_mesh_pattern_get_control_point(item, a_patch_index - 1, a_point_index.to_natural_32 - 1, $l_x, $l_y)
			Result := [l_x, l_y]
		end

	corner_color(a_patch_index:NATURAL; a_corner_index:INTEGER):TUPLE[red, green, blue, alpha:REAL_64]
			-- The color of the corner at index `a_corner_index' in the finished
			-- patch `a_patch_index'
			-- Note: Fonction not pure. Modify `error_code'
		require
			Is_Valid: is_valid
			Is_Patch_Index_Valid: a_patch_index >= 1 and a_patch_index <= patch_count
			Is_Point_Index_Valid: a_corner_index >= 1 and a_corner_index <= 4
		local
			l_red, l_green, l_blue, l_alpha:REAL_64
		do
			error_code := {CAIRO_EXTERNALS}.cairo_mesh_pattern_get_corner_color_rgba(
												item, a_patch_index - 1, a_corner_index.to_natural_32 - 1,
												$l_red, $l_green, $l_blue, $l_alpha
											)
			Result := [l_red, l_green, l_blue, l_alpha]
		end

feature -- Status report

	is_drawing_patch:BOOLEAN
			-- There presently is a patch in construction

	is_move_to_done:BOOLEAN
			-- The first call to `move_to' has been done



invariant
	Is_Move_To_Done_Valid: is_move_to_done implies is_drawing_patch

end
