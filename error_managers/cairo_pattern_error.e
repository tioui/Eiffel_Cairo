note
	description: "Error manager for {CAIRO_PATTERN}"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_ERROR

inherit
	CAIRO_NO_MEMORY_ERROR
	CAIRO_MATRIX_ERROR


feature -- Status report

	is_pattern_type_error:BOOLEAN
			-- The pattern type is not appropriate for the operation
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_PATTERN_TYPE_MISMATCH
		end

	is_invalid_index_error:BOOLEAN
			-- Invalid index passed to a getter
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_INDEX
		end
end
