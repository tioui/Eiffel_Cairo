note
	description: "A {CAIRO_FONT_FACE} loaded with the Freetype library."
	author: "Louis Marchand"
	date: "Thu, 13 Apr 2017 01:36:11 +0000"
	revision: "0.1"

class
	CAIRO_FT_FONT_FACE

inherit
	CAIRO_FONT_FACE
		rename
			make as make_font_face
		undefine
			error_string
		end
	CAIRO_FT_ERROR
		undefine
			is_equal
		end

create {FT_FACTORY}
	make

feature {NONE} -- Initialization

	make(
			a_library_disposable_item:POINTER; a_file_name:READABLE_STRING_GENERAL;
			a_index:INTEGER; a_vertical:BOOLEAN
		)
			-- Initialization of `Current' from the file `a_file_name' using the
			-- font index `a_index' and using the freeType library pointer
			-- `a_library_item'. If `a_vertical', `Current' will be
			-- verticalize.
		require
			File_Name_Not_Empty: not a_file_name.is_empty
			Index_Positive: a_index > 0
		local
			l_item:POINTER
			l_utf_converter:UTF_CONVERTER
			l_c_string:C_STRING
		do
			create l_utf_converter
			create l_c_string.make (l_utf_converter.string_32_to_utf_8_string_8 (a_file_name.to_string_32))
			disposable_item := {FT_EXTERNALS}.create_freetype_font_face(
											a_library_disposable_item, l_c_string.item,
											a_index - 1, a_vertical
										)
			if {FT_EXTERNALS}.get_font_face_disposer_error_code(disposable_item) = 0 then
				l_item := {FT_EXTERNALS}.get_font_face_disposer_face(disposable_item)
				item := {FT_EXTERNALS}.get_font_face_disposer_cairo_face(disposable_item)
				error_code := {CAIRO_EXTERNALS}.cairo_font_face_status(item)
				if a_vertical then
					if {FT_EXTERNALS}.FT_HAS_VERTICAL(l_item) /= 0 then
						error_code := {CAIRO_EXTERNALS}.cairo_font_face_status(item)
					else
						error_code := Vertical_not_valid_code
					end
				end
			else
				error_code := Cannot_create_font_face_code
			end
			is_valid := is_success
			if is_success then
				type_index := {CAIRO_EXTERNALS}.cairo_font_face_get_type(item)
			end
		end

feature {NONE} -- Implementation

	disposable_item:POINTER
			-- The internal value of the disposable structure
end
