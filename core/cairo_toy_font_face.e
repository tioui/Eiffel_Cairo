note
	description: "[
					The {CAIRO_FONT_FACE} by default in the library.
					This class is part of the "toy" text API.
					For a real font management, used a different backend.
				
				]"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

class
	CAIRO_TOY_FONT_FACE

inherit
	CAIRO_FONT_FACE
		rename
			make as make_font_face
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	make(a_family:READABLE_STRING_GENERAL; a_bold:BOOLEAN)
			-- Initialization of `Current' using `a_family as `family'
			-- and `a_bold' as `is_bold'.
			-- The name of `a_family' should be any standard CSS2 family font name
			-- ("serif", "sans-serif", "cursive", "fantasy", "monospace").
			-- If `a_family start with "cairo :", the font used will be the internal
			-- cairo font (and not the system font even they are available).
			-- If `a_family'.`is_empty', `Current' will use the defaut font.
		do
			initialize(a_family, a_bold, {CAIRO_EXTERNALS}.CAIRO_FONT_SLANT_NORMAL)
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_italic(a_family:READABLE_STRING_GENERAL; a_bold:BOOLEAN)
			-- Initialization of an italic `Current' using `a_family as `family'
			-- and `a_bold' as `is_bold'
			-- The name of `a_family' should be any standard CSS2 family font name
			-- ("serif", "sans-serif", "cursive", "fantasy", "monospace").
			-- If `a_family start with "cairo :", the font used will be the internal
			-- cairo font (and not the system font even they are available).
			-- If `a_family'.`is_empty', `Current' will use the defaut font.
		do
			initialize(a_family, a_bold, {CAIRO_EXTERNALS}.CAIRO_FONT_SLANT_ITALIC)
		ensure
			Is_Created: not item.is_default_pointer
		end

	make_oblique(a_family:READABLE_STRING_GENERAL; a_bold:BOOLEAN)
			-- Initialization of an oblique `Current' using `a_family as `family'
			-- and `a_bold' as `is_bold'
			-- The name of `a_family' should be any standard CSS2 family font name
			-- ("serif", "sans-serif", "cursive", "fantasy", "monospace").
			-- If `a_family start with "cairo :", the font used will be the internal
			-- cairo font (and not the system font even they are available).
			-- If `a_family'.`is_empty', `Current' will use the defaut font.
		do
			initialize(a_family, a_bold, {CAIRO_EXTERNALS}.CAIRO_FONT_SLANT_OBLIQUE)
		ensure
			Is_Created: not item.is_default_pointer
		end

	default_create
			-- <Precursor>
		do
			make("", False)
		ensure then
			Is_Created: not item.is_default_pointer
		end

	initialize(a_family:READABLE_STRING_GENERAL; a_bold:BOOLEAN; a_slant_flags:INTEGER)
			-- Initialization of `Current' using `a_family' as `family', using
			-- `a_bold' as `is_bold' and finding the stant (`is_italic', `is_oblique')
			-- with `a_slant_flags'.
			-- The name of `a_family' should be any standard CSS2 family font name
			-- ("serif", "sans-serif", "cursive", "fantasy", "monospace").
			-- If `a_family start with "cairo :", the font used will be the internal
			-- cairo font (and not the system font even they are available).
			-- If `a_family'.`is_empty', `Current' will use the defaut font.
		local
			l_utf_converter:UTF_CONVERTER
			l_c_family:C_STRING
			l_weight:INTEGER
		do
			create l_utf_converter
			create l_c_family.make (l_utf_converter.string_32_to_utf_8_string_8 (a_family.to_string_32))
			if a_bold then
				l_weight := {CAIRO_EXTERNALS}.CAIRO_FONT_WEIGHT_BOLD
			else
				l_weight := {CAIRO_EXTERNALS}.CAIRO_FONT_WEIGHT_NORMAL
			end
			item := {CAIRO_EXTERNALS}.cairo_toy_font_face_create(l_c_family.item, a_slant_flags, l_weight)
			error_code := {CAIRO_EXTERNALS}.cairo_font_face_status(item)
			is_valid := is_success
			if is_success then
				type_index := {CAIRO_EXTERNALS}.cairo_font_face_get_type(item)
			end
		ensure
			Is_Created: not item.is_default_pointer
		end

feature -- Access

	family:STRING_32
			-- The name of the font family
		require
			Is_Valid: is_valid
		local
			l_utf_converter:UTF_CONVERTER
			l_c_family:C_STRING
		do
			create l_c_family.make_shared_from_pointer (
							{CAIRO_EXTERNALS}.cairo_toy_font_face_get_family(item)
						)
			Result := l_utf_converter.utf_8_string_8_to_string_32 (l_c_family.string)
		end

	is_bold:BOOLEAN
			-- `Current' is drawed in bold weight
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_toy_font_face_get_weight(item) =
								{CAIRO_EXTERNALS}.CAIRO_FONT_WEIGHT_BOLD
		end

	is_italic:BOOLEAN
			-- `Current' is drawed in italic slant
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_toy_font_face_get_slant(item) =
								{CAIRO_EXTERNALS}.CAIRO_FONT_SLANT_ITALIC
		end

	is_oblique:BOOLEAN
			-- `Current' is drawed in oblique slant
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_toy_font_face_get_slant(item) =
								{CAIRO_EXTERNALS}.CAIRO_FONT_SLANT_OBLIQUE
		end

end
