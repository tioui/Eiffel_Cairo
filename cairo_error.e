note
	description: "Error manager for every {CAIRY_*} classes."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

deferred class
	CAIRO_ERROR

inherit
	CAIRO_ANY

feature -- Access

	error_string:READABLE_STRING_GENERAL
			-- A text representation of the last error status
		local
			l_c_string:C_STRING
		do
			create l_c_string.make_shared_from_pointer ({CAIRO_EXTERNALS}.cairo_status_to_string(error_code))
			Result := l_c_string.string
		end
		
feature -- Status report

	error_code:INTEGER
			-- The internal error code of `Current'

	is_success:BOOLEAN
			-- No error has occurred
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_SUCCESS
		end

end
