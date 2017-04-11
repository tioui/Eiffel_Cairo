note
	description: "A pattern that can be used as canvas for drawing"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		rename
			make as make_from_item
		end
	CAIRO_PATTERN_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make_from_item

feature {NONE} -- Initialization

	validate_item
			-- Used after the `item' creation to validate the `item'
		do
			if not item.is_default_pointer then
				error_code := {CAIRO_EXTERNALS}.cairo_pattern_status(item)
				is_valid := is_success
			end
		end

feature -- Access

	disable_extend
			-- Pixels outside of the source pattern are fully transparent
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_extend(item, {CAIRO_EXTERNALS}.CAIRO_EXTEND_NONE)
		ensure
			Is_Disabled: is_extend_disabled
			Is_Extends_disabled: not (is_extend_repeat or is_extend_reflect or is_extend_pad)
		end

	is_extend_disabled:BOOLEAN
			-- `True' if pixels outside of the source pattern are fully transparent
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_extend(item) = {CAIRO_EXTERNALS}.CAIRO_EXTEND_NONE
		end

	set_extend_repeat
			-- `Current' is tiled by repeating
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_extend(item, {CAIRO_EXTERNALS}.CAIRO_EXTEND_REPEAT)
		ensure
			Is_Set: is_extend_repeat
			Other_Not_Set: not (is_extend_disabled or is_extend_reflect or is_extend_pad)
		end

	is_extend_repeat:BOOLEAN
			-- `True' if `Current' is tiled by repeating
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_extend(item) = {CAIRO_EXTERNALS}.CAIRO_EXTEND_REPEAT
		end

	set_extend_reflect
			-- `Current' is tiled by reflecting at the edges
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_extend(item, {CAIRO_EXTERNALS}.CAIRO_EXTEND_REFLECT)
		ensure
			Is_Set: is_extend_reflect
			Other_Not_Set: not (is_extend_disabled or is_extend_repeat or is_extend_pad)
		end

	is_extend_reflect:BOOLEAN
			-- `True' if `Current' is tiled by reflecting at the edges
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_extend(item) = {CAIRO_EXTERNALS}.CAIRO_EXTEND_REFLECT
		end

	set_extend_pad
			-- The pixels outside of the pattern copy the closest pixel from the source
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_extend(item, {CAIRO_EXTERNALS}.CAIRO_EXTEND_PAD)
		ensure
			Is_Set: is_extend_pad
			Other_Not_Set: not (is_extend_disabled or is_extend_repeat or is_extend_reflect)
		end

	is_extend_pad:BOOLEAN
			-- `True' if the pixels outside of the pattern copy the closest pixel from the source
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_extend(item) = {CAIRO_EXTERNALS}.CAIRO_EXTEND_PAD
		end

	set_transformation_matrix(a_matrix:CAIRO_TRANSFORMATION_MATRIX)
			-- Set the {CAIRO_TRANSFORMATION_MATRIX} of `Current'
			-- This matrix is a transformation from user space to pattern space.
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_matrix(item,a_matrix.item)
		end

	transformation_matrix:CAIRO_TRANSFORMATION_MATRIX
			-- The {CAIRO_TRANSFORMATION_MATRIX} of `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_pattern_get_matrix(item, Result.item)
		end

	set_filter_fast
			-- Use the fastest filter for resizing when using `Current'
			-- The quality is similar to `set_filter_nearest'
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_filter(item, {CAIRO_EXTERNALS}.CAIRO_FILTER_FAST)
		ensure
			Is_Set: is_filter_fast
		end

	is_filter_fast:BOOLEAN
			-- `True' if `Current' use the fastest filter for resizing
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_filter(item) = {CAIRO_EXTERNALS}.CAIRO_FILTER_FAST
		end

	set_filter_good
			-- Use a well balanced quality/performance filter for resizing when using `Current'
			-- The quality is similar to `set_filter_bilinear'
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_filter(item, {CAIRO_EXTERNALS}.CAIRO_FILTER_GOOD)
		ensure
			Is_Set: is_filter_good
		end

	is_filter_good:BOOLEAN
			-- `True' if `Current' use a well balanced quality/performance filter for resizing
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_filter(item) = {CAIRO_EXTERNALS}.CAIRO_FILTER_GOOD
		end

	set_filter_best
			-- Use a high quality filter for resizing when using `Current'
			-- May not be suitable for interactive use.
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_filter(item, {CAIRO_EXTERNALS}.CAIRO_FILTER_BEST)
		ensure
			Is_Set: is_filter_best
		end

	is_filter_best:BOOLEAN
			-- `True' if `Current' use a high quality filter for resizing
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_filter(item) = {CAIRO_EXTERNALS}.CAIRO_FILTER_BEST
		end

	set_filter_nearest
			-- Use the nearest-neighbor filter for resizing when using `Current'
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_filter(item, {CAIRO_EXTERNALS}.CAIRO_FILTER_NEAREST)
		ensure
			Is_Set: is_filter_nearest
		end

	is_filter_nearest:BOOLEAN
			-- `True' if `Current' use the nearest-neighbor filter for resizing
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_filter(item) = {CAIRO_EXTERNALS}.CAIRO_FILTER_NEAREST
		end

	set_filter_bilinear
			-- Use a linear interpolation in two dimensions filter for resizing when using `Current'
		require
			Is_Valid: is_valid
		do
			{CAIRO_EXTERNALS}.cairo_pattern_set_filter(item, {CAIRO_EXTERNALS}.CAIRO_FILTER_BILINEAR)
		ensure
			Is_Set: is_filter_bilinear
		end

	is_filter_bilinear:BOOLEAN
			-- `True' if `Current' use a linear interpolation in two dimensions filter for resizing
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_pattern_get_filter(item) = {CAIRO_EXTERNALS}.CAIRO_FILTER_BILINEAR
		end

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_pattern_destroy(item)
		end
invariant
	Extend_Disabled_Valid: is_extend_disabled implies not
								(is_extend_repeat or is_extend_reflect or is_extend_pad)
	Extend_Repeated_Valid: is_extend_repeat implies not
								(is_extend_disabled or is_extend_reflect or is_extend_pad)
	Extend_Reflected_Valid: is_extend_reflect implies not
								(is_extend_repeat or is_extend_disabled or is_extend_pad)
	Extend_Paded_Valid: is_extend_pad implies not
								(is_extend_repeat or is_extend_reflect or is_extend_disabled)
end
