note
	description: "Error manager for {CAIRO_PATTERN_MESH}"
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_PATTERN_MESH_ERROR

inherit
	CAIRO_PATTERN_ERROR


feature -- Status report

	is_mesh_construction_error:BOOLEAN
			-- A mesh pattern construction operation was used outside of a
			-- begin/end pair
		do
			Result := error_code = {CAIRO_EXTERNALS}.CAIRO_STATUS_INVALID_MESH_CONSTRUCTION
		end

end
