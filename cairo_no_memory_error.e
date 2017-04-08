note
	description: "Error manager for classes that allocate memory."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CAIRO_NO_MEMORY_ERROR

inherit
	CAIRO_ERROR

feature -- Status report

	is_no_memory_error:BOOLEAN
			-- No memory left to perform the operation
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_NO_MEMORY
		end
end
