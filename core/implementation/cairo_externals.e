note
	description: "External (C language) feature"
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_EXTERNALS

feature -- Functions

	frozen cairo_image_surface_create(a_format, a_width, a_height:INTEGER):POINTER
		external
			"C (cairo_format_t, int, int) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_image_surface_create"
		end

	frozen cairo_image_surface_create_from_png(a_filename:POINTER):POINTER
		external
			"C (const char *) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_image_surface_create_from_png"
		end

	frozen cairo_surface_write_to_png(a_surface, a_filename:POINTER):INTEGER
		external
			"C (cairo_surface_t *, const char *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_surface_write_to_png"
		end

	frozen cairo_image_surface_create_for_data(a_data:POINTER; a_format, a_width, a_height, a_stride:INTEGER):POINTER
		external
			"C (unsigned char *, cairo_format_t, int, int, int) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_image_surface_create_for_data"
		end

	frozen cairo_surface_create_similar_image(a_other:POINTER; a_format, a_width, a_height:INTEGER):POINTER
		external
			"C (cairo_surface_t *, cairo_format_t, int, int) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_surface_create_similar_image"
		end

	frozen cairo_surface_create_similar(a_other:POINTER; a_content, a_width, a_height:INTEGER):POINTER
		external
			"C (cairo_surface_t *, cairo_content_t, int, int) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_surface_create_similar"
		end

	frozen cairo_surface_create_for_rectangle(a_target:POINTER; a_x, a_y, a_width, a_height:REAL_64):POINTER
		external
			"C (cairo_surface_t *, double, double, double, double) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_surface_create_for_rectangle"
		end

	frozen cairo_status_to_string(a_status:INTEGER):POINTER
		external
			"C (cairo_status_t) : const char * | <cairo.h>"
		alias
			"cairo_status_to_string"
		end

	frozen cairo_surface_status(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_surface_status"
		end

	frozen cairo_format_stride_for_width(a_format, a_width:INTEGER):INTEGER
		external
			"C (cairo_format_t, int) : int | <cairo.h>"
		alias
			"cairo_format_stride_for_width"
		end

	frozen cairo_surface_destroy(a_surface:POINTER)
		external
			"C (cairo_surface_t *) | <cairo.h>"
		alias
			"cairo_surface_destroy"
		end

	frozen cairo_surface_get_reference_count(a_surface:POINTER):NATURAL
		external
			"C (cairo_surface_t *) : unsigned int | <cairo.h>"
		alias
			"cairo_surface_get_reference_count"
		end

	frozen cairo_image_surface_get_data(a_surface:POINTER):POINTER
		external
			"C (cairo_surface_t *) : unsigned char * | <cairo.h>"
		alias
			"cairo_image_surface_get_data"
		end

	frozen cairo_image_surface_get_format(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : cairo_format_t | <cairo.h>"
		alias
			"cairo_image_surface_get_format"
		end

	frozen cairo_image_surface_get_width(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : int | <cairo.h>"
		alias
			"cairo_image_surface_get_width"
		end

	frozen cairo_image_surface_get_height(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : int | <cairo.h>"
		alias
			"cairo_image_surface_get_height"
		end

	frozen cairo_image_surface_get_stride(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : int | <cairo.h>"
		alias
			"cairo_image_surface_get_stride"
		end

	frozen cairo_surface_flush(a_surface:POINTER)
		external
			"C (cairo_surface_t *) | <cairo.h>"
		alias
			"cairo_surface_flush"
		end

	frozen cairo_surface_get_content(a_surface:POINTER):INTEGER
		external
			"C (cairo_surface_t *) : cairo_content_t | <cairo.h>"
		alias
			"cairo_surface_get_content"
		end

	frozen cairo_surface_mark_dirty(a_surface:POINTER)
		external
			"C (cairo_surface_t *) | <cairo.h>"
		alias
			"cairo_surface_mark_dirty"
		end

	frozen cairo_surface_mark_dirty_rectangle(a_surface:POINTER; a_x, a_y, a_width, a_height:INTEGER)
		external
			"C (cairo_surface_t *, int, int, int, int) | <cairo.h>"
		alias
			"cairo_surface_mark_dirty_rectangle"
		end

	frozen cairo_surface_get_device_offset(a_surface, a_x_offset, a_y_offset:POINTER)
		external
			"C (cairo_surface_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_surface_get_device_offset"
		end

	frozen cairo_surface_set_device_offset(a_surface:POINTER; a_x_offset, a_y_offset:REAL_64)
		external
			"C (cairo_surface_t *, double, double) | <cairo.h>"
		alias
			"cairo_surface_set_device_offset"
		end

	frozen cairo_surface_get_font_options(a_surface, a_options:POINTER)
		external
			"C (cairo_surface_t *, cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_surface_get_font_options"
		end

	frozen cairo_matrix_init_identity(a_matrix:POINTER)
		external
			"C (cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_matrix_init_identity"
		end

	frozen cairo_matrix_init(a_matrix:POINTER; a_xx, a_yx, a_xy, a_yy, a_x0, a_y0:REAL_64)
		external
			"C (cairo_matrix_t *, double, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_matrix_init"
		end

	frozen cairo_matrix_init_translate(a_matrix:POINTER; a_tx, a_ty:REAL_64)
		external
			"C (cairo_matrix_t *, double, double) | <cairo.h>"
		alias
			"cairo_matrix_init_translate"
		end

	frozen cairo_matrix_init_scale(a_matrix:POINTER; a_sx, a_sy:REAL_64)
		external
			"C (cairo_matrix_t *, double, double) | <cairo.h>"
		alias
			"cairo_matrix_init_scale"
		end

	frozen cairo_matrix_init_rotate(a_matrix:POINTER; a_radians:REAL_64)
		external
			"C (cairo_matrix_t *, double) | <cairo.h>"
		alias
			"cairo_matrix_init_rotate"
		end

	frozen cairo_matrix_translate(a_matrix:POINTER; a_tx, a_ty:REAL_64)
		external
			"C (cairo_matrix_t *, double, double) | <cairo.h>"
		alias
			"cairo_matrix_translate"
		end

	frozen cairo_matrix_scale(a_matrix:POINTER; a_sx, a_sy:REAL_64)
		external
			"C (cairo_matrix_t *, double, double) | <cairo.h>"
		alias
			"cairo_matrix_scale"
		end

	frozen cairo_matrix_rotate(a_matrix:POINTER; a_radians:REAL_64)
		external
			"C (cairo_matrix_t *, double) | <cairo.h>"
		alias
			"cairo_matrix_rotate"
		end

	frozen cairo_matrix_invert(a_matrix:POINTER):INTEGER
		external
			"C (cairo_matrix_t *) : int | <cairo.h>"
		alias
			"cairo_matrix_invert"
		end

	frozen cairo_matrix_multiply(a_result, a_a, a_b:POINTER)
		external
			"C (cairo_matrix_t *, const cairo_matrix_t *, const cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_matrix_multiply"
		end

	frozen cairo_matrix_transform_distance(a_matrix, a_dx, a_dy:POINTER)
		external
			"C (const cairo_matrix_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_matrix_transform_distance"
		end

	frozen cairo_matrix_transform_point(a_matrix, a_x, a_y:POINTER)
		external
			"C (const cairo_matrix_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_matrix_transform_point"
		end

	frozen cairo_font_face_reference(a_font_face:POINTER) : POINTER
		external
			"C (cairo_font_face_t *) : cairo_font_face_t * | <cairo.h>"
		alias
			"cairo_font_face_reference"
		end

	frozen cairo_font_face_get_reference_count(a_font_face:POINTER) : NATURAL
		external
			"C (cairo_font_face_t *) : unsigned int | <cairo.h>"
		alias
			"cairo_font_face_get_reference_count"
		end

	frozen cairo_font_face_destroy(a_font_face:POINTER)
		external
			"C (cairo_font_face_t *) | <cairo.h>"
		alias
			"cairo_font_face_destroy"
		end

	frozen cairo_font_face_status(a_font_face:POINTER):INTEGER
		external
			"C (cairo_font_face_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_font_face_status"
		end

	frozen cairo_font_face_get_type(a_font_face:POINTER):INTEGER
		external
			"C (cairo_font_face_t *) : cairo_font_type_t | <cairo.h>"
		alias
			"cairo_font_face_get_type"
		end

	frozen cairo_font_options_create:POINTER
		external
			"C : cairo_font_options_t * | <cairo.h>"
		alias
			"cairo_font_options_create"
		end

	frozen cairo_font_options_status(a_options:POINTER):INTEGER
		external
			"C (cairo_font_options_t *) : int | <cairo.h>"
		alias
			"cairo_font_options_status"
		end

	frozen cairo_font_options_copy(a_original:POINTER):POINTER
		external
			"C (const cairo_font_options_t *) : cairo_font_options_t * | <cairo.h>"
		alias
			"cairo_font_options_copy"
		end

	frozen cairo_font_options_destroy(a_options:POINTER)
		external
			"C (cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_font_options_destroy"
		end

	frozen cairo_font_options_merge(a_options, a_other:POINTER)
		external
			"C (cairo_font_options_t *, const cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_font_options_merge"
		end

	frozen cairo_font_options_hash(a_options:POINTER):NATURAL_32
		external
			"C (const cairo_font_options_t *) : unsigned long | <cairo.h>"
		alias
			"cairo_font_options_hash"
		end

	frozen cairo_font_options_equal(a_options, a_other:POINTER):BOOLEAN
		external
			"C (const cairo_font_options_t *, const cairo_font_options_t *) : cairo_bool_t | <cairo.h>"
		alias
			"cairo_font_options_equal"
		end

	frozen cairo_font_options_set_antialias(a_options:POINTER; a_antialias:INTEGER)
		external
			"C (cairo_font_options_t *, cairo_antialias_t) | <cairo.h>"
		alias
			"cairo_font_options_set_antialias"
		end

	frozen cairo_font_options_get_antialias(a_options:POINTER):INTEGER
		external
			"C (const cairo_font_options_t *) : cairo_antialias_t | <cairo.h>"
		alias
			"cairo_font_options_get_antialias"
		end

	frozen cairo_font_options_set_subpixel_order(a_options:POINTER; a_subpixel_order:INTEGER)
		external
			"C (cairo_font_options_t *, cairo_subpixel_order_t) | <cairo.h>"
		alias
			"cairo_font_options_set_subpixel_order"
		end

	frozen cairo_font_options_get_subpixel_order(a_options:POINTER):INTEGER
		external
			"C (const cairo_font_options_t *) : cairo_subpixel_order_t | <cairo.h>"
		alias
			"cairo_font_options_get_subpixel_order"
		end

	frozen cairo_font_options_set_hint_style(a_options:POINTER; a_hint_style:INTEGER)
		external
			"C (cairo_font_options_t *, cairo_hint_style_t) | <cairo.h>"
		alias
			"cairo_font_options_set_hint_style"
		end

	frozen cairo_font_options_get_hint_style(a_options:POINTER):INTEGER
		external
			"C (const cairo_font_options_t *) : cairo_hint_style_t | <cairo.h>"
		alias
			"cairo_font_options_get_hint_style"
		end

	frozen cairo_font_options_set_hint_metrics(a_options:POINTER; a_hint_metrics:INTEGER)
		external
			"C (cairo_font_options_t *, cairo_hint_metrics_t) | <cairo.h>"
		alias
			"cairo_font_options_set_hint_metrics"
		end

	frozen cairo_font_options_get_hint_metrics(a_options:POINTER):INTEGER
		external
			"C (const cairo_font_options_t *) : cairo_hint_metrics_t | <cairo.h>"
		alias
			"cairo_font_options_get_hint_metrics"
		end

	frozen cairo_surface_get_device(a_surface:POINTER):POINTER
		external
			"C (cairo_surface_t *) : cairo_device_t * | <cairo.h>"
		alias
			"cairo_surface_get_device"
		end

	frozen cairo_device_get_type(a_device:POINTER):INTEGER
		external
			"C (cairo_device_t *) : cairo_device_type_t | <cairo.h>"
		alias
			"cairo_device_get_type"
		end

	frozen cairo_device_reference(a_device:POINTER):POINTER
		external
			"C (cairo_device_t *) : cairo_device_t * | <cairo.h>"
		alias
			"cairo_device_reference"
		end

	frozen cairo_device_destroy(a_device:POINTER)
		external
			"C (cairo_device_t *) | <cairo.h>"
		alias
			"cairo_device_destroy"
		end

	frozen cairo_device_status(a_device:POINTER):INTEGER
		external
			"C (cairo_device_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_device_status"
		end

	frozen cairo_device_flush(a_device:POINTER)
		external
			"C (cairo_device_t *) | <cairo.h>"
		alias
			"cairo_device_flush"
		end

	frozen cairo_device_acquire(a_device:POINTER):INTEGER
		external
			"C (cairo_device_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_device_acquire"
		end

	frozen cairo_device_release(a_device:POINTER)
		external
			"C (cairo_device_t *) | <cairo.h>"
		alias
			"cairo_device_release"
		end

	frozen cairo_surface_get_device_scale(a_surface, a_x_scale, a_y_scale:POINTER)
		external
			"C (cairo_surface_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_surface_get_device_scale"
		end

	frozen cairo_surface_set_device_scale(a_surface:POINTER; a_x_scale, a_y_scale:REAL_64)
		external
			"C (cairo_surface_t *, double, double) | <cairo.h>"
		alias
			"cairo_surface_set_device_scale"
		end

	frozen cairo_surface_get_fallback_resolution(a_surface, a_x_pixels_per_inch, a_y_pixels_per_inch:POINTER)
		external
			"C (cairo_surface_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_surface_get_fallback_resolution"
		end

	frozen cairo_surface_set_fallback_resolution(a_surface:POINTER; a_x_pixels_per_inch, a_y_pixels_per_inch:REAL_64)
		external
			"C (cairo_surface_t *, double, double) | <cairo.h>"
		alias
			"cairo_surface_set_fallback_resolution"
		end

	frozen cairo_surface_copy_page(a_surface:POINTER)
		external
			"C (cairo_surface_t *) | <cairo.h>"
		alias
			"cairo_surface_copy_page"
		end

	frozen cairo_surface_show_page(a_surface:POINTER)
		external
			"C (cairo_surface_t *) | <cairo.h>"
		alias
			"cairo_surface_show_page"
		end

	frozen cairo_surface_has_show_text_glyphs(a_surface:POINTER) : BOOLEAN
		external
			"C (cairo_surface_t *) : cairo_bool_t | <cairo.h>"
		alias
			"cairo_surface_has_show_text_glyphs"
		end

	frozen cairo_pdf_surface_create(a_filename:POINTER; a_width_in_points, a_height_in_points:REAL_64) : POINTER
		external
			"C (const char *, double, double) : cairo_surface_t * | <cairo-pdf.h>"
		alias
			"cairo_pdf_surface_create"
		end

	frozen cairo_pdf_surface_restrict_to_version(a_surface:POINTER; a_version:INTEGER)
		external
			"C (cairo_surface_t *, cairo_pdf_version_t) | <cairo-pdf.h>"
		alias
			"cairo_pdf_surface_restrict_to_version"
		end

	frozen cairo_pdf_surface_set_size(a_surface:POINTER; a_width_in_points, a_height_in_points:REAL_64)
		external
			"C (cairo_surface_t *, double, double) | <cairo-pdf.h>"
		alias
			"cairo_pdf_surface_set_size"
		end

	frozen cairo_svg_surface_create(a_filename:POINTER; a_width_in_points, a_height_in_points:REAL_64) : POINTER
		external
			"C (const char *, double, double) : cairo_surface_t * | <cairo-svg.h>"
		alias
			"cairo_svg_surface_create"
		end

	frozen cairo_svg_surface_restrict_to_version(a_surface:POINTER; a_version:INTEGER)
		external
			"C (cairo_surface_t *, cairo_svg_version_t) | <cairo-svg.h>"
		alias
			"cairo_svg_surface_restrict_to_version"
		end

	frozen cairo_create(a_surface:POINTER) : POINTER
		external
			"C (cairo_surface_t *) : cairo_t * | <cairo.h>"
		alias
			"cairo_create"
		end

	frozen cairo_destroy(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_destroy"
		end

	frozen cairo_status(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_status"
		end

	frozen cairo_save(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_save"
		end

	frozen cairo_restore(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_restore"
		end

	frozen cairo_push_group(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_push_group"
		end

	frozen cairo_push_group_with_content(a_cr:POINTER; a_content:INTEGER)
		external
			"C (cairo_t *, cairo_content_t) | <cairo.h>"
		alias
			"cairo_push_group_with_content"
		end

	frozen cairo_pop_group(a_cr:POINTER) : POINTER
		external
			"C (cairo_t *) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pop_group"
		end

	frozen cairo_pop_group_to_source(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_pop_group_to_source"
		end

	frozen cairo_get_group_target(a_cr:POINTER):POINTER
		external
			"C (cairo_t *) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_get_group_target"
		end

	frozen cairo_set_source_rgb(a_cr:POINTER; a_red, a_green, a_blue:REAL_64)
		external
			"C (cairo_t *, double, double, double) | <cairo.h>"
		alias
			"cairo_set_source_rgb"
		end

	frozen cairo_set_source_rgba(a_cr:POINTER; a_red, a_green, a_blue, a_alpha:REAL_64)
		external
			"C (cairo_t *, double, double, double, double) | <cairo.h>"
		alias
			"cairo_set_source_rgba"
		end

	frozen cairo_set_source(a_cr, a_source:POINTER)
		external
			"C (cairo_t *, cairo_pattern_t *) | <cairo.h>"
		alias
			"cairo_set_source"
		end

	frozen cairo_set_source_surface(a_cr, a_surface:POINTER; a_x, a_y:REAL_64)
		external
			"C (cairo_t *, cairo_surface_t *, double, double) | <cairo.h>"
		alias
			"cairo_set_source_surface"
		end

	frozen cairo_get_source(a_cr:POINTER):POINTER
		external
			"C (cairo_t *) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_get_source"
		end

	frozen cairo_set_antialias(a_cr:POINTER; a_antialias:INTEGER)
		external
			"C (cairo_t *, int) | <cairo.h>"
		alias
			"cairo_set_antialias"
		end

	frozen cairo_get_antialias(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : int | <cairo.h>"
		alias
			"cairo_get_antialias"
		end

	frozen cairo_set_dash(a_cr, a_dashes:POINTER; a_num_dashes:INTEGER; a_offset:REAL_64)
		external
			"C (cairo_t *, const double *, int, double) | <cairo.h>"
		alias
			"cairo_set_dash"
		end

	frozen cairo_get_dash_count(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : int | <cairo.h>"
		alias
			"cairo_get_dash_count"
		end

	frozen cairo_get_dash(a_cr, a_dashes, a_offset:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_get_dash"
		end

	frozen cairo_set_fill_rule(a_cr:POINTER; a_fill_rule:INTEGER)
		external
			"C (cairo_t *, cairo_fill_rule_t) | <cairo.h>"
		alias
			"cairo_set_fill_rule"
		end

	frozen cairo_get_fill_rule(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : cairo_fill_rule_t | <cairo.h>"
		alias
			"cairo_get_fill_rule"
		end

	frozen cairo_set_line_cap(a_cr:POINTER; a_line_cap:INTEGER)
		external
			"C (cairo_t *, cairo_line_cap_t) | <cairo.h>"
		alias
			"cairo_set_line_cap"
		end

	frozen cairo_get_line_cap(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : cairo_line_cap_t | <cairo.h>"
		alias
			"cairo_get_line_cap"
		end

	frozen cairo_set_line_join(a_cr:POINTER; a_line_join:INTEGER)
		external
			"C (cairo_t *, cairo_line_cap_t) | <cairo.h>"
		alias
			"cairo_set_line_join"
		end

	frozen cairo_get_line_join(a_cr:POINTER) :INTEGER
		external
			"C (cairo_t *) : cairo_line_cap_t | <cairo.h>"
		alias
			"cairo_get_line_join"
		end

	frozen cairo_set_line_width(a_cr:POINTER; a_width:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_set_line_width"
		end

	frozen cairo_get_line_width(a_cr:POINTER):REAL_64
		external
			"C (cairo_t *) : double | <cairo.h>"
		alias
			"cairo_get_line_width"
		end

	frozen cairo_set_miter_limit(a_cr:POINTER; a_limit:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_set_miter_limit"
		end

	frozen cairo_get_miter_limit(a_cr:POINTER):REAL_64
		external
			"C (cairo_t *) : double | <cairo.h>"
		alias
			"cairo_get_miter_limit"
		end

	frozen cairo_set_operator(a_cr:POINTER; a_op:INTEGER)
		external
			"C (cairo_t *, cairo_operator_t) | <cairo.h>"
		alias
			"cairo_set_operator"
		end

	frozen cairo_get_operator(a_cr:POINTER):INTEGER
		external
			"C (cairo_t *) : cairo_operator_t | <cairo.h>"
		alias
			"cairo_get_operator"
		end

	frozen cairo_set_tolerance(a_cr:POINTER; a_tolerance:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_set_tolerance"
		end

	frozen cairo_get_tolerance(a_cr:POINTER):REAL_64
		external
			"C (cairo_t *) : double | <cairo.h>"
		alias
			"cairo_get_tolerance"
		end

	frozen cairo_clip(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_clip"
		end

	frozen cairo_clip_preserve(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_clip_preserve"
		end

	frozen cairo_clip_extents(a_cr, a_x1, a_y1, a_x2, a_y2:POINTER)
		external
			"C (cairo_t *, double *, double *, double *, double *) | <cairo.h>"
		alias
			"cairo_clip_extents"
		end

	frozen cairo_in_clip(a_cr:POINTER; a_x, a_y:REAL_64):BOOLEAN
		external
			"C (cairo_t *, double, double):cairo_bool_t | <cairo.h>"
		alias
			"cairo_in_clip"
		end

	frozen cairo_reset_clip(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_reset_clip"
		end

	frozen cairo_copy_clip_rectangle_list(a_cr:POINTER):POINTER
		external
			"C (cairo_t *) : cairo_rectangle_list_t * | <cairo.h>"
		alias
			"cairo_copy_clip_rectangle_list"
		end

	frozen cairo_fill(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_fill"
		end

	frozen cairo_fill_preserve(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_fill_preserve"
		end

	frozen cairo_fill_extents(a_cr, a_x1, a_y1, a_x2, a_y2:POINTER)
		external
			"C (cairo_t *, double *, double *, double *, double *) | <cairo.h>"
		alias
			"cairo_fill_extents"
		end

	frozen cairo_in_fill(a_cr:POINTER; a_x, a_y:REAL_64):BOOLEAN
		external
			"C (cairo_t *, double, double):cairo_bool_t | <cairo.h>"
		alias
			"cairo_in_fill"
		end

	frozen cairo_mask(a_cr, a_pattern:POINTER)
		external
			"C (cairo_t *, cairo_pattern_t *) | <cairo.h>"
		alias
			"cairo_mask"
		end

	frozen cairo_mask_surface(a_cr, a_surface:POINTER; a_surface_x, a_surface_y:REAL_64)
		external
			"C (cairo_t *, cairo_surface_t *, double, double) | <cairo.h>"
		alias
			"cairo_mask_surface"
		end

	frozen cairo_paint(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_paint"
		end

	frozen cairo_paint_with_alpha(a_cr:POINTER; a_alpha:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_paint_with_alpha"
		end

	frozen cairo_stroke(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_stroke"
		end

	frozen cairo_stroke_preserve(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_stroke_preserve"
		end

	frozen cairo_stroke_extents(a_cr, a_x1, a_y1, a_x2, a_y2:POINTER)
		external
			"C (cairo_t *, double *, double *, double *, double *) | <cairo.h>"
		alias
			"cairo_stroke_extents"
		end

	frozen cairo_in_stroke(a_cr:POINTER; a_x, a_y:REAL_64):BOOLEAN
		external
			"C (cairo_t *, double, double):cairo_bool_t | <cairo.h>"
		alias
			"cairo_in_stroke"
		end

	frozen cairo_copy_path(a_cr:POINTER):POINTER
		external
			"C (cairo_t *):cairo_path_t * | <cairo.h>"
		alias
			"cairo_copy_path"
		end

	frozen cairo_copy_path_flat(a_cr:POINTER):POINTER
		external
			"C (cairo_t *):cairo_path_t * | <cairo.h>"
		alias
			"cairo_copy_path_flat"
		end

	frozen cairo_append_path(a_cr, a_path:POINTER)
		external
			"C (cairo_t *, const cairo_path_t *) | <cairo.h>"
		alias
			"cairo_append_path"
		end

	frozen cairo_has_current_point(a_cr:POINTER):BOOLEAN
		external
			"C (cairo_t *) : cairo_bool_t | <cairo.h>"
		alias
			"cairo_has_current_point"
		end

	frozen cairo_get_current_point(a_cr, a_x, a_y:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_get_current_point"
		end

	frozen cairo_new_path(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_new_path"
		end

	frozen cairo_new_sub_path(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_new_sub_path"
		end

	frozen cairo_close_path(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_close_path"
		end

	frozen cairo_arc(a_cr:POINTER; a_xc, a_yc, a_radius, a_angle1, a_angle2:REAL_64)
		external
			"C (cairo_t *, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_arc"
		end

	frozen cairo_arc_negative(a_cr:POINTER; a_xc, a_yc, a_radius, a_angle1, a_angle2:REAL_64)
		external
			"C (cairo_t *, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_arc_negative"
		end

	frozen cairo_curve_to(a_cr:POINTER; a_x1, a_y1, a_x2, a_y2, a_x3, a_y3:REAL_64)
		external
			"C (cairo_t *, double, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_curve_to"
		end

	frozen cairo_line_to(a_cr:POINTER; a_x, a_y:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_line_to"
		end

	frozen cairo_move_to(a_cr:POINTER; a_x, a_y:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_move_to"
		end

	frozen cairo_rectangle(a_cr:POINTER; a_x, a_y, a_width, a_height:REAL_64)
		external
			"C (cairo_t *, double, double, double, double) | <cairo.h>"
		alias
			"cairo_rectangle"
		end

	frozen cairo_glyph_path(a_cr, a_glyphs:POINTER; a_num_glyphs:INTEGER)
		external
			"C (cairo_t *, const cairo_glyph_t *, int) | <cairo.h>"
		alias
			"cairo_glyph_path"
		end

	frozen cairo_text_path(a_cr, a_utf8:POINTER)
		external
			"C (cairo_t *, const char *) | <cairo.h>"
		alias
			"cairo_text_path"
		end

	frozen cairo_rel_curve_to(a_cr:POINTER; a_dx1, a_dy1, a_dx2, a_dy2, a_dx3, a_dy3:REAL_64)
		external
			"C (cairo_t *, double, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_rel_curve_to"
		end

	frozen cairo_rel_line_to(a_cr:POINTER; a_dx, a_dy:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_rel_line_to"
		end

	frozen cairo_rel_move_to(a_cr:POINTER; a_dx, a_dy:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_rel_move_to"
		end

	frozen cairo_path_extents(a_cr, a_x1, a_y1, a_x2, a_y2:POINTER)
		external
			"C (cairo_t *, double *, double *, double *, double *) | <cairo.h>"
		alias
			"cairo_path_extents"
		end

	frozen cairo_set_font_size(a_cr:POINTER; a_size:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_set_font_size"
		end

	frozen cairo_set_font_matrix(a_cr, a_matrix:POINTER)
		external
			"C (cairo_t *, const cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_set_font_matrix"
		end

	frozen cairo_get_font_matrix(a_cr, a_matrix:POINTER)
		external
			"C (cairo_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_get_font_matrix"
		end

	frozen cairo_set_font_options(a_cr, a_options:POINTER)
		external
			"C (cairo_t *, const cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_set_font_options"
		end

	frozen cairo_get_font_options(a_cr, a_options:POINTER)
		external
			"C (cairo_t *, cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_get_font_options"
		end

	frozen cairo_set_font_face(a_cr, a_font_face:POINTER)
		external
			"C (cairo_t *, cairo_font_face_t *) | <cairo.h>"
		alias
			"cairo_set_font_face"
		end

	frozen cairo_get_font_face(a_cr:POINTER):POINTER
		external
			"C (cairo_t *) : cairo_font_face_t * | <cairo.h>"
		alias
			"cairo_get_font_face"
		end

	frozen cairo_set_scaled_font(a_cr, a_scaled_font:POINTER)
		external
			"C (cairo_t *, const cairo_scaled_font_t *) | <cairo.h>"
		alias
			"cairo_set_scaled_font"
		end

	frozen cairo_get_scaled_font(a_cr:POINTER):POINTER
		external
			"C (cairo_t *) : cairo_scaled_font_t * | <cairo.h>"
		alias
			"cairo_get_scaled_font"
		end

	frozen cairo_show_text(a_cr, a_utf8:POINTER)
		external
			"C (cairo_t *, const char *) | <cairo.h>"
		alias
			"cairo_show_text"
		end

	frozen cairo_show_glyphs(a_cr, a_glyphs:POINTER; a_num_glyphs:INTEGER)
		external
			"C (cairo_t *, const cairo_glyph_t *, int) | <cairo.h>"
		alias
			"cairo_show_glyphs"
		end

	frozen cairo_show_text_glyphs(
					a_cr, a_utf8:POINTER;
					a_utf8_len:INTEGER;
					a_glyphs:POINTER;
					a_num_glyphs:INTEGER;
					a_clusters:POINTER;
					a_num_clusters, a_cluster_flags:INTEGER
				)
		external
			"C (cairo_t *, const char *, int, const cairo_glyph_t *, int, const cairo_text_cluster_t *, int, int) | <cairo.h>"
		alias
			"cairo_show_text_glyphs"
		end

	frozen cairo_text_extents(a_cr, a_utf8, a_extents:POINTER)
		external
			"C (cairo_t *, const char *, cairo_text_extents_t *) | <cairo.h>"
		alias
			"cairo_text_extents"
		end

	frozen cairo_glyph_extents(a_cr, a_glyphs:POINTER; a_num_glyphs:INTEGER; a_extents:POINTER)
		external
			"C (cairo_t *, const cairo_glyph_t *, int, cairo_text_extents_t *) | <cairo.h>"
		alias
			"cairo_glyph_extents"
		end

	frozen cairo_translate(a_cr:POINTER; a_tx, a_ty:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_translate"
		end

	frozen cairo_scale(a_cr:POINTER; a_sx, a_sy:REAL_64)
		external
			"C (cairo_t *, double, double) | <cairo.h>"
		alias
			"cairo_scale"
		end

	frozen cairo_rotate(a_cr:POINTER; a_angle:REAL_64)
		external
			"C (cairo_t *, double) | <cairo.h>"
		alias
			"cairo_rotate"
		end

	frozen cairo_transform(a_cr, a_matrix:POINTER)
		external
			"C (cairo_t *, const cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_transform"
		end

	frozen cairo_set_matrix(a_cr, a_matrix:POINTER)
		external
			"C (cairo_t *, const cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_set_matrix"
		end

	frozen cairo_get_matrix(a_cr, a_matrix:POINTER)
		external
			"C (cairo_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_get_matrix"
		end

	frozen cairo_identity_matrix(a_cr:POINTER)
		external
			"C (cairo_t *) | <cairo.h>"
		alias
			"cairo_identity_matrix"
		end

	frozen cairo_user_to_device(a_cr, a_x, a_:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_user_to_device"
		end

	frozen cairo_user_to_device_distance(a_cr, a_x, a_:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_user_to_device_distance"
		end

	frozen cairo_device_to_user(a_cr, a_x, a_:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_device_to_user"
		end

	frozen cairo_device_to_user_distance(a_cr, a_x, a_:POINTER)
		external
			"C (cairo_t *, double *, double *) | <cairo.h>"
		alias
			"cairo_device_to_user_distance"
		end

	frozen cairo_toy_font_face_create(a_family:POINTER; a_slant, a_weight:INTEGER):POINTER
		external
			"C (const char *, cairo_font_slant_t, cairo_font_weight_t) : cairo_font_face_t * | <cairo.h>"
		alias
			"cairo_toy_font_face_create"
		end

	frozen cairo_toy_font_face_get_family(a_font_face:POINTER):POINTER
		external
			"C (cairo_font_face_t *) : const char * | <cairo.h>"
		alias
			"cairo_toy_font_face_get_family"
		end

	frozen cairo_toy_font_face_get_slant(a_font_face:POINTER):INTEGER
		external
			"C (cairo_font_face_t *) : cairo_font_slant_t | <cairo.h>"
		alias
			"cairo_toy_font_face_get_slant"
		end

	frozen cairo_toy_font_face_get_weight(a_font_face:POINTER):INTEGER
		external
			"C (cairo_font_face_t *) : cairo_font_weight_t | <cairo.h>"
		alias
			"cairo_toy_font_face_get_weight"
		end

	frozen cairo_scaled_font_create(a_font_face, a_font_matrix, a_ctm, a_options:POINTER):POINTER
		external
			"C (cairo_font_face_t *, const cairo_matrix_t *, const cairo_matrix_t *, const cairo_font_options_t *) : cairo_scaled_font_t * | <cairo.h>"
		alias
			"cairo_scaled_font_create"
		end

	frozen cairo_scaled_font_reference(a_scaled_font:POINTER):POINTER
		external
			"C (cairo_scaled_font_t *) : cairo_scaled_font_t * | <cairo.h>"
		alias
			"cairo_scaled_font_reference"
		end

	frozen cairo_scaled_font_destroy(a_scaled_font:POINTER)
		external
			"C (cairo_scaled_font_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_destroy"
		end

	frozen cairo_scaled_font_get_reference_count(a_scaled_font:POINTER):NATURAL
		external
			"C (cairo_scaled_font_t *) : unsigned int | <cairo.h>"
		alias
			"cairo_scaled_font_get_reference_count"
		end

	frozen cairo_scaled_font_get_font_face(a_scaled_font:POINTER):POINTER
		external
			"C (cairo_scaled_font_t *) : cairo_font_face_t * | <cairo.h>"
		alias
			"cairo_scaled_font_get_font_face"
		end

	frozen cairo_scaled_font_status(a_scaled_font:POINTER):INTEGER
		external
			"C (cairo_scaled_font_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_scaled_font_status"
		end

	frozen cairo_scaled_font_get_font_options(a_scaled_font, a_options:POINTER)
		external
			"C (cairo_scaled_font_t *, cairo_font_options_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_get_font_options"
		end

	frozen cairo_scaled_font_get_font_matrix(a_scaled_font, a_matrix:POINTER)
		external
			"C (cairo_scaled_font_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_get_font_matrix"
		end

	frozen cairo_scaled_font_get_ctm(a_scaled_font, a_matrix:POINTER)
		external
			"C (cairo_scaled_font_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_get_ctm"
		end

	frozen cairo_scaled_font_get_scale_matrix(a_scaled_font, a_matrix:POINTER)
		external
			"C (cairo_scaled_font_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_get_scale_matrix"
		end

	frozen cairo_scaled_font_extents(a_scaled_font, a_extents:POINTER)
		external
			"C (cairo_scaled_font_t *, cairo_font_extents_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_extents"
		end

	frozen cairo_scaled_font_text_extents(a_scaled_font, a_utf8, a_extents:POINTER)
		external
			"C (cairo_scaled_font_t *, const char *, cairo_text_extents_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_text_extents"
		end

	frozen cairo_scaled_font_glyph_extents(a_scaled_font, a_glyphs:POINTER; a_num_glyphs:INTEGER; a_extents:POINTER)
		external
			"C (cairo_scaled_font_t *, const cairo_glyph_t *, int, cairo_text_extents_t *) | <cairo.h>"
		alias
			"cairo_scaled_font_glyph_extents"
		end

	frozen cairo_scaled_font_text_to_glyphs(
							a_scaled_font:POINTER;
							a_x, a_y:REAL_64;
							a_utf8:POINTER; a_utf8_len:INTEGER;
							a_glyphs, a_num_glyphs, a_clusters,
							a_num_clusters, a_cluster_flags:POINTER
						) : INTEGER
		external
			"C (cairo_scaled_font_t *, double, double, const char *, int, cairo_glyph_t **, int *, cairo_text_cluster_t **, int *, cairo_text_cluster_flags_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_scaled_font_text_to_glyphs"
		end

	frozen cairo_glyph_allocate(a_num_glyphs:INTEGER):POINTER
		external
			"C (int) : cairo_glyph_t * | <cairo.h>"
		alias
			"cairo_glyph_allocate"
		end

	frozen cairo_glyph_free(a_glyphs:POINTER)
		external
			"C (cairo_glyph_t *) | <cairo.h>"
		alias
			"cairo_glyph_free"
		end

	frozen cairo_text_cluster_allocate(a_num_clusters:INTEGER):POINTER
		external
			"C (int) : cairo_text_cluster_t * | <cairo.h>"
		alias
			"cairo_text_cluster_allocate"
		end

	frozen cairo_text_cluster_free(a_clusters:POINTER)
		external
			"C (cairo_text_cluster_t *) | <cairo.h>"
		alias
			"cairo_text_cluster_free"
		end

	frozen cairo_rectangle_list_destroy(a_rectangle_list:POINTER)
		external
			"C (cairo_rectangle_list_t *) | <cairo.h>"
		alias
			"cairo_rectangle_list_destroy"
		end

	frozen cairo_pattern_create_rgb(a_red, a_green, a_blue:REAL_64): POINTER
		external
			"C (double, double, double) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_rgb"
		end

	frozen cairo_pattern_destroy(a_pattern:POINTER)
		external
			"C (cairo_pattern_t *) | <cairo.h>"
		alias
			"cairo_pattern_destroy"
		end

	frozen cairo_pattern_status(a_pattern:POINTER):INTEGER
		external
			"C (cairo_pattern_t *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_status"
		end

	frozen cairo_pattern_create_rgba(a_red, a_green, a_blue, a_alpha:REAL_64): POINTER
		external
			"C (double, double, double, double) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_rgba"
		end

	frozen cairo_pattern_create_for_surface(a_surface:POINTER): POINTER
		external
			"C (cairo_surface_t *) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_for_surface"
		end

	frozen cairo_surface_reference(a_surface:POINTER): POINTER
		external
			"C (cairo_surface_t *) : cairo_surface_t * | <cairo.h>"
		alias
			"cairo_surface_reference"
		end

	frozen cairo_pattern_get_surface(a_pattern, a_surface:POINTER): INTEGER
		external
			"C (cairo_pattern_t *, cairo_surface_t **) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_surface"
		end

	frozen cairo_pattern_create_linear(a_x0, a_y0, a_x1, a_x2:REAL_64): POINTER
		external
			"C (double, double, double, double) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_linear"
		end

	frozen cairo_pattern_create_radial(a_cx0, a_cy0, a_radius0, a_cx1, a_cy1, a_radius1:REAL_64): POINTER
		external
			"C (double, double, double, double, double, double) : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_radial"
		end

	frozen cairo_pattern_add_color_stop_rgb(a_pattern:POINTER; a_offset, a_red, a_green, a_blue:REAL_64)
		external
			"C (cairo_pattern_t *, double, double, double, double) | <cairo.h>"
		alias
			"cairo_pattern_add_color_stop_rgb"
		end

	frozen cairo_pattern_add_color_stop_rgba(a_pattern:POINTER; a_offset, a_red, a_green, a_blue, a_alpha:REAL_64)
		external
			"C (cairo_pattern_t *, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_pattern_add_color_stop_rgba"
		end

	frozen cairo_pattern_get_color_stop_count(a_pattern, a_count:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, int *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_color_stop_count"
		end

	frozen cairo_pattern_get_color_stop_rgba(
							a_pattern:POINTER; a_index:INTEGER;
							a_offset, a_red, a_green, a_blue, a_alpha:POINTER
						):INTEGER
		external
			"C (cairo_pattern_t *, int, double *, double *, double *, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_color_stop_rgba"
		end

	frozen cairo_pattern_get_rgba(a_pattern, a_red, a_green, a_blue, a_alpha:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, double *, double *, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_rgba"
		end

	frozen cairo_pattern_get_linear_points(a_pattern, a_x0, a_y0, a_x1, a_y1:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, double *, double *, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_linear_points"
		end

	frozen cairo_pattern_get_radial_circles(a_pattern, a_x0, a_y0, a_radius0, a_x1, a_y1, a_radius1:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, double *, double *, double *, double *, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_pattern_get_radial_circles"
		end

	frozen cairo_pattern_set_extend(a_pattern:POINTER; a_extend:INTEGER)
		external
			"C (cairo_pattern_t *, cairo_extend_t) | <cairo.h>"
		alias
			"cairo_pattern_set_extend"
		end

	frozen cairo_pattern_get_extend(a_pattern:POINTER):INTEGER
		external
			"C (cairo_pattern_t *) : cairo_extend_t | <cairo.h>"
		alias
			"cairo_pattern_get_extend"
		end

	frozen cairo_pattern_set_matrix(a_pattern, a_matrix:POINTER)
		external
			"C (cairo_pattern_t *, const cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_pattern_set_matrix"
		end

	frozen cairo_pattern_get_matrix(a_pattern, a_matrix:POINTER)
		external
			"C (cairo_pattern_t *, cairo_matrix_t *) | <cairo.h>"
		alias
			"cairo_pattern_get_matrix"
		end

	frozen cairo_pattern_set_filter(a_pattern:POINTER; a_filter:INTEGER)
		external
			"C (cairo_pattern_t *, cairo_filter_t) | <cairo.h>"
		alias
			"cairo_pattern_set_filter"
		end

	frozen cairo_pattern_get_filter(a_pattern:POINTER):INTEGER
		external
			"C (cairo_pattern_t *) : cairo_filter_t | <cairo.h>"
		alias
			"cairo_pattern_get_filter"
		end

	frozen cairo_pattern_get_type(a_pattern:POINTER):INTEGER
		external
			"C (cairo_pattern_t *) : cairo_pattern_type_t | <cairo.h>"
		alias
			"cairo_pattern_get_type"
		end

	frozen cairo_pattern_create_mesh:POINTER
		external
			"C : cairo_pattern_t * | <cairo.h>"
		alias
			"cairo_pattern_create_mesh"
		end

	frozen cairo_mesh_pattern_begin_patch(a_pattern:POINTER)
		external
			"C (cairo_pattern_t *) | <cairo.h>"
		alias
			"cairo_mesh_pattern_begin_patch"
		end

	frozen cairo_mesh_pattern_end_patch(a_pattern:POINTER)
		external
			"C (cairo_pattern_t *) | <cairo.h>"
		alias
			"cairo_mesh_pattern_end_patch"
		end

	frozen cairo_mesh_pattern_move_to(a_pattern:POINTER; a_x, a_y:REAL_64)
		external
			"C (cairo_pattern_t *, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_move_to"
		end

	frozen cairo_mesh_pattern_line_to(a_pattern:POINTER; a_x, a_y:REAL_64)
		external
			"C (cairo_pattern_t *, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_line_to"
		end

	frozen cairo_mesh_pattern_curve_to(a_pattern:POINTER; a_x1, a_y1, a_x2, a_y2, a_x3, a_y3:REAL_64)
		external
			"C (cairo_pattern_t *, double, double, double, double, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_curve_to"
		end

	frozen cairo_mesh_pattern_set_control_point(a_pattern:POINTER; a_point_num:NATURAL; a_x, a_y:REAL_64)
		external
			"C (cairo_pattern_t *, unsigned int, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_set_control_point"
		end

	frozen cairo_mesh_pattern_set_corner_color_rgb(a_pattern:POINTER; a_corner_num:NATURAL; a_red, a_green, a_blue:REAL_64)
		external
			"C (cairo_pattern_t *, unsigned int, double, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_set_corner_color_rgb"
		end

	frozen cairo_mesh_pattern_set_corner_color_rgba(a_pattern:POINTER; a_corner_num:NATURAL; a_red, a_green, a_blue, a_alpha:REAL_64)
		external
			"C (cairo_pattern_t *, unsigned int, double, double, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_set_corner_color_rgba"
		end

	frozen cairo_mesh_pattern_get_patch_count(a_pattern, a_count:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, unsigned int *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_mesh_pattern_get_patch_count"
		end

	frozen cairo_mesh_pattern_get_control_point(a_pattern:POINTER; a_patch_num, a_point_num:NATURAL; a_x, a_y:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, unsigned int, unsigned int, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_mesh_pattern_get_control_point"
		end

	frozen cairo_mesh_pattern_get_corner_color_rgba(a_pattern:POINTER; a_patch_num, a_corner_num:NATURAL; a_red, a_green, a_blue, a_alpha:POINTER):INTEGER
		external
			"C (cairo_pattern_t *, unsigned int, unsigned int, double *, double *, double *, double *) : cairo_status_t | <cairo.h>"
		alias
			"cairo_mesh_pattern_get_corner_color_rgba"
		end

	frozen cairo_mesh_pattern_get_path(a_pattern:POINTER; a_patch_num:NATURAL):POINTER
		external
			"C (cairo_pattern_t *, unsigned int) : cairo_path_t * | <cairo.h>"
		alias
			"cairo_mesh_pattern_get_path"
		end

	frozen cairo_path_destroy(a_path:POINTER)
		external
			"C (cairo_path_t *) | <cairo.h>"
		alias
			"cairo_path_destroy"
		end

feature -- Structures cairo_matrix_t

	frozen c_sizeof_cairo_matrix:INTEGER
			-- Size of an cairo_matrix_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_matrix_t)"
		end

	frozen set_cairo_matrix_struct_xx (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"xx"
		end

	frozen get_cairo_matrix_struct_xx(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"xx"
		end

	frozen set_cairo_matrix_struct_yx (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"yx"
		end

	frozen get_cairo_matrix_struct_yx(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"yx"
		end

	frozen set_cairo_matrix_struct_xy (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"xy"
		end

	frozen get_cairo_matrix_struct_xy(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"xy"
		end

	frozen set_cairo_matrix_struct_yy (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"yy"
		end

	frozen get_cairo_matrix_struct_yy(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"yy"
		end

	frozen set_cairo_matrix_struct_x0 (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"x0"
		end

	frozen get_cairo_matrix_struct_x0(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"x0"
		end

	frozen set_cairo_matrix_struct_y0 (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_matrix_t, double)"
		alias
			"y0"
		end

	frozen get_cairo_matrix_struct_y0(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_matrix_t):double"
		alias
			"y0"
		end

feature -- Structures cairo_path_t

	frozen c_sizeof_cairo_path:INTEGER
			-- Size of an cairo_path_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_path_t)"
		end

	frozen get_cairo_path_struct_status(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_path_t):cairo_status_t"
		alias
			"status"
		end

	frozen get_cairo_path_struct_data(a_struct:POINTER):POINTER
		external
			"C [struct <cairo.h>] (cairo_path_t):cairo_path_data_t *"
		alias
			"data"
		end

	frozen get_cairo_path_struct_num_data(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_path_t):int"
		alias
			"num_data"
		end

feature -- Structures cairo_path_t

	frozen c_sizeof_rectangle_list:INTEGER
			-- Size of an cairo_rectangle_list_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_rectangle_list_t)"
		end

	frozen get_cairo_rectangle_list_status(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_rectangle_list_t):cairo_status_t"
		alias
			"status"
		end

	frozen get_cairo_rectangle_list_num_rectangles(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_rectangle_list_t):int"
		alias
			"num_rectangles"
		end

	frozen get_cairo_rectangle_list_rectangles(a_struct:POINTER):POINTER
		external
			"C [struct <cairo.h>] (cairo_rectangle_list_t):cairo_rectangle_t *"
		alias
			"rectangles"
		end

feature -- Structures cairo_glyph_t

	frozen c_sizeof_glyph:INTEGER
			-- Size of an cairo_glyph_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_glyph_t)"
		end

	frozen get_cairo_glyph_index(a_struct:POINTER):NATURAL_32
		external
			"C [struct <cairo.h>] (cairo_glyph_t):unsigned long"
		alias
			"index"
		end

	frozen set_cairo_glyph_index (a_struct: POINTER; a_value:NATURAL_32)
		external
			"C [struct <cairo.h>] (cairo_glyph_t, unsigned long)"
		alias
			"index"
		end

	frozen get_cairo_glyph_x(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_glyph_t):double"
		alias
			"x"
		end

	frozen set_cairo_glyph_x (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_glyph_t, double)"
		alias
			"x"
		end

	frozen get_cairo_glyph_y(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_glyph_t):double"
		alias
			"y"
		end

	frozen set_cairo_glyph_y (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_glyph_t, double)"
		alias
			"y"
		end

feature -- Structures cairo_font_extents_t

	frozen c_sizeof_font_extents:INTEGER
			-- Size of an cairo_font_extents_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_font_extents_t)"
		end

	frozen get_cairo_font_extents_ascent(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_font_extents_t):double"
		alias
			"ascent"
		end

	frozen set_cairo_font_extents_ascent (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_font_extents_t, double)"
		alias
			"ascent"
		end

	frozen get_cairo_font_extents_descent(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_font_extents_t):double"
		alias
			"descent"
		end

	frozen set_cairo_font_extents_descent (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_font_extents_t, double)"
		alias
			"descent"
		end

	frozen get_cairo_font_extents_height(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_font_extents_t):double"
		alias
			"height"
		end

	frozen set_cairo_font_extents_height (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_font_extents_t, double)"
		alias
			"height"
		end

	frozen get_cairo_font_extents_max_x_advance(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_font_extents_t):double"
		alias
			"max_x_advance"
		end

	frozen set_cairo_font_extents_max_x_advance (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_font_extents_t, double)"
		alias
			"max_x_advance"
		end

	frozen get_cairo_font_extents_max_y_advance(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_font_extents_t):double"
		alias
			"max_y_advance"
		end

	frozen set_cairo_font_extents_max_y_advance (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_font_extents_t, double)"
		alias
			"max_y_advance"
		end

feature -- Structures cairo_text_extents_t

	frozen c_sizeof_text_extents:INTEGER
			-- Size of an cairo_text_extents_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_text_extents_t)"
		end

	frozen get_cairo_text_extents_x_bearing(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"x_bearing"
		end

	frozen set_cairo_text_extents_x_bearing (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"x_bearing"
		end

	frozen get_cairo_text_extents_y_bearing(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"y_bearing"
		end

	frozen set_cairo_text_extents_y_bearing (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"y_bearing"
		end

	frozen get_cairo_text_extents_height(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"height"
		end

	frozen set_cairo_text_extents_height (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"height"
		end

	frozen get_cairo_text_extents_width(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"width"
		end

	frozen set_cairo_text_extents_width (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"width"
		end

	frozen get_cairo_text_extents_x_advance(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"x_advance"
		end

	frozen set_cairo_text_extents_x_advance (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"x_advance"
		end

	frozen get_cairo_text_extents_y_advance(a_struct:POINTER):REAL_64
		external
			"C [struct <cairo.h>] (cairo_text_extents_t):double"
		alias
			"y_advance"
		end

	frozen set_cairo_text_extents_y_advance (a_struct: POINTER; a_value:REAL_64)
		external
			"C [struct <cairo.h>] (cairo_text_extents_t, double)"
		alias
			"y_advance"
		end

feature -- Structures cairo_text_cluster_t

	frozen c_sizeof_text_cluster:INTEGER
			-- Size of an cairo_text_cluster_t C structure.
		external
			"C inline use <cairo.h>"
		alias
			"sizeof(cairo_text_cluster_t)"
		end

	frozen get_cairo_text_cluster_num_bytes(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_text_cluster_t):int"
		alias
			"num_bytes"
		end

	frozen set_cairo_text_cluster_num_bytes (a_struct: POINTER; a_value:INTEGER)
		external
			"C [struct <cairo.h>] (cairo_text_cluster_t, int)"
		alias
			"num_bytes"
		end

	frozen get_cairo_text_cluster_num_glyphs(a_struct:POINTER):INTEGER
		external
			"C [struct <cairo.h>] (cairo_text_cluster_t):int"
		alias
			"num_glyphs"
		end

	frozen set_cairo_text_cluster_num_glyphs (a_struct: POINTER; a_value:INTEGER)
		external
			"C [struct <cairo.h>] (cairo_text_cluster_t, int)"
		alias
			"num_glyphs"
		end

feature -- Constants

	frozen CAIRO_FORMAT_INVALID : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_INVALID"
		end

	frozen CAIRO_FORMAT_ARGB32 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_ARGB32"
		end

	frozen CAIRO_FORMAT_RGB24 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_RGB24"
		end

	frozen CAIRO_FORMAT_A8 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_A8"
		end

	frozen CAIRO_FORMAT_A1 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_A1"
		end

	frozen CAIRO_FORMAT_RGB16_565 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_RGB16_565"
		end

	frozen CAIRO_FORMAT_RGB30 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_format_t"
		alias
			"CAIRO_FORMAT_RGB30"
		end

	frozen CAIRO_STATUS_SUCCESS : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_SUCCESS"
		end

	frozen CAIRO_STATUS_NO_MEMORY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_NO_MEMORY"
		end

	frozen CAIRO_STATUS_INVALID_RESTORE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_RESTORE"
		end

	frozen CAIRO_STATUS_INVALID_POP_GROUP : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_POP_GROUP"
		end

	frozen CAIRO_STATUS_NO_CURRENT_POINT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_NO_CURRENT_POINT"
		end

	frozen CAIRO_STATUS_INVALID_MATRIX : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_MATRIX"
		end

	frozen CAIRO_STATUS_INVALID_STATUS : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_STATUS"
		end

	frozen CAIRO_STATUS_NULL_POINTER : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_NULL_POINTER"
		end

	frozen CAIRO_STATUS_INVALID_STRING : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_STRING"
		end

	frozen CAIRO_STATUS_INVALID_PATH_DATA : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_PATH_DATA"
		end

	frozen CAIRO_STATUS_READ_ERROR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_READ_ERROR"
		end

	frozen CAIRO_STATUS_WRITE_ERROR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_WRITE_ERROR"
		end

	frozen CAIRO_STATUS_SURFACE_FINISHED : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_SURFACE_FINISHED"
		end

	frozen CAIRO_STATUS_SURFACE_TYPE_MISMATCH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_SURFACE_TYPE_MISMATCH"
		end

	frozen CAIRO_STATUS_PATTERN_TYPE_MISMATCH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_PATTERN_TYPE_MISMATCH"
		end

	frozen CAIRO_STATUS_INVALID_CONTENT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_CONTENT"
		end

	frozen CAIRO_STATUS_INVALID_FORMAT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_FORMAT"
		end

	frozen CAIRO_STATUS_INVALID_VISUAL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_VISUAL"
		end

	frozen CAIRO_STATUS_FILE_NOT_FOUND : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_FILE_NOT_FOUND"
		end

	frozen CAIRO_STATUS_INVALID_DASH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_DASH"
		end

	frozen CAIRO_STATUS_INVALID_DSC_COMMENT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_DSC_COMMENT"
		end

	frozen CAIRO_STATUS_INVALID_INDEX : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_INDEX"
		end

	frozen CAIRO_STATUS_CLIP_NOT_REPRESENTABLE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_CLIP_NOT_REPRESENTABLE"
		end

	frozen CAIRO_STATUS_TEMP_FILE_ERROR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_TEMP_FILE_ERROR"
		end

	frozen CAIRO_STATUS_INVALID_STRIDE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_STRIDE"
		end

	frozen CAIRO_STATUS_FONT_TYPE_MISMATCH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_FONT_TYPE_MISMATCH"
		end

	frozen CAIRO_STATUS_USER_FONT_IMMUTABLE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_USER_FONT_IMMUTABLE"
		end

	frozen CAIRO_STATUS_USER_FONT_ERROR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_USER_FONT_ERROR"
		end

	frozen CAIRO_STATUS_NEGATIVE_COUNT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_NEGATIVE_COUNT"
		end

	frozen CAIRO_STATUS_INVALID_CLUSTERS : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_CLUSTERS"
		end

	frozen CAIRO_STATUS_INVALID_SLANT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_SLANT"
		end

	frozen CAIRO_STATUS_INVALID_WEIGHT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_WEIGHT"
		end

	frozen CAIRO_STATUS_INVALID_SIZE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_SIZE"
		end

	frozen CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED"
		end

	frozen CAIRO_STATUS_DEVICE_TYPE_MISMATCH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_DEVICE_TYPE_MISMATCH"
		end

	frozen CAIRO_STATUS_DEVICE_ERROR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_DEVICE_ERROR"
		end

	frozen CAIRO_STATUS_INVALID_MESH_CONSTRUCTION : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_INVALID_MESH_CONSTRUCTION"
		end

	frozen CAIRO_STATUS_DEVICE_FINISHED : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_DEVICE_FINISHED"
		end

	frozen CAIRO_STATUS_JBIG2_GLOBAL_MISSING : INTEGER
		external
			"C [macro <cairo.h>] : cairo_status_t"
		alias
			"CAIRO_STATUS_JBIG2_GLOBAL_MISSING"
		end

	frozen CAIRO_CONTENT_COLOR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_content_t"
		alias
			"CAIRO_CONTENT_COLOR"
		end

	frozen CAIRO_CONTENT_ALPHA : INTEGER
		external
			"C [macro <cairo.h>] : cairo_content_t"
		alias
			"CAIRO_CONTENT_ALPHA"
		end

	frozen CAIRO_CONTENT_COLOR_ALPHA : INTEGER
		external
			"C [macro <cairo.h>] : cairo_content_t"
		alias
			"CAIRO_CONTENT_COLOR_ALPHA"
		end

	frozen CAIRO_FONT_TYPE_TOY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_type_t"
		alias
			"CAIRO_FONT_TYPE_TOY"
		end

	frozen CAIRO_FONT_TYPE_FT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_type_t"
		alias
			"CAIRO_FONT_TYPE_FT"
		end

	frozen CAIRO_FONT_TYPE_WIN32 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_type_t"
		alias
			"CAIRO_FONT_TYPE_WIN32"
		end

	frozen CAIRO_FONT_TYPE_QUARTZ : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_type_t"
		alias
			"CAIRO_FONT_TYPE_QUARTZ"
		end

	frozen CAIRO_FONT_TYPE_USER : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_type_t"
		alias
			"CAIRO_FONT_TYPE_USER"
		end

	frozen CAIRO_ANTIALIAS_DEFAULT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_DEFAULT"
		end

	frozen CAIRO_ANTIALIAS_NONE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_NONE"
		end

	frozen CAIRO_ANTIALIAS_GRAY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_GRAY"
		end

	frozen CAIRO_ANTIALIAS_SUBPIXEL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_SUBPIXEL"
		end

	frozen CAIRO_ANTIALIAS_FAST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_FAST"
		end

	frozen CAIRO_ANTIALIAS_GOOD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_GOOD"
		end

	frozen CAIRO_ANTIALIAS_BEST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_ANTIALIAS_BEST"
		end

	frozen CAIRO_SUBPIXEL_ORDER_DEFAULT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_SUBPIXEL_ORDER_DEFAULT"
		end

	frozen CAIRO_SUBPIXEL_ORDER_RGB : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_SUBPIXEL_ORDER_RGB"
		end

	frozen CAIRO_SUBPIXEL_ORDER_BGR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_SUBPIXEL_ORDER_BGR"
		end

	frozen CAIRO_SUBPIXEL_ORDER_VRGB : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_SUBPIXEL_ORDER_VRGB"
		end

	frozen CAIRO_SUBPIXEL_ORDER_VBGR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_subpixel_order_t"
		alias
			"CAIRO_SUBPIXEL_ORDER_VBGR"
		end

	frozen CAIRO_HINT_STYLE_DEFAULT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_style_t"
		alias
			"CAIRO_HINT_STYLE_DEFAULT"
		end

	frozen CAIRO_HINT_STYLE_NONE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_style_t"
		alias
			"CAIRO_HINT_STYLE_NONE"
		end

	frozen CAIRO_HINT_STYLE_SLIGHT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_style_t"
		alias
			"CAIRO_HINT_STYLE_SLIGHT"
		end

	frozen CAIRO_HINT_STYLE_MEDIUM : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_style_t"
		alias
			"CAIRO_HINT_STYLE_MEDIUM"
		end

	frozen CAIRO_HINT_STYLE_FULL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_style_t"
		alias
			"CAIRO_HINT_STYLE_FULL"
		end

	frozen CAIRO_HINT_METRICS_DEFAULT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_metrics_t"
		alias
			"CAIRO_HINT_METRICS_DEFAULT"
		end

	frozen CAIRO_HINT_METRICS_OFF : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_metrics_t"
		alias
			"CAIRO_HINT_METRICS_OFF"
		end

	frozen CAIRO_HINT_METRICS_ON : INTEGER
		external
			"C [macro <cairo.h>] : cairo_hint_metrics_t"
		alias
			"CAIRO_HINT_METRICS_ON"
		end

	frozen CAIRO_DEVICE_TYPE_DRM : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_DRM"
		end

	frozen CAIRO_DEVICE_TYPE_GL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_GL"
		end

	frozen CAIRO_DEVICE_TYPE_SCRIPT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_SCRIPT"
		end

	frozen CAIRO_DEVICE_TYPE_XCB : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_XCB"
		end

	frozen CAIRO_DEVICE_TYPE_XLIB : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_XLIB"
		end

	frozen CAIRO_DEVICE_TYPE_XML : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_XML"
		end

	frozen CAIRO_DEVICE_TYPE_COGL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_COGL"
		end

	frozen CAIRO_DEVICE_TYPE_WIN32 : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_WIN32"
		end

	frozen CAIRO_DEVICE_TYPE_INVALID : INTEGER
		external
			"C [macro <cairo.h>] : cairo_device_type_t"
		alias
			"CAIRO_DEVICE_TYPE_INVALID"
		end

	frozen CAIRO_PDF_VERSION_1_4 : INTEGER
		external
			"C [macro <cairo-pdf.h>] : cairo_pdf_version_t"
		alias
			"CAIRO_PDF_VERSION_1_4"
		end

	frozen CAIRO_PDF_VERSION_1_5 : INTEGER
		external
			"C [macro <cairo-pdf.h>] : cairo_pdf_version_t"
		alias
			"CAIRO_PDF_VERSION_1_5"
		end

	frozen CAIRO_EXTEND_NONE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_extend_t"
		alias
			"CAIRO_EXTEND_NONE"
		end

	frozen CAIRO_EXTEND_REPEAT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_extend_t"
		alias
			"CAIRO_EXTEND_REPEAT"
		end

	frozen CAIRO_EXTEND_REFLECT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_extend_t"
		alias
			"CAIRO_EXTEND_REFLECT"
		end

	frozen CAIRO_EXTEND_PAD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_extend_t"
		alias
			"CAIRO_EXTEND_PAD"
		end

	frozen CAIRO_FILTER_FAST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_filter_t"
		alias
			"CAIRO_FILTER_FAST"
		end

	frozen CAIRO_FILTER_GOOD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_filter_t"
		alias
			"CAIRO_FILTER_GOOD"
		end

	frozen CAIRO_FILTER_BEST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_filter_t"
		alias
			"CAIRO_FILTER_BEST"
		end

	frozen CAIRO_FILTER_NEAREST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_filter_t"
		alias
			"CAIRO_FILTER_NEAREST"
		end

	frozen CAIRO_FILTER_BILINEAR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_filter_t"
		alias
			"CAIRO_FILTER_BILINEAR"
		end

	frozen CAIRO_PATTERN_TYPE_SOLID : INTEGER
		external
			"C [macro <cairo.h>] : cairo_pattern_type_t"
		alias
			"CAIRO_PATTERN_TYPE_SOLID"
		end

	frozen CAIRO_PATTERN_TYPE_SURFACE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_pattern_type_t"
		alias
			"CAIRO_PATTERN_TYPE_SURFACE"
		end

	frozen CAIRO_PATTERN_TYPE_LINEAR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_pattern_type_t"
		alias
			"CAIRO_PATTERN_TYPE_LINEAR"
		end

	frozen CAIRO_PATTERN_TYPE_RADIAL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_pattern_type_t"
		alias
			"CAIRO_PATTERN_TYPE_RADIAL"
		end

	frozen CAIRO_PATTERN_TYPE_MESH : INTEGER
		external
			"C [macro <cairo.h>] : cairo_pattern_type_t"
		alias
			"CAIRO_PATTERN_TYPE_MESH"
		end

	frozen CAIRO_FILL_RULE_WINDING : INTEGER
		external
			"C [macro <cairo.h>] : cairo_fill_rule_t"
		alias
			"CAIRO_FILL_RULE_WINDING"
		end

	frozen CAIRO_FILL_RULE_EVEN_ODD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_fill_rule_t"
		alias
			"CAIRO_FILL_RULE_EVEN_ODD"
		end

	frozen CAIRO_LINE_CAP_BUTT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_cap_t"
		alias
			"CAIRO_LINE_CAP_BUTT"
		end

	frozen CAIRO_LINE_CAP_ROUND : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_cap_t"
		alias
			"CAIRO_LINE_CAP_ROUND"
		end

	frozen CAIRO_LINE_CAP_SQUARE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_cap_t"
		alias
			"CAIRO_LINE_CAP_SQUARE"
		end

	frozen CAIRO_LINE_JOIN_MITER : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_join_t"
		alias
			"CAIRO_LINE_JOIN_MITER"
		end

	frozen CAIRO_LINE_JOIN_ROUND : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_join_t"
		alias
			"CAIRO_LINE_JOIN_ROUND"
		end

	frozen CAIRO_LINE_JOIN_BEVEL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_line_join_t"
		alias
			"CAIRO_LINE_JOIN_BEVEL"
		end

	frozen CAIRO_OPERATOR_CLEAR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_CLEAR"
		end

	frozen CAIRO_OPERATOR_SOURCE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_SOURCE"
		end

	frozen CAIRO_OPERATOR_OVER : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_OVER"
		end

	frozen CAIRO_OPERATOR_IN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_IN"
		end

	frozen CAIRO_OPERATOR_OUT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_OUT"
		end

	frozen CAIRO_OPERATOR_ATOP : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_ATOP"
		end

	frozen CAIRO_OPERATOR_DEST : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DEST"
		end

	frozen CAIRO_OPERATOR_DEST_OVER : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DEST_OVER"
		end

	frozen CAIRO_OPERATOR_DEST_IN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DEST_IN"
		end

	frozen CAIRO_OPERATOR_DEST_OUT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DEST_OUT"
		end

	frozen CAIRO_OPERATOR_DEST_ATOP : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DEST_ATOP"
		end

	frozen CAIRO_OPERATOR_XOR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_XOR"
		end

	frozen CAIRO_OPERATOR_ADD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_ADD"
		end

	frozen CAIRO_OPERATOR_SATURATE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_SATURATE"
		end

	frozen CAIRO_OPERATOR_MULTIPLY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_MULTIPLY"
		end

	frozen CAIRO_OPERATOR_SCREEN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_SCREEN"
		end

	frozen CAIRO_OPERATOR_OVERLAY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_OVERLAY"
		end

	frozen CAIRO_OPERATOR_DARKEN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DARKEN"
		end

	frozen CAIRO_OPERATOR_LIGHTEN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_LIGHTEN"
		end

	frozen CAIRO_OPERATOR_COLOR_DODGE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_COLOR_DODGE"
		end

	frozen CAIRO_OPERATOR_COLOR_BURN : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_COLOR_BURN"
		end

	frozen CAIRO_OPERATOR_HARD_LIGHT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_HARD_LIGHT"
		end

	frozen CAIRO_OPERATOR_SOFT_LIGHT : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_SOFT_LIGHT"
		end

	frozen CAIRO_OPERATOR_DIFFERENCE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_DIFFERENCE"
		end

	frozen CAIRO_OPERATOR_EXCLUSION : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_EXCLUSION"
		end

	frozen CAIRO_OPERATOR_HSL_HUE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_HSL_HUE"
		end

	frozen CAIRO_OPERATOR_HSL_SATURATION : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_HSL_SATURATION"
		end

	frozen CAIRO_OPERATOR_HSL_COLOR : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_HSL_COLOR"
		end

	frozen CAIRO_OPERATOR_HSL_LUMINOSITY : INTEGER
		external
			"C [macro <cairo.h>] : cairo_operator_t"
		alias
			"CAIRO_OPERATOR_HSL_LUMINOSITY"
		end

	frozen CAIRO_TEXT_CLUSTER_FLAG_BACKWARD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_text_cluster_flags_t"
		alias
			"CAIRO_TEXT_CLUSTER_FLAG_BACKWARD"
		end

	frozen CAIRO_FONT_SLANT_NORMAL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_slant_t"
		alias
			"CAIRO_FONT_SLANT_NORMAL"
		end

	frozen CAIRO_FONT_SLANT_ITALIC : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_slant_t"
		alias
			"CAIRO_FONT_SLANT_ITALIC"
		end

	frozen CAIRO_FONT_SLANT_OBLIQUE : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_slant_t"
		alias
			"CAIRO_FONT_SLANT_OBLIQUE"
		end

	frozen CAIRO_FONT_WEIGHT_NORMAL : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_weight_t"
		alias
			"CAIRO_FONT_WEIGHT_NORMAL"
		end

	frozen CAIRO_FONT_WEIGHT_BOLD : INTEGER
		external
			"C [macro <cairo.h>] : cairo_font_weight_t"
		alias
			"CAIRO_FONT_WEIGHT_BOLD"
		end

	frozen CAIRO_SVG_VERSION_1_1 : INTEGER
		external
			"C [macro <cairo-svg.h>] : cairo_svg_version_t"
		alias
			"CAIRO_SVG_VERSION_1_1"
		end

	frozen CAIRO_SVG_VERSION_1_2 : INTEGER
		external
			"C [macro <cairo-svg.h>] : cairo_svg_version_t"
		alias
			"CAIRO_SVG_VERSION_1_2"
		end

end
