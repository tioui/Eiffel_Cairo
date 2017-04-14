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

	frozen FT_Done_FreeType(a_library:POINTER)
		external
			"C (FT_Library) | <freetype_additions.h>"
		alias
			"FT_Done_FreeType"
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


--	ft_additions_init_library:POINTER
--			-- Create a FT_Library and a FT_Library disposer
--		external
--			"C inline use <freetype_additions.h>"
--		alias
--			"[
--				FT_Error l_error;
--				printf("Creating Library disposer 1\n");
--				library_disposer * l_library = malloc(sizeof(library_disposer));
--				printf("Creating Library 2\n");
--				l_error = FT_Init_FreeType( &(l_library->library) );
--				if (l_error){
--					printf("Freeing Library 3\n");
--					FT_Done_FreeType(l_library->library);
--					printf("Freeing Library disposer 4\n");
--					free(l_library);
--					l_library = NULL;
--				} else {
--					l_library->font_faces = NULL;
--				}
--				return l_library;
--			]"
--		end

--	ft_additions_free_library(a_library:POINTER)
--			-- Free the FT_Library `a_library',
--			-- the FT_Library disposer and every
--			-- font face created with it.
--		external
--			"C inline use <freetype_additions.h>"
--		alias
--			"[
--				library_disposer * l_library = (library_disposer *)$a_library;
--				font_face_list * l_font_faces_next;
--				font_face_list * l_font_faces = l_library->font_faces;
--				font_face_disposer * l_font_face;
--				while(l_font_faces != NULL){
--					l_font_face = l_font_faces->font_face;
--					if (!(l_font_face->is_freed)){
--						printf("Freeing Font face 5\n");
--						if (l_font_face->cairo_face != NULL){
--							printf("Destroying cairo face\n");
--							cairo_font_face_destroy(l_font_face->cairo_face);
--							printf("Cairo reference Count: %d\n", cairo_font_face_get_reference_count (l_font_face->cairo_face));
--						}
--						FT_Done_Face(l_font_face->face);
--						l_font_face->is_freed = true;
--					}
--					l_font_faces_next = l_font_faces->next;
--					printf("Freeing Font face list 6\n");
--//					free(l_font_faces);
--					l_font_faces = l_font_faces_next;
--				}
--				printf("Freeing Library 7\n");
--//				FT_Done_FreeType(l_library->library);
--				printf("Freeing Library disposer 8\n");
--//				free(l_library);
--			]"
--		end

--	ft_additions_init_font_face(a_library, a_path_name:POINTER; a_face_index:INTEGER; a_vertical:BOOLEAN):POINTER
--			-- Create a new FT_Face using `a_file_name' and
--			-- `a_face_index'. Also create a FT_Face disposer.
--			-- add it in the list of font face
--			-- of the FT_Library disposer `a_library'
--		external
--			"C inline use <freetype_additions.h>"
--		alias
--			"[
--				font_face_list * l_font_faces;
--				library_disposer * l_library = (library_disposer *)$a_library;
--				printf("Creating Font face disposer 9\n");
--				font_face_disposer * l_face_disposer = malloc(sizeof(font_face_disposer));
--				l_face_disposer->is_freed = false;
--				printf("Creating Font face 10\n");
--				l_face_disposer->error_code = FT_New_Face(l_library->library, (const char*)$a_path_name, $a_face_index, &(l_face_disposer->face));
--				if (l_face_disposer->error_code){
--					l_face_disposer->cairo_face = NULL;
--					FT_Done_Face(l_face_disposer->face);
--					l_face_disposer->face = NULL;
--					l_face_disposer->is_freed = true;
--				} else {
--					if ($a_vertical && FT_HAS_VERTICAL(l_face_disposer->face)) {
--						l_face_disposer->cairo_face = cairo_ft_font_face_create_for_ft_face(l_face_disposer->face, FT_LOAD_VERTICAL_LAYOUT);
--					} else {
--						l_face_disposer->cairo_face = cairo_ft_font_face_create_for_ft_face(l_face_disposer->face, 0);
--					}
--					printf("Creating Font face list 13\n");
--					l_font_faces = malloc(sizeof(font_face_list));
--					l_font_faces->font_face = l_face_disposer;
--					l_font_faces->next = l_library->font_faces;
--					l_library->font_faces = l_font_faces;
--				}
--				return l_face_disposer;
--			]"
--		end

--	ft_additions_free_font_face(a_library, a_font_face:POINTER)
--			-- Free the FT_Face disposer `a_font_face'
--			-- and the encapsulated FT_Face. Also remove
--			-- `a_font_face' from the font face list
--			-- in `a_library'
--		external
--			"C inline use <freetype_additions.h>"
--		alias
--			"[
--				font_face_list * l_font_faces;
--				font_face_list * l_font_faces_previous;
--				FT_Error l_error;
--				library_disposer * l_library;
--				font_face_disposer * l_face_disposer = (font_face_disposer *)$a_font_face;
--				if (!(l_face_disposer->is_freed)) {
--					l_library = (library_disposer *)$a_library;
--					printf("Freeing Font face 14\n");
--					if (l_face_disposer->cairo_face != NULL) {
--						cairo_font_face_destroy(l_face_disposer->cairo_face);
--					}
--					FT_Done_Face(l_face_disposer->face);
--					l_face_disposer->is_freed = true;
--					l_font_faces = l_library->font_faces;
--					if (l_font_faces->font_face == l_face_disposer) {
--						l_library->font_faces = l_font_faces->next;
--						printf("Freeing Font face list 15\n");
--						free(l_font_faces);
--					} else {
--						while(!(l_font_faces == NULL || l_font_faces->font_face == l_face_disposer)){
--							l_font_faces_previous = l_font_faces;
--							l_font_faces = l_font_faces->next;
--						}
--						if (l_font_faces->font_face == l_face_disposer) {
--							l_font_faces_previous->next = l_font_faces->next;
--							printf("Freeing Font face list 16\n");
--							free(l_font_faces);
--						}
--					}
--				}
--				printf("Freeing Font face disposer 17\n");
--				free(l_face_disposer);
--			]"
--		end

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
