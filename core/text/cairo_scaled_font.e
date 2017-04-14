note
	description: "A {CAIRO_FONT_FACE} that is scaled"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_SCALED_FONT

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		rename
			make as make_from_item
		redefine
			make_from_item
		end
	DISPOSABLE
		undefine
			is_equal
		end
	CAIRO_NO_MEMORY_ERROR
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make_from_item

create
	make

feature {NONE} -- Initialization

	make_from_item(a_item:POINTER)
			-- <Precursor>
		do
			item := {CAIRO_EXTERNALS}.cairo_scaled_font_reference(a_item)
			error_code := {CAIRO_EXTERNALS}.cairo_scaled_font_status(item)
			is_valid := is_success
		end

	make(
			a_face:CAIRO_FONT_FACE;
			a_font_matrix, a_ctm_matrix:CAIRO_TRANSFORMATION_MATRIX;
			a_options:CAIRO_FONT_OPTIONS
		)
			-- Initialization of `Current' using `a_face' as `font_face',
			-- `a_font_matrix' as `font_matrix', `a_ctm_matrix' as
			-- `ctm_matrix' and `a_options' as `options'.
		do
			item := {CAIRO_EXTERNALS}.cairo_scaled_font_create(
												a_face.item, a_font_matrix.item,
												a_ctm_matrix.item, a_options.item
											)
			error_code := {CAIRO_EXTERNALS}.cairo_scaled_font_status(item)
			is_valid := is_success
		end

feature -- Access

	font_face:CAIRO_FONT_FACE
			-- The font face used in `Current'
		require
			Is_Valid: is_valid
		do
			create Result.make ({CAIRO_EXTERNALS}.cairo_scaled_font_get_font_face(item))
		end

	options:CAIRO_FONT_OPTIONS
			-- Th font options used in `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_get_font_options(item, Result.item)
		end

	font_matrix:CAIRO_TRANSFORMATION_MATRIX
			-- Font space to user space transformation matrix for `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_get_font_matrix(item, Result.item)
		end

	ctm_matrix:CAIRO_TRANSFORMATION_MATRIX
			-- User to device transformation matrix for `Current'
			-- Note that the translation offsets (x0, y0) of the matrix are
			-- ignored by `Current'. So, the matrix this function returns
			-- always has 0,0 as x0,y0.
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_get_ctm(item, Result.item)
		end

	scaled_matrix:CAIRO_TRANSFORMATION_MATRIX
			-- Product of the `font_matrix' and the `ctm_matrix' associated
			-- with `Current', and hence is the matrix mapping from
			-- font space to device space.
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_get_scale_matrix(item, Result.item)
		end

	font_extents:CAIRO_FONT_EXTENTS
			-- The metric of `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_extents(item, Result.item)
		end

	text_extents(a_text:READABLE_STRING_GENERAL):CAIRO_TEXT_EXTENTS
			-- The extents of `a_text' using `Current'
		require
			Is_Valid: is_valid
		local
			l_utf_converter:UTF_CONVERTER
			l_c_text:C_STRING
		do
			create l_utf_converter
			create l_c_text.make (l_utf_converter.string_32_to_utf_8_string_8 (a_text.to_string_32))
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_text_extents(item, l_c_text.item, Result.item)
		end

	glyph_extents(a_glyphs:CAIRO_GLYPHS_CONTAINER):CAIRO_TEXT_EXTENTS
			-- The extents of `a_glyphs' using `Current'
		require
			Is_Valid: is_valid
		do
			create Result
			{CAIRO_EXTERNALS}.cairo_scaled_font_glyph_extents(
									item, a_glyphs.item_pointer,
									a_glyphs.count, Result.item
								)
		end

	text_to_glyphs(a_text:READABLE_STRING_GENERAL; a_x, a_y:REAL_64): TUPLE[
															glyphs:CAIRO_GLYPHS_CONTAINER;
															clusters:CAIRO_TEXT_CLUSTERS_CONTAINER
														]
			-- Converts UTF-8 text to an array of glyphs, optionally with cluster
			-- mapping, that can be used to render `a_text'. `a_x' represent the
			-- vertical position to place first glyph and `a_y' the horizontal
			-- position.
		local
			l_utf_converter:UTF_CONVERTER
			l_c_string:C_STRING
			l_glyphs_pointer, l_clusters_pointer:POINTER
			l_glyphs_count, l_clusters_count, l_cluster_flags:INTEGER
		do
			create l_utf_converter
			create l_c_string.make (l_utf_converter.string_32_to_utf_8_string_8 (a_text.to_string_32))
			error_code := {CAIRO_EXTERNALS}.cairo_scaled_font_text_to_glyphs(
												item, a_x, a_y, l_c_string.item, -1,
												$l_glyphs_pointer, $l_glyphs_count,
												$l_clusters_pointer, $l_clusters_count,
												$l_cluster_flags
											)
			if
				is_success and
				not l_glyphs_pointer.is_default_pointer and
				not l_clusters_pointer.is_default_pointer
			then
				Result := [
							create {CAIRO_GLYPHS_CONTAINER}.make_from_pointer (l_glyphs_pointer, l_glyphs_count),
							create {CAIRO_TEXT_CLUSTERS_CONTAINER}.make_from_pointer (l_clusters_pointer, l_clusters_count, l_cluster_flags, l_c_string)
						]
			else
				Result := [
							create {CAIRO_GLYPHS_CONTAINER}.make (0),
							create {CAIRO_TEXT_CLUSTERS_CONTAINER}.make (0)
						]
			end
		end

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_scaled_font_destroy(item)
		end
end
