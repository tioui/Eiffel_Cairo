note
	description: "Error manager for {CAIRY_SURFACE} class."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_DEVICE_ERROR

inherit
	CAIRO_SURFACE_ERROR
	CAIRO_MATRIX_ERROR
	CAIRO_PATTERN_ERROR


feature -- Status report

	is_invalid_restore_error:BOOLEAN
			-- Restore called without matching Save
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_RESTORE
		end

	is_invalid_pop_group_error:BOOLEAN
			-- No saved group to pop
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_POP_GROUP
		end

	is_invalid_error_type_error:BOOLEAN
			-- Invalid value for an input error status
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_STATUS
		end

	is_invalid_string_error:BOOLEAN
			-- The String was not valid
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_STRING
		end

	is_invalid_path_error:BOOLEAN
			-- The supplied path string is not valid
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_PATH_DATA
		end

	is_write_error:BOOLEAN
			-- Error while writing from input stream
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_WRITE_ERROR
		end

	is_surface_closed_error:BOOLEAN
			-- The surface has been closed
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_SURFACE_FINISHED
		end

	is_surface_type_error:BOOLEAN
			-- The surface type is not appropriate for the operation
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_SURFACE_TYPE_MISMATCH
		end

	is_file_not_found_error:BOOLEAN
			-- The file cannot be found
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_FILE_NOT_FOUND
		end

	is_invalid_dash_error:BOOLEAN
			-- Invalid value for a dash setting
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_DASH
		end

	is_dsc_comment_error:BOOLEAN
			-- Invalid value for a DSC comment
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_DSC_COMMENT
		end

	is_clip_not_representable_error:BOOLEAN
			-- Clip region not representable in desired format
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_CLIP_NOT_REPRESENTABLE
		end

	is_temporary_file_error:BOOLEAN
			-- Error creating or writing to a temporary file
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_TEMP_FILE_ERROR
		end

	is_invalid_stride_error:BOOLEAN
			-- Invalid value for stride
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_STRIDE
		end

	is_font_type_error:BOOLEAN
			-- The font type is not appropriate for the operation
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_FONT_TYPE_MISMATCH
		end

	is_user_font_immutable_error:BOOLEAN
			-- The user-font is immutable
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_USER_FONT_IMMUTABLE
		end

	is_user_font_error:BOOLEAN
			-- Error occurred in a user-font callback function
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_USER_FONT_ERROR
		end

	is_negative_count_error:BOOLEAN
			-- Negative number used where it is not allowed
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_NEGATIVE_COUNT
		end

	is_invalid_clusters_error:BOOLEAN
			-- Input clusters do not represent the accompanying text and glyph array
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_CLUSTERS
		end

	is_invalid_slant_error:BOOLEAN
			-- Invalid value for an input font slant
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_SLANT
		end

	is_invalid_weight_error:BOOLEAN
			-- Invalid value for an input font weight
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_WEIGHT
		end

	is_invalid_size_error:BOOLEAN
			-- Invalid value (typically too big) for the size
			-- of the input (surface, pattern, etc.)
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_SIZE
		end

	is_user_font_not_implemented_error:BOOLEAN
			-- User-font method not implemented
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED
		end

	is_device_type_error:BOOLEAN
			-- The device type is not appropriate for the operation
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_DEVICE_TYPE_MISMATCH
		end

	is_device_error:BOOLEAN
			-- An operation to the device caused an unspecified error
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_DEVICE_ERROR
		end

	is_device_closed_error:BOOLEAN
			-- The device has been closed
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_DEVICE_FINISHED
		end

	is_jbig2_global_missing_error:BOOLEAN
			-- A JBIG2 global MIME type used on an image but no image support
			-- a JBIG2 global MIME
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_DEVICE_FINISHED
		end

end
