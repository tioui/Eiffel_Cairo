note
	description: "A {CAIRO_SURFACE} that draw in a PDF file."
	author: "Louis Marchand"
	date: "Fri, 07 Apr 2017 01:56:31 +0000"
	revision: "0.1"

class
	CAIRO_SURFACE_PDF

inherit
	CAIRO_SURFACE

create
	make

feature {NONE} -- Initialization

	make(a_filename:READABLE_STRING_GENERAL; a_width, a_height:REAL_64)
			-- Initialization of `Current' writing to the file `a_filename',
			-- with dimension `a_width' x `a_height' in points (1 point == 1/72.0 inch).
		local
			l_c_filename:C_STRING
			l_converter:UTF_CONVERTER
		do
			create l_converter
			create l_c_filename.make (l_converter.string_32_to_utf_8_string_8 (a_filename.to_string_32))
			item := {CAIRO_EXTERNALS}.cairo_pdf_surface_create(l_c_filename.item, a_width, a_height)
			if not item.is_default_pointer then
				check_for_error
				is_valid := is_success
			end
		ensure
			Is_Created: not item.is_default_pointer
		end

feature -- Access

	restrict_to_version_1_4
			-- Restricts the generated PDF file to version 1.4
		do
			{CAIRO_EXTERNALS}.cairo_pdf_surface_restrict_to_version(item, {CAIRO_EXTERNALS}.CAIRO_PDF_VERSION_1_4)
		end

	restrict_to_version_1_5
			-- Restricts the generated PDF file to version 1.5
		do
			{CAIRO_EXTERNALS}.cairo_pdf_surface_restrict_to_version(item, {CAIRO_EXTERNALS}.CAIRO_PDF_VERSION_1_5)
		end


end
