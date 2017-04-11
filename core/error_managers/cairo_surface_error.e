note
	description: "Error manager for {CAIRY_SURFACE} class."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

deferred class
	CAIRO_SURFACE_ERROR

inherit
	CAIRO_NO_MEMORY_ERROR

feature -- Status report

	is_null_pointer_error:BOOLEAN
			-- A NULL pointer has been used incorrectly
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_NULL_POINTER
		end

	is_read_error:BOOLEAN
			-- Error while reading from input stream
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_READ_ERROR
		end

	is_invalid_content_error:BOOLEAN
			-- Invalid value for an input {CAIRO_CONTENT}
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_CONTENT
		end

	is_invalid_format_error:BOOLEAN
			-- Invalid value for an input {CAIRO_PIXEL_FORMAT}
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_FORMAT
		end

	is_invalid_visual_error:BOOLEAN
			-- Invalid value for an input Visual*
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_VISUAL
		end
end
