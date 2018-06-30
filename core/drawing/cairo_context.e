note
	description: "[
				Contains the current state of the rendering device, including
				coordinates of yet to be drawn shapes.
			]"
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_CONTEXT

inherit
	CAIRO_ANTIALIASABLE
		undefine
			is_equal
		end
	CAIRO_INTERNAL_MEMORY_POINTER
		rename
			make as make_from_item
		end
	CAIRO_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create
	make

feature {NONE} -- Initialization

	make(a_surface:CAIRO_SURFACE)
			-- Initialization of `Current' drawing on `a_surface'
		require
			Surface_Valid: a_surface.is_valid
		do
			surface := a_surface
			item := {CAIRO_EXTERNALS}.cairo_create(a_surface.item)
			if not item.is_default_pointer then
				error_code := {CAIRO_EXTERNALS}.cairo_status(item)
				is_valid := is_success
			end
			create utf_converter
		ensure
			Surface_assign:surface~ a_surface
			Item_Valid: not item.is_default_pointer
		end

feature -- Access

	surface:CAIRO_SURFACE
			-- The {CAIRO_SURFACE} that `Current' is drawing on

	save_state
			-- Push the state of `Current' in the internal state stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_save(item)
		end

	restore_state
			-- Pull the state of `Current' from the internal state stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_restore(item)
		end

	push_group
			-- Temporarily redirects drawing to an intermediate surface
			-- known as a group. Must call `pop_group' to geting back to
			-- the original target. Can be call multiple times as group are
			-- store in an internal stack. This feature call `save_state' so that
			-- any drawing will not be visible outside the group.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_push_group(item)
		end

	push_group_with_content(a_content:CAIRO_CONTENT_TYPE)
			-- Temporarily redirects drawing to an intermediate surface
			-- known as a group. Must call `pop_group' to geting back to
			-- the original target. Can be call multiple times as group are
			-- store in an internal stack. This feature call `save_state' so that
			-- any drawing will not be visible outside the group.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_push_group_with_content(item, a_content.item)
		end

	pop_group:CAIRO_PATTERN_SURFACE
			-- Replace the group pushed by `push_group*' and return
			-- ap {CAIRO_PATTERN_SURFACE} containing all drawing
			-- operations performed to the group.
			-- This feature call `restore_state' so that
			-- any drawing will not be visible outside the group.
		require
			Is_Valid:is_valid
		do
			create Result.make_from_item ({CAIRO_EXTERNALS}.cairo_pop_group(item))
		end

	pop_group_to_source
			-- Replace the group pushed by `push_group'.
			-- The group replace the source of `Current'.
			-- Similar to a `pop_group' folowe by a `set_source'.
			-- This feature call `restore_state' so that
			-- any drawing will not be visible outside the group.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pop_group_to_source(item)
		end

	group_target:CAIRO_SURFACE
			-- The {CAIRO_SURFACE} that `Current' is drawing on.
			-- It can be the same as `surface' or a {CAIRO_SURFACE}
			-- created by the latest `push_group*'. In case of error,
			-- the error is set in `Result' and not in `Current'
		require
			Is_Valid:is_valid
		local
			l_item:POINTER
		do
			l_item := {CAIRO_EXTERNALS}.cairo_get_group_target(item)
			if l_item ~ surface.item then
				Result := surface
			else
				create Result.make_from_item (l_item)
			end
		end

	set_source(a_source:CAIRO_PATTERN)
			-- Replace the `source' pattern of `Current' with `a_source'
			-- The default `source' pattern is a solid pattern that is opaque black.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_source(item, a_source.item)
		end

	set_source_rgb(a_red, a_green, a_blue:REAL_64)
			-- Replace the `source' pattern of `Current' filled with an opaque
			-- RGB color using `a_red', `a_green' and `a_blue' as
			-- color composite. Color can be clamped if out of range.
			-- The default `source' pattern is a solid pattern that is opaque black.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_source_rgb(item, a_red, a_green, a_blue)
		end

	set_source_rgba(a_red, a_green, a_blue, a_alpha:REAL_64)
			-- Replace the `source' pattern of `Current' filled with a translucent
			-- RGBA color using `a_red', `a_green' and `a_blue' as
			-- color composite and `a_alpha' as translucent value.
			-- Color can be clamped if out of range.
			-- The default `source' pattern is a solid pattern that is opaque black.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_source_rgba(item, a_red, a_green, a_blue, a_alpha)
		end

	set_source_surface(a_surface:CAIRO_SURFACE; a_x, a_y:REAL_64)
			-- Replace the `source' pattern of `Current' filled with
			-- a {CAIRO_PATTERN_SURFACE} created with `a_surface'.
			-- `a_x' and `a_y' give the user-space coordinate at
			-- which `a_surface' origin should appear.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_source_surface(item, a_surface.item, a_x, a_y)
		end

	source:CAIRO_PATTERN
			-- The {CAIRO_PATTERN} used as source pattern in `Current'.
		require
			Is_Valid:is_valid
		local
			l_item:POINTER
		do
			l_item := {CAIRO_EXTERNALS}.cairo_get_source(item)
			check not l_item.is_default_pointer end
			if {CAIRO_EXTERNALS}.cairo_pattern_get_type(l_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_SOLID then
				create {CAIRO_PATTERN_COLOR} Result.make_from_item (l_item)
			elseif {CAIRO_EXTERNALS}.cairo_pattern_get_type(l_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_LINEAR then
				create {CAIRO_PATTERN_GRADIENT_LINEAR} Result.make_from_item (l_item)
			elseif {CAIRO_EXTERNALS}.cairo_pattern_get_type(l_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_RADIAL then
				create {CAIRO_PATTERN_GRADIENT_RADIAL} Result.make_from_item (l_item)
			elseif {CAIRO_EXTERNALS}.cairo_pattern_get_type(l_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_MESH then
				create {CAIRO_PATTERN_MESH} Result.make_from_item (l_item)
			elseif {CAIRO_EXTERNALS}.cairo_pattern_get_type(l_item) = {CAIRO_EXTERNALS}.CAIRO_PATTERN_TYPE_SURFACE then
				create {CAIRO_PATTERN_SURFACE} Result.make_from_item (l_item)
			else
				create Result.make_from_item(l_item)
			end
		end

	set_default_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_DEFAULT)
		end

	set_no_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_NONE)
		end

	set_single_color_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GRAY)
		end

	set_subpixel_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_SUBPIXEL)
		end

	set_fast_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_FAST)
		end

	set_good_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GOOD)
		end

	set_best_antialiasing
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_BEST)
		end

	is_default_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_DEFAULT
		end

	is_no_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_NONE
		end

	is_single_color_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GRAY
		end

	is_subpixel_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_SUBPIXEL
		end

	is_fast_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_FAST
		end

	is_good_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GOOD
		end

	is_best_antialiasing:BOOLEAN
			-- <Precursor>
		require else
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_BEST
		end

	disable_dashes
			-- Remove every dashes.
		require
			Is_Valid:is_valid
		do
			set_dashes(<<>>, 0.0)
		ensure
			Is_Disabled: not is_dashes_enabled
		end

	set_dashes(a_dashes:ARRAY[REAL_64]; a_offset:REAL_64)
			-- Sets the dash pattern to be used by `stroke'.
			-- A dash pattern is specified by `a_dashes', an
			-- {ARRAY} of positive {REAL_64} values.
			-- Each value provides the length of alternate "on"
			-- and "off" portions of the stroke.
			-- The `a_offset' specifies an offset into the pattern
			-- at which the stroke begins.
			-- The length values are in user-space units as
			-- evaluated at the time of stroking.
			-- If `a_dashes'.`count' = 1, a symmetric pattern
			-- is assumed with alternating on and off portions
			-- of the size specified by the single value in `a_dashes'
		require
			Is_Valid:is_valid
			Dashes_Not_All_0: a_dashes.is_empty or across a_dashes as la_dashes some la_dashes.item > 0 end
			Dashes_Not_Negative: not (across a_dashes as la_dashes some la_dashes.item < 0 end)
		local
			l_dashes_c:ANY
		do
			l_dashes_c := a_dashes.to_c
			{CAIRO_EXTERNALS}.cairo_set_dash(item, $l_dashes_c, a_dashes.count, a_offset)
		end

	is_dashes_enabled:BOOLEAN
			-- `dashes' has values.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_dash_count(item) /= 0
		end

	dashes:TUPLE[dashes:LIST[REAL_64]; offset:REAL_64]
			-- The dash pattern to be used by `stroke'.
			-- A dash pattern is an {ARRAY} of positive {REAL_64} values.
			-- Each value provides the length of alternate "on"
			-- and "off" portions of the stroke.
			-- The offset specifies an offset into the pattern
			-- at which the stroke begins.
			-- The length values are in user-space units as
			-- evaluated at the time of stroking.
		require
			Is_Valid:is_valid
		local
			l_array:ARRAY[REAL_64]
			l_count:INTEGER
			l_offset:REAL_64
			l_array_c:ANY
		do
			l_count := {CAIRO_EXTERNALS}.cairo_get_dash_count(item)
			create l_array.make_filled (0.0, 1, l_count)
			l_array_c := l_array.to_c
			{CAIRO_EXTERNALS}.cairo_get_dash(item, $l_array_c, $l_offset)
			Result := [create {ARRAYED_LIST[REAL_64]}.make_from_array (l_array), l_offset]
		end

	set_fill_rule_winding
			-- Set the winding fill rule to use with `fill' and `clip'.
			-- If the path crosses the ray from left-to-right, counts +1.
			-- If the path crosses the ray from right to left, counts -1.
			-- (Left and right are determined from the perspective of
			-- looking along the ray from the starting point.) If the total
			-- count is non-zero, the point will be filled.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_fill_rule(item, {CAIRO_EXTERNALS}.CAIRO_FILL_RULE_WINDING)
		ensure
			Is_Set: is_fill_rule_winding
		end

	set_fill_rule_even_odd
			-- Set the even odd fill rule to use with `fill' and `clip'.
			-- Counts the total number of intersections, without regard
			-- to the orientation of the contour. If the total number
			-- of intersections is odd, the point will be filled.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_fill_rule(item, {CAIRO_EXTERNALS}.CAIRO_FILL_RULE_EVEN_ODD)
		ensure
			Is_Set: is_fill_rule_even_odd
		end

	is_fill_rule_winding:BOOLEAN
			-- The fill rule used in `Current' is winding
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_fill_rule(item) = {CAIRO_EXTERNALS}.CAIRO_FILL_RULE_WINDING
		end

	is_fill_rule_even_odd:BOOLEAN
			-- The fill rule used in `Current' is even odd
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_fill_rule(item) = {CAIRO_EXTERNALS}.CAIRO_FILL_RULE_EVEN_ODD
		end

	set_line_cap_butt
			-- Render the endpoint of line stroking so that it
			-- start(stop) the line exactly at the start(end) point
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_cap(item, {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_BUTT)
		ensure
			Is_Set: is_line_cap_butt
		end

	set_line_cap_round
			-- Render the endpoint of line stroking so that it
			-- use a round ending, the center of the circle is the end point
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_cap(item, {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_ROUND)
		ensure
			Is_Set: is_line_cap_round
		end

	set_line_cap_square
			-- Render the endpoint of line stroking so that it
			-- use squared ending, the center of the square is the end point
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_cap(item, {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_SQUARE)
		ensure
			Is_Set: is_line_cap_square
		end

	is_line_cap_butt:BOOLEAN
			-- Render the endpoint of line stroking so that it
			-- start(stop) the line exactly at the start(end) point
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_cap(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_BUTT
		end

	is_line_cap_round:BOOLEAN
			-- Render the endpoint of line stroking so that it
			-- use a round ending, the center of the circle is the end point
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_cap(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_ROUND
		end

	is_line_cap_square:BOOLEAN
			-- Render the endpoint of line stroking so that it
			-- use squared ending, the center of the square is the end point
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_cap(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_CAP_SQUARE
		end

	set_line_join_miter
			-- Render the junction of two lines when stroking so that it
			-- use a sharp (angled) corner.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_join(item, {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_MITER)
		ensure
			Is_Set: is_line_join_miter
		end

	set_line_join_round
			-- Render the junction of two lines when stroking so that it
			-- use a rounded join, the center of the circle is the joint point.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_join(item, {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_ROUND)
		ensure
			Is_Set: is_line_join_round
		end

	set_line_join_bevel
			-- Render the junction of two lines when stroking so that it
			-- use a cut-off join, the join is cut off at half the line
			-- width from the joint point
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_join(item, {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_BEVEL)
		ensure
			Is_Set: is_line_join_bevel
		end

	is_line_join_miter:BOOLEAN
			-- Render the junction of two lines when stroking so that it
			-- use a sharp (angled) corner.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_join(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_MITER
		end

	is_line_join_round:BOOLEAN
			-- Render the junction of two lines when stroking so that it
			-- use a rounded join, the center of the circle is the joint point.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_join(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_ROUND
		end

	is_line_join_bevel:BOOLEAN
			-- Render the junction of two lines when stroking so that it
			-- use a cut-off join, the join is cut off at half the line
			-- width from the joint point
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_join(item) = {CAIRO_EXTERNALS}.CAIRO_LINE_JOIN_BEVEL
		end

	line_width:REAL_64 assign set_line_width
			-- The size of a line.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_line_width(item)
		end

	set_line_width(a_width:REAL_64)
			-- Assign `line_width' with the value of `a_width'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_line_width(item, a_width)
		ensure
			Is_Assign: line_width ~ a_width
		end

	miter_limit:REAL_64 assign set_miter_limit
			-- If `is_line_join_miter', the miter limit is used to
			-- determine whether the lines should be joined with a
			-- bevel instead of a miter
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_miter_limit(item)
		end

	set_miter_limit(a_limit:REAL_64)
			-- Assign `miter_limit' with the value of `a_limit'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_miter_limit(item, a_limit)
		ensure
			Is_Assign: miter_limit ~ a_limit
		end

	operator:CAIRO_OPERATOR assign set_operator
			-- the compositing operator to be used for all drawing operations
		require
			Is_Valid:is_valid
		do
			create Result.make({CAIRO_EXTERNALS}.cairo_get_operator(item))
		end

	set_operator(a_operator:CAIRO_OPERATOR)
			-- Assign `operator' with the value of `a_operator'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_operator(item, a_operator.item)
		ensure
			Is_Assign: a_operator ~ operator
		end

	tolerance:REAL_64 assign set_tolerance
			-- Curved segments of the path will be subdivided until
			-- the maximum deviation between the original path and
			-- the polygonal approximation is less than `tolerance'.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_get_tolerance(item)
		end

	set_tolerance(a_tolerance:REAL_64)
			-- Assign `tolerance' with the value of `a_tolerance'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_tolerance(item, a_tolerance)
		ensure
			Is_Assign: tolerance ~ a_tolerance
		end

	clip
			-- Establishes a new clip region by intersecting the current
			-- clip region with the current path as it would be filled by `fill'
			-- After the call, the current path will be cleared from `Current'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_clip(item)
		end

	clip_preserve
			-- Establishes a new clip region by intersecting the current
			-- clip region with the current path as it would be filled by `fill'
			-- After the call, the current path will be preserved from `Current'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_clip_preserve(item)
		end

	clip_extends:TUPLE[x1, y1, x2, y2:REAL_64]
			-- bounding box in user coordinates covering the area inside
			-- the current clip.
		require
			Is_Valid:is_valid
		local
			l_x1, l_y1, l_x2, l_y2:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_clip_extents(item, $l_x1, $l_y1, $l_x2, $l_y2)
			Result := [l_x1, l_y1, l_x2, l_y2]
		end

	in_clip(a_x, a_y:REAL_64):BOOLEAN
			-- `True' if the point (`a_x',`a_y') is inside the current clip.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_in_clip(item, a_x, a_y)
		end

	reset_clip
			-- Reset the current clip region to its original, unrestricted state.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_reset_clip(item)
		end

	clip_rectangle_list:detachable LIST[TUPLE[x, y, width, height:REAL_64]]
			-- the current clip region as a list of rectangles in user coordinates.
			-- Return `Void' if the current clip cannot be represent as a list
			-- of rectangle.
		require
			Is_Valid:is_valid
		local
			l_index:INTEGER
			l_rectangles_list:POINTER
			l_rectangles_count:INTEGER
			l_rectangles_array:MANAGED_POINTER
			l_x, l_y, l_width, l_height:REAL_64
			l_platform:PLATFORM
		do
			l_rectangles_list := {CAIRO_EXTERNALS}.cairo_copy_clip_rectangle_list(item)
			error_code := {CAIRO_EXTERNALS}.get_cairo_rectangle_list_status(item)
			if is_success then
				create l_platform
				l_rectangles_count := {CAIRO_EXTERNALS}.get_cairo_rectangle_list_num_rectangles(item)
				create {ARRAYED_LIST[TUPLE[x, y, width, height:REAL_64]]} Result.make (l_rectangles_count)
				create l_rectangles_array.share_from_pointer (
											{CAIRO_EXTERNALS}.get_cairo_rectangle_list_rectangles(item),
											l_rectangles_count * l_platform.real_64_bytes
										)
				from
					l_index := 0
				until
					l_index >= l_rectangles_count
				loop
					l_x := l_rectangles_array.read_real_64 (l_index)
					l_index := l_index +  l_platform.real_64_bytes
					l_y := l_rectangles_array.read_real_64 (l_index)
					l_index := l_index +  l_platform.real_64_bytes
					l_width := l_rectangles_array.read_real_64 (l_index)
					l_index := l_index +  l_platform.real_64_bytes
					l_height := l_rectangles_array.read_real_64 (l_index)
					l_index := l_index +  l_platform.real_64_bytes
					Result.extend ([l_x, l_y, l_width, l_height])
				end
			end
			{CAIRO_EXTERNALS}.cairo_rectangle_list_destroy(l_rectangles_list)
		end

	fill
			-- A drawing operator that fills the current path
			-- according to the current fill rule.
			-- each sub-path is implicitly closed before being filled
			-- After the `fill', the current path will be cleared
			-- from the cairo context.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_fill(item)
		end

	fill_preserve
			-- A drawing operator that fills the current path
			-- according to the current fill rule.
			-- each sub-path is implicitly closed before being filled
			-- After the `fill', the current path will be preserved
			-- from the cairo context.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_fill_preserve(item)
		end

	fill_extends:TUPLE[x1, y1, x2, y2:REAL_64]
			-- a bounding box in user coordinates covering the area
			-- that would be affected, (the "inked" area), by a `fill'.
			-- If the current path is empty, returns an empty
			-- rectangle ((0,0), (0,0)). Surface dimensions and clipping
			-- are not taken into account.
		require
			Is_Valid:is_valid
		local
			l_x1, l_y1, l_x2, l_y2:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_fill_extents(item, $l_x1, $l_y1, $l_x2, $l_y2)
			Result := [l_x1, l_y1, l_x2, l_y2]
		end

	in_fill(a_x, a_y:REAL_64):BOOLEAN
			-- `True' if the point (`a_x',`a_y') is inside the current `fill' area.
			-- Surface dimensions and clipping are not taken into account.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_in_fill(item, a_x, a_y)
		end

	paint_with_mask(a_mask:CAIRO_PATTERN)
			-- A drawing operator that paints the current source using the
			-- alpha channel of `a_mask' as mask. (Opaque areas of `a_mask'
			-- are painted with the source, transparent areas are not painted.)
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_mask(item, a_mask.item)
		end

	paint_with_mask_surface(a_mask:CAIRO_SURFACE; a_x, a_y:REAL_64)
			-- A drawing operator that paints the current source using the
			-- alpha channel of `a_mask' as mask. (Opaque areas of `a_mask'
			-- are painted with the source, transparent areas are not painted.)
			-- Place the origin of `a_mask' at (`a_x',`a_y').
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_mask_surface(item, a_mask.item, a_x, a_y)
		end

	paint
			-- A drawing operator that paints the current source
			-- everywhere within the current clip region.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_paint(item)
		end

	paint_with_alpha(a_alpha:REAL_64)
			-- A drawing operator that paints the current source everywhere
			-- within the current clip region using a mask of constant alpha value `a_alpha'.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_paint_with_alpha(item, a_alpha)
		end

	stroke
			-- A drawing operator that strokes the current path according
			-- to the current line width, line join, line cap, and dash settings.
			-- After the call, the current path will be cleared from `Current'.
			-- Note: Degenerate segments and sub-paths are treated specially and
			-- provide a useful result. These can result in two different situations:
			--  1 - Zero-length "on" segments set in `dash'. if `is_line_cap_round' or
			--      `is_line_cap_square', then these segments will be drawn as
			--      circular dots or squares respectively. In the case of `is_line_cap_square',
			--      the orientation of the squares is determined by the direction of
			--      the underlying path.
			--  2 - A sub-path created by `move_to' followed by either a `close_path'
			--      or one or more calls to `line_to' to the same coordinate as the `move_to';
			--      if `is_line_cap_round', then these sub-paths will be drawn as circular dots.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_stroke(item)
		end

	stroke_preserve
			-- A drawing operator that strokes the current path according
			-- to the current line width, line join, line cap, and dash settings.
			-- After the call, the current path will be preserved in `Current'.
			-- Note: Degenerate segments and sub-paths are treated specially and
			-- provide a useful result. These can result in two different situations:
			--  1 - Zero-length "on" segments set in `dash'. if `is_line_cap_round' or
			--      `is_line_cap_square', then these segments will be drawn as
			--      circular dots or squares respectively. In the case of `is_line_cap_square',
			--      the orientation of the squares is determined by the direction of
			--      the underlying path.
			--  2 - A sub-path created by `move_to' followed by either a `close_path'
			--      or one or more calls to `line_to' to the same coordinate as the `move_to';
			--      if `is_line_cap_round', then these sub-paths will be drawn as circular dots.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_stroke_preserve(item)
		end

	stroke_extends:TUPLE[x1, y1, x2, y2:REAL_64]
			-- a bounding box in user coordinates covering the area
			-- that would be affected, (the "inked" area), by a `stroke'.
			-- If the current path is empty, returns an empty
			-- rectangle ((0,0), (0,0)). Surface dimensions and clipping
			-- are not taken into account.
		require
			Is_Valid:is_valid
		local
			l_x1, l_y1, l_x2, l_y2:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_stroke_extents(item, $l_x1, $l_y1, $l_x2, $l_y2)
			Result := [l_x1, l_y1, l_x2, l_y2]
		end

	in_stroke(a_x, a_y:REAL_64):BOOLEAN
			-- `True' if the point (`a_x',`a_y') is inside the current `stroke' area.
			-- Surface dimensions and clipping are not taken into account.
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_in_stroke(item, a_x, a_y)
		end

	copy_page
			-- Emits the current page for backends that support multiple pages
			-- but does not clear it.
			-- This is a convenience function that simply calls `surface'.`copy_page'
		require
			Is_Valid:is_valid
		do
			surface.copy_page
		end

	show_page
			-- Emits and clears the current page for backends that support multiple pages.
			-- Use `copy_page' if you don't want to clear the page.
			-- This is a convenience function that simply calls `surface'.`show_page'
		require
			Is_Valid:is_valid
		do
			surface.show_page
		end

	copy_path:CAIRO_PATH
			-- A copy of the current path in `Current'
			-- In case of error, the error is set in `Result'
		require
			Is_Valid:is_valid
		do
			create Result.make ({CAIRO_EXTERNALS}.cairo_copy_path(item))
		end

	copy_path_flat:CAIRO_PATH
			-- A flattened copy of the current path in `Current'
			-- This function is like `copy_path' except that any
			-- curves in the path will be approximated with
			-- piecewise-linear approximations, (accurate to
			-- within the current tolerance value).
			-- In case of error, the error is set in `Result'
		require
			Is_Valid:is_valid
		do
			create Result.make ({CAIRO_EXTERNALS}.cairo_copy_path(item))
		end

	append_path(a_path:CAIRO_PATH)
			-- Append `a_path' into the current path of `Current'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_append_path(item, a_path.item)
		end

	has_current_point:BOOLEAN
			-- Returns whether a current point is defined on the current path
		require
			Is_Valid:is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_has_current_point(item)
		end

	current_point:TUPLE[x, y:REAL_64]
			-- The current point of the current path, which is conceptually
			-- the final point reached by the path so far.
		require
			Is_Valid:is_valid
			Has_Point: has_current_point
		local
			l_x, l_y:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_get_current_point(item, $l_x, $l_y)
			Result := [l_x, l_y]
		end

	new_path
			-- Clears the current path. After this call there will be
			-- no path and no current point.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_new_path(item)
		end

	new_sub_path
			-- Begin a new sub-path. Note that the existing path is not
			-- affected. After this call there will be no current point.
			-- In many cases, this call is not needed since new sub-paths
			-- are frequently started with `path_move_to'.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_new_sub_path(item)
		end

	close_path
			-- Adds a line segment to the path from the current point to the
			-- beginning of the current sub-path, (the most recent point passed
			-- to `move_to'), and closes this sub-path.
			-- After this call the current point will be at the joined endpoint
			-- of the sub-path.
			-- If there is no current point before the call, this feature will have no effect.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_close_path(item)
		end

	arc(a_center_x, a_center_y, a_radius, a_angle_start, a_angle_end:REAL_64)
			-- Adds a circular arc of `a_radius' to the current path. The center of
			-- the arc is at (`a_center_x',`a_center_y') and the arc start at
			-- `a_angle_start' and end at `a_angle_end'. If `a_angle_end' is less
			-- than `a_angle_start' it will be progressively increased by
			-- 2*M_PI until it is greater than `a_angle_start'
			-- Angles are measured in radians. An angle of 0.0 is in the direction
			-- of the positive X axis (in user space). An angle of M_PI/2.0 radians
			-- (90 degrees) is in the direction of the positive Y axis (in user space).
			-- Angles increase in the direction from the positive X axis toward the
			-- positive Y axis. So with the default transformation matrix, angles
			-- increase in a clockwise direction.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_arc(item, a_center_x, a_center_y, a_radius, a_angle_start, a_angle_end)
		end

	arc_negative(a_center_x, a_center_y, a_radius, a_angle_start, a_angle_end:REAL_64)
			-- Adds a circular arc of `a_radius' to the current path. The center of
			-- the arc is at (`a_center_x',`a_center_y') and the arc start at
			-- `a_angle_start' and end at the decreasing direction `a_angle_end'.
			-- If `a_angle_end' is greater than `a_angle_start' it will be progressively
			-- decreased by 2*M_PI until it is less than `a_angle_start'.
			-- Angles are measured in radians. An angle of 0.0 is in the direction
			-- of the positive X axis (in user space). An angle of M_PI/2.0 radians
			-- (90 degrees) is in the direction of the positive Y axis (in user space).
			-- Angles increase in the direction from the positive X axis toward the
			-- positive Y axis. So with the default transformation matrix, angles
			-- increase in a clockwise direction.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_arc_negative(item, a_center_x, a_center_y, a_radius, a_angle_start, a_angle_end)
		end

	curve_to(a_x1, a_y1, a_x2, a_y2, a_x3, a_y3:REAL_64)
			-- Adds a cubic Bézier spline to the path from the current point to position
			-- (`a_x3', `a_y3') in user-space coordinates, using (`a_x1',`a_y1') and (`a_x2',`a_y2')
			-- as the control point. After this call the current point will be (`a_x3', `a_y3').
			-- If there is no current point before this call this feature will behave as
			-- if preceded by a call to `move_to'(`a_x1' , `a_y1' ).
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_curve_to(item, a_x1, a_y1, a_x2, a_y2, a_x3, a_y3)
		end

	line_to(a_x, a_y:REAL_64)
			-- Adds a line to the path from the current point to position (`a_x',`a_y')
			-- in user-space coordinates. After this call the current point will be (`a_x',`a_y').
			-- If there is no current point before this call this feature will behave as `move_to'(`a_x',`a_y').
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_line_to(item, a_x, a_y)
		end

	move_to(a_x, a_y:REAL_64)
			-- Begin a new sub-path. After this call the current point will be (`a_x',`a_y').
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_move_to(item, a_x, a_y)
		end

	rectangle(a_x, a_y, a_width, a_height:REAL_64)
			-- Adds a closed sub-path rectangle of the size `a_width' x `a_height'
			-- to the current path at position (`a_x',`a_y') in user-space coordinates.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_rectangle(item, a_x, a_y, a_width, a_height)
		end

	glyph_path(a_glyphs:CAIRO_GLYPHS_CONTAINER)
			-- Add closed paths for the `a_glyphs' to the current path.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_glyph_path(item, a_glyphs.item_pointer, a_glyphs.count)
		end

	text_path(a_text:READABLE_STRING_GENERAL)
			-- Adds closed paths for `a_text' to the current path.
			-- This is considered by the cairo designers as a "toy" text API.
		require
			Is_Valid:is_valid
		local
			l_c_pointer:C_STRING
		do
			create l_c_pointer.make (utf_converter.string_32_to_utf_8_string_8 (a_text.to_string_32))
			{CAIRO_EXTERNALS}.cairo_text_path(item, l_c_pointer.item)
		end

	relative_curve_to(a_dx1, a_dy1, a_dx2, a_dy2, a_dx3, a_dy3:REAL_64)
			-- Like `curve_to' but relative to the current point.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_rel_curve_to(item, a_dx1, a_dy1, a_dx2, a_dy2, a_dx3, a_dy3)
		end

	relative_line_to(a_dx, a_dy:REAL_64)
			-- Like `line_to' but relative to the current point.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_rel_line_to(item, a_dx, a_dy)
		end

	relative_move_to(a_dx, a_dy:REAL_64)
			-- Like `move_to' but relative to the current point.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_rel_move_to(item, a_dx, a_dy)
		end

	path_extends:TUPLE[x1, y1, x2, y2:REAL_64]
			-- a bounding box in user coordinates covering the area
			-- on the current path. If the current path is empty,
			-- returns an empty rectangle ((0,0), (0,0)).
			-- Stroke parameters, fill rule, surface dimensions and clipping
			-- are not taken into account.
		require
			Is_Valid:is_valid
		local
			l_x1, l_y1, l_x2, l_y2:REAL_64
		do
			{CAIRO_EXTERNALS}.cairo_path_extents(item, $l_x1, $l_y1, $l_x2, $l_y2)
			Result := [l_x1, l_y1, l_x2, l_y2]
		end

	set_font_size(a_size:REAL_64)
			-- Sets the current font matrix to a scale by a factor of `a_size'
			-- This replace the `font_matrix'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_font_size(item, a_size)
		end

	font_matrix:CAIRO_TRANSFORMATION_MATRIX assign set_font_matrix
			-- The transformation matrix that is applied to the text drawing
		require
			Is_Valid:is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_get_font_matrix(item, Result.item)
		end


	set_font_matrix(a_matrix:CAIRO_TRANSFORMATION_MATRIX)
			-- Assign `font_matrix' with the value of `a_matrix'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_font_matrix(item, a_matrix.item)
		ensure
			Is_Assign: font_matrix ~ a_matrix
		end

	font_options:CAIRO_FONT_OPTIONS assign set_font_options
			-- Text rendering options
		require
			Is_Valid:is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_get_font_options(item, Result.item)
		end

	set_font_options(a_options:CAIRO_FONT_OPTIONS)
			-- Assign `font_options' with the value of `a_options'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_font_options(item, a_options.item)
		ensure
			Is_Assign: font_options ~ a_options
		end

	font_face:CAIRO_FONT_FACE assign set_font_face
			-- The font face used to render text.
		require
			Is_Valid:is_valid
		do
			create Result.make({CAIRO_EXTERNALS}.cairo_get_font_face(item))
			error_code := {CAIRO_EXTERNALS}.cairo_status(item)
		end

	set_font_face(a_face:CAIRO_FONT_FACE)
			-- Assign `font_face' with the value of `a_face'.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_font_face(item, a_face.item)
		end

	scaled_font:CAIRO_SCALED_FONT assign set_scaled_font
			-- The scalsed font associated in `Current'
		require
			Is_Valid:is_valid
		do
			create Result.make_from_item ({CAIRO_EXTERNALS}.cairo_get_scaled_font(item))
			error_code := {CAIRO_EXTERNALS}.cairo_status(item)
		end

	set_scaled_font(a_font:CAIRO_SCALED_FONT)
			-- Assign `scaled_font' with the value of `a_font'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_scaled_font(item, a_font.item)
		end

	show_text(a_text:READABLE_STRING_GENERAL)
			-- Draw `a_text' on `Current' according to the current `font_face',
			-- `font_matrix' and `font_options'.
			-- This feature is part of the "toy" text API.
		require
			Is_Valid:is_valid
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (utf_converter.string_32_to_utf_8_string_8 (a_text.to_string_32))
			{CAIRO_EXTERNALS}.cairo_show_text(item, l_c_text.item)
		end

	show_glyphs(a_glyphs:CAIRO_GLYPHS_CONTAINER)
			-- A drawing operator that generates the shape from `a_glyphs'
			-- rendered according to the current `font_face', `font_matrix'
			-- and `font_options'
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_show_glyphs(item, a_glyphs.item_pointer, a_glyphs.count)
		end

	show_text_glyphs(
						a_glyphs:CAIRO_GLYPHS_CONTAINER;
						a_clusters:CAIRO_TEXT_CLUSTERS_CONTAINER
					)
				-- Render similar to `show_glyphs', but if the `surface'
				-- support it, used `a_clusters' to embed
				-- the text with the glyphs showed.
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_show_text_glyphs(
												item, a_clusters.text_c.item, -1,
												a_glyphs.item_pointer,
												a_glyphs.count,
												a_clusters.item_pointer,
												a_clusters.count,
												a_clusters.flag_backward
											)
		end

	text_extents(a_text:READABLE_STRING_GENERAL):CAIRO_TEXT_EXTENTS
			-- The extents of `a_text' using `Current'
		require
			Is_Valid: is_valid
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (utf_converter.string_32_to_utf_8_string_8 (a_text.to_string_32))
			create Result
			{CAIRO_EXTERNALS}.cairo_text_extents(item, l_c_text.item, Result.item)
		end

	glyph_extents(a_glyphs:CAIRO_GLYPHS_CONTAINER):CAIRO_TEXT_EXTENTS
			-- The extents of `a_glyphs' using `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_glyph_extents(
									item, a_glyphs.item_pointer,
									a_glyphs.count, Result.item
								)
		end

	translate(a_x, a_y:REAL_64)
			-- Modifies the `transformation_matrix'
			-- by translating the user-space origin by
			-- `a_x' (horizontally), `a_y' (vertically)
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_translate(item, a_x, a_y)
		end

	scale(a_x, a_y:REAL_64)
			-- Modifies the `transformation_matrix'
			-- by scaling the user-space origin by
			-- `a_x' (horizontally), `a_y' (vertically)
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_scale(item, a_x, a_y)
		end

	rotate(a_angle:REAL_64)
			-- Modifies the `transformation_matrix'
			-- by rotating the user-space axes by `a_angle' radians
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_rotate(item, a_angle)
		end

	transform(a_matrix:CAIRO_TRANSFORMATION_MATRIX)
			-- Modifies the `transformation_matrix'
			-- by applying `a_matrix' as an additional transformation.
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_transform(item, a_matrix.item)
		end

	transformation_matrix:CAIRO_TRANSFORMATION_MATRIX assign set_transformation_matrix
			-- The current transformation matrix (CTM)
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_get_matrix(item, Result.item)
		end

	set_transformation_matrix(a_matrix:CAIRO_TRANSFORMATION_MATRIX)
			-- Assign `transformation_matrix' with the value of `a_matrix'
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_set_matrix(item, a_matrix.item)
		ensure
			Is_Assign: transformation_matrix ~ a_matrix
		end

	identity_matrix
			-- Set the `transformation_matrix' to the identity matrix
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_identity_matrix(item)
		end

	user_to_device(a_x, a_y:REAL_64):TUPLE[x, y:REAL_64]
			-- Transform the coordinate (`a_x',`a_y') from user space
			-- to device space by multiplying the given point by
			-- `transformation_matrix'.
		require
			Is_Valid: is_valid
		local
			l_x, l_y:REAL_64
		do
			l_x := a_x
			l_y := a_y
			{CAIRO_EXTERNALS}.cairo_user_to_device(item, $a_x, $a_y)
			Result := [l_x, l_y]
		end

	user_to_device_distance(a_x, a_y:REAL_64):TUPLE[x, y:REAL_64]
			-- Transform the distance vector (`a_x',`a_y') from user space
			-- to device space by multiplying the given point by
			-- `transformation_matrix'.
			-- This function is similar to `user_to_device' except that
			-- the translation components of the `transformation_matrix'
			-- will be ignored.
		require
			Is_Valid: is_valid
		local
			l_x, l_y:REAL_64
		do
			l_x := a_x
			l_y := a_y
			{CAIRO_EXTERNALS}.cairo_user_to_device_distance(item, $a_x, $a_y)
			Result := [l_x, l_y]
		end

	device_to_user(a_x, a_y:REAL_64):TUPLE[x, y:REAL_64]
			-- Transform the coordinate (`a_x',`a_y') from device space
			-- to user space by multiplying the given point by the
			-- inverse `transformation_matrix'.
		require
			Is_Valid: is_valid
		local
			l_x, l_y:REAL_64
		do
			l_x := a_x
			l_y := a_y
			{CAIRO_EXTERNALS}.cairo_device_to_user(item, $a_x, $a_y)
			Result := [l_x, l_y]
		end

	device_to_user_distance(a_x, a_y:REAL_64):TUPLE[x, y:REAL_64]
			-- Transform the distance vector (`a_x',`a_y') from device space
			-- to user space by multiplying the given point by the
			-- inverse `transformation_matrix'.
			-- This function is similar to `device_to_user' except that
			-- the translation components of the `transformation_matrix'
			-- will be ignored.
		require
			Is_Valid: is_valid
		local
			l_x, l_y:REAL_64
		do
			l_x := a_x
			l_y := a_y
			{CAIRO_EXTERNALS}.cairo_device_to_user_distance(item, $a_x, $a_y)
			Result := [l_x, l_y]
		end


feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_destroy(item)
		end

	utf_converter:UTF_CONVERTER
			-- Used to convert {STRING_32} and {STRING_8} to UTF-8

end
