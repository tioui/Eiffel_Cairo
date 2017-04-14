note
	description: "Manage the error of an {CAIRO_FT_FONT_FACE}"
	author: "Louis Marchand"
	date: "Thu, 13 Apr 2017 01:36:11 +0000"
	revision: "0.1"

class
	CAIRO_FT_ERROR

inherit
	CAIRO_NO_MEMORY_ERROR
		redefine
			error_string
		end


feature -- Access

	error_string:READABLE_STRING_GENERAL
			-- <Precursor>
		do
			if is_vertical_not_valid then
				Result := "Font face cannot be used vertically."
			elseif is_cannot_create_font_face_error then
				Result := "Error while creating the font face."
			else
				Result := Precursor {CAIRO_NO_MEMORY_ERROR}
			end
		end

feature -- Status report

	is_vertical_not_valid:BOOLEAN
			-- A vertical font face requested but impossible
		do
			Result := error_code = Vertical_not_valid_code
		end

	is_cannot_create_font_face_error:BOOLEAN
			-- No error has occurred
		do
			Result := error_code = Cannot_create_font_face_code
		end



feature {NONE} -- Implementation

	Vertical_not_valid_code:INTEGER = 2147483646
			-- Error code for `is_vertical_not_valid'

	Cannot_create_font_face_code:INTEGER = 2147483645
			-- Error code for `is_cannot_create_font_face_error'
end
