note
	description: "Error manager for {CAIRY_TRANSFORMATION_MATRIX} class."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

deferred class
	CAIRO_MATRIX_ERROR

inherit
	CAIRO_ERROR

feature -- Status report

	is_invalid_matrix_error:BOOLEAN
			-- The matrix is not valid
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_MATRIX
		end

end
