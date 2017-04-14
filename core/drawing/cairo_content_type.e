note
	description: "The type of the content of a {CAIRO_SURFACE}"
	author: "Louis Marchand"
	date: "Wed, 29 Mar 2017 02:01:53 +0000"
	revision: "0.1"

class
	CAIRO_CONTENT_TYPE

inherit
	CAIRO_INTERNAL_ENUM

create {CAIRO_ANY}
	make

create
	make_color_only,
	make_alpha_only,
	make_color_and_alpha

feature {NONE} -- Iniialization

	make_color_only
		do
			make({CAIRO_EXTERNALS}.CAIRO_CONTENT_COLOR)
		ensure
			Is_Assign: is_color_only
		end

	make_alpha_only
		do
			make({CAIRO_EXTERNALS}.CAIRO_CONTENT_ALPHA)
		ensure
			Is_Assign: is_alpha_only
		end

	make_color_and_alpha
		do
			make({CAIRO_EXTERNALS}.CAIRO_CONTENT_COLOR_ALPHA)
		ensure
			Is_Assign: is_color_and_alpha
		end

feature -- Access

	is_color_only:BOOLEAN
			-- The {CAIRO_SURFACE} will hold color content only
		do
			Result := item ~ {CAIRO_EXTERNALS}.CAIRO_CONTENT_COLOR
		end

	is_alpha_only:BOOLEAN
			-- The {CAIRO_SURFACE} will hold alpha value content only
		do
			Result := item ~ {CAIRO_EXTERNALS}.CAIRO_CONTENT_COLOR
		end

	is_color_and_alpha:BOOLEAN
			-- The {CAIRO_SURFACE} will hold color and alpha content
		do
			Result := item ~ {CAIRO_EXTERNALS}.CAIRO_CONTENT_COLOR_ALPHA
		end
end
