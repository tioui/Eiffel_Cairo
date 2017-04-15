#include "../spec/include/freetype_additions.h"

library_disposer * create_library(void)
{
//	printf("Create library disposer\n");
	library_disposer * l_library = malloc(sizeof(library_disposer));
//	printf("Create library\n");
	l_library->error_code = FT_Init_FreeType( &(l_library->library) );
	l_library->must_be_freed = false;
	if (l_library->error_code)
	{
//		printf("Free library\n");
		FT_Done_FreeType(l_library->library);
		l_library->library = NULL;
	}
	else
	{
		l_library->font_faces = NULL;
	}
	return l_library;
}

void free_library(library_disposer * a_library)
{
//	printf("Test1\n");
	if (a_library->font_faces == NULL)
	{
		if (a_library->library != NULL)
		{
//			printf("Free library\n");
			FT_Done_FreeType(a_library->library);
		}
//		printf("Free library disposer\n");
		free(a_library);
	}
	else
	{
		a_library->must_be_freed = true;
	}
}

void free_font_face(font_face_disposer * a_face_disposer)
{
//	printf("Test2\n");
	library_disposer * l_library;
	font_face_list * l_font_faces;
	font_face_list * l_font_faces_previous;
	if (a_face_disposer->face != NULL)
	{

		l_library = a_face_disposer->library;
//		printf("Free font face\n");
		FT_Done_Face(a_face_disposer->face);
//		printf("Free key\n");
		free(a_face_disposer->key);
		l_font_faces = l_library->font_faces;
		if (l_font_faces->font_face == a_face_disposer)
		{
			l_library->font_faces = l_font_faces->next;
//			printf("Free font face list\n");
			free(l_font_faces);
		}
		else
		{
			while(!(
						l_font_faces == NULL ||
						l_font_faces->font_face == a_face_disposer
					))
			{
				l_font_faces_previous = l_font_faces;
				l_font_faces = l_font_faces->next;
			}
			if (l_font_faces->font_face == a_face_disposer)
			{
				l_font_faces_previous->next = l_font_faces->next;
//				printf("Free font face list\n");
				free(l_font_faces);
			}
		}
//		printf("Free font face disposer\n");
		free(a_face_disposer);
		if (l_library->must_be_freed && l_library->font_faces == NULL)
		{
			free_library(l_library);
		}
	}
}

font_face_disposer * create_font_face(
				library_disposer * a_library, const char * a_path_name,
				int a_face_index, bool a_vertical
			)
{
	font_face_list * l_font_faces;
//	printf("Create font face disposer\n");
	font_face_disposer * l_face_disposer = malloc(sizeof(font_face_disposer));
//	printf("create font face\n");
	l_face_disposer->error_code = FT_New_Face(
									a_library->library,
									a_path_name, a_face_index,
									&(l_face_disposer->face)
								);
	if (l_face_disposer->error_code)
	{
		l_face_disposer->library = NULL;
		l_face_disposer->cairo_face = NULL;
//		printf("Free font face\n");
		FT_Done_Face(l_face_disposer->face);
		l_face_disposer->face = NULL;
	}
	else 
	{
		l_face_disposer->library = a_library;
		if (a_vertical && FT_HAS_VERTICAL(l_face_disposer->face))
		{
			l_face_disposer->cairo_face = cairo_ft_font_face_create_for_ft_face(
												l_face_disposer->face,
												FT_LOAD_VERTICAL_LAYOUT
											);
		}
		else
		{
			l_face_disposer->cairo_face = cairo_ft_font_face_create_for_ft_face(
												l_face_disposer->face, 0
											);

		}
//		printf("Create key\n");
		l_face_disposer->key = malloc(sizeof(cairo_user_data_key_t));
		cairo_font_face_set_user_data(
								l_face_disposer->cairo_face,
								l_face_disposer->key, l_face_disposer,
								(cairo_destroy_func_t) free_font_face
							);
//		printf("Create font face list\n");
		l_font_faces = malloc(sizeof(font_face_list));
		l_font_faces->font_face = l_face_disposer;
		l_font_faces->next = a_library->font_faces;
		a_library->font_faces = l_font_faces;
	}
	return l_face_disposer;
}

