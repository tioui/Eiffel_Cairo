note
	description: "External (C language) feature of the freetype library"
	author: "Louis Marchand"
	date: "Thu, 13 Apr 2017 01:36:11 +0000"
	revision: "0.1"

class
	FT_EXTERNALS

feature -- Functions

	frozen FT_Init_FreeType(a_library:POINTER)
		external
			"C (FT_Library  *) | <freetype_additions.h>"
		alias
			"FT_Init_FreeType"
		end

	frozen FT_New_Face(a_library, a_filepathname:POINTER; a_face_index:INTEGER_32; a_face:POINTER)
		external
			"C (FT_Library, const char*, FT_Long, FT_Face *) | <freetype_additions.h>"
		alias
			"FT_New_Face"
		end

	frozen FT_Done_Face(a_face:POINTER)
		external
			"C (FT_Face) | <freetype_additions.h>"
		alias
			"FT_Done_Face"
		end

	frozen create_freetype_library:POINTER
		external
			"C : library_disposer * | <freetype_additions.h>"
		alias
			"create_library"
		end

	frozen free_freetype_library(a_library:POINTER)
		external
			"C (library_disposer *) | <freetype_additions.h>"
		alias
			"free_library"
		end

	frozen create_freetype_font_face(a_library, a_file_name:POINTER; a_face_index:INTEGER; a_vertical:BOOLEAN):POINTER
		external
			"C (library_disposer *, const char *, int, bool) : font_face_disposer * | <freetype_additions.h>"
		alias
			"create_font_face"
		end

feature -- Structures

	frozen get_library_disposer_library(a_struct:POINTER):POINTER
		external
			"C [struct <freetype_additions.h>] (library_disposer):FT_Library"
		alias
			"library"
		end

	frozen get_library_disposer_error_code(a_struct:POINTER):INTEGER
		external
			"C [struct <freetype_additions.h>] (library_disposer):FT_Error"
		alias
			"error_code"
		end

	frozen get_font_face_disposer_face(a_struct:POINTER):POINTER
		external
			"C [struct <freetype_additions.h>] (font_face_disposer):FT_Face"
		alias
			"face"
		end

	frozen get_font_face_disposer_cairo_face(a_struct:POINTER):POINTER
		external
			"C [struct <freetype_additions.h>] (font_face_disposer):cairo_font_face_t *"
		alias
			"cairo_face"
		end

	frozen get_font_face_disposer_error_code(a_struct:POINTER):INTEGER
		external
			"C [struct <freetype_additions.h>] (font_face_disposer):FT_Error"
		alias
			"error_code"
		end

feature -- Macros


	frozen FT_HAS_VERTICAL(a_face:POINTER) : INTEGER
		external
			"C inline use <freetype_additions.h>"
		alias
			"FT_HAS_VERTICAL( ((FT_Face)$a_face) )"
		end

	frozen FT_LOAD_VERTICAL_LAYOUT : INTEGER
		external
			"C [macro <freetype_additions.h>] : int"
		alias
			"FT_LOAD_VERTICAL_LAYOUT"
		end



end
