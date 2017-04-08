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

	frozen cairo_mesh_pattern_set_control_point(a_pattern:POINTER; point_num:NATURAL; a_x, a_y:REAL_64)
		external
			"C (cairo_pattern_t *, unsigned int, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_set_control_point"
		end

	frozen cairo_mesh_pattern_set_corner_color_rgb(a_pattern:POINTER; corner_num:NATURAL; a_red, a_green, a_blue:REAL_64)
		external
			"C (cairo_pattern_t *, unsigned int, double, double, double) | <cairo.h>"
		alias
			"cairo_mesh_pattern_set_corner_color_rgb"
		end

	frozen cairo_mesh_pattern_set_corner_color_rgba(a_pattern:POINTER; corner_num:NATURAL; a_red, a_green, a_blue, a_alpha:REAL_64)
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

feature -- Structures

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

end
