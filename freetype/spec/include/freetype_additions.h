#ifndef FREETYPE_ADDITIONS
#define FREETYPE_ADDITIONS
#include <ft2build.h>
#include FT_FREETYPE_H
#include <cairo-ft.h>
#include <stdbool.h>

struct library_disposer_struct;

typedef struct font_face_disposer_struct{
	FT_Face face;
	cairo_font_face_t * cairo_face;
	FT_Error error_code;
	cairo_user_data_key_t *key;
	struct library_disposer_struct * library;
}font_face_disposer; 

typedef struct font_face_list_struct{
	font_face_disposer * font_face;
	struct font_face_list_struct * next;
}font_face_list;


typedef struct library_disposer_struct{
	bool must_be_freed;
	font_face_list * font_faces;
	FT_Library library;
	FT_Error error_code;
}library_disposer;

library_disposer * create_library(void);

void free_library(library_disposer * a_library);

font_face_disposer * create_font_face(
						library_disposer * a_library,
						const char *a_file_name,
						int a_face_index, bool a_vertical
					);
#endif
