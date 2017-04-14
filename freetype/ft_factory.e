note
	description: "Used to generate {CAIRO_FT_FONT_FACE}"
	author: "Louis Marchand"
	date: "Thu, 13 Apr 2017 01:36:11 +0000"
	revision: "0.1"

class
	FT_FACTORY

inherit
	DISPOSABLE
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
			-- Initialization of `Current'
		do
			disposable_item := {FT_EXTERNALS}.create_freetype_library
			if {FT_EXTERNALS}.get_library_disposer_error_code(disposable_item) = 0 then
				is_valid := True
				item := {FT_EXTERNALS}.get_library_disposer_library(disposable_item)
			end
		end

feature -- Access

	is_valid:BOOLEAN
			-- `Current' can be used properly

	new_face(a_file_name:READABLE_STRING_GENERAL;a_index:INTEGER; a_vertical:BOOLEAN):CAIRO_FT_FONT_FACE
			-- Initialization of a new {CAIRO_FT_FONT_FACE} from the file
			-- `a_file_name' using the font index `a_index'. If `a_vertical',
			-- `Current' will be verticalize.
		require
			Is_Valid:is_valid
			File_Name_Not_Empty: not a_file_name.is_empty
			Index_Positive: a_index > 0
		do
			create Result.make (disposable_item, a_file_name, a_index, a_vertical)
		end

feature {CAIRO_FT_FONT_FACE} -- Implementation

	disposable_item:POINTER
			-- The internal value of the disposable structure

	item:POINTER
			-- Internal representation of `Current'

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{FT_EXTERNALS}.free_freetype_library(disposable_item)
		end
end
