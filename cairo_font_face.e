note
	description: "Class representing a font face"
	author: "Louis Marchand"
	date: "Wed, 29 Mar 2017 02:01:53 +0000"
	revision: "0.1"

class
	CAIRO_FONT_FACE

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		redefine
			make
		end
	CAIRO_NO_MEMORY_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make

feature {NONE} -- Initialization

	make(a_item:POINTER)
			-- <Precursor>
		do
			item := {CAIRO_EXTERNALS}.cairo_font_face_reference(a_item)
			error_code := {CAIRO_EXTERNALS}.cairo_font_face_status(a_item)
			is_valid := is_success
			if is_success then
				type_index := {CAIRO_EXTERNALS}.cairo_font_face_get_type(a_item)
			end

		end

feature -- Status report

	is_toy_font:BOOLEAN
			-- The type of `Current' is Cairo's toy font
		require
			Is_Valid: is_valid
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_FONT_TYPE_TOY
		end

	is_free_type_font:BOOLEAN
			-- The type of `Current' is Free Type
		require
			Is_Valid: is_valid
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_FONT_TYPE_FT
		end

	is_win32_font:BOOLEAN
			-- The type of `Current' is Win32
		require
			Is_Valid: is_valid
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_FONT_TYPE_WIN32
		end

	is_quartz_font:BOOLEAN
			-- The type of `Current' is Quartz
		require
			Is_Valid: is_valid
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_FONT_TYPE_QUARTZ
		end

	is_user_font:BOOLEAN
			-- The type of `Current' is Cairo's User font
		require
			Is_Valid: is_valid
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_FONT_TYPE_USER
		end

feature {NONE} -- Implementation

	type_index:INTEGER
			-- The internal representation of the type of `Current'

feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_face_destroy(item)
		end

end
