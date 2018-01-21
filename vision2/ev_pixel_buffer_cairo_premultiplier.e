note
	description: "Tools used to convert premultiplied and postmultiplied pixel values from Vision2 to Cairo"
	author: "Louis Marchand"
	date: "Sat, 20 Jan 2018 18:39:47 +0000"
	revision: "0.1"

class
	EV_PIXEL_BUFFER_CAIRO_PREMULTIPLIER

inherit
	ANY
		redefine
			default_create
		end


feature {NONE} -- Initialization

	default_create
			-- Initialization of `Current'
		do
			create cairo_premultiplier
		end

feature -- Access

	updating_vision2_from_cairo(a_source, a_destination:POINTER;
							a_from_x, a_from_y, a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER)
		do
			cairo_premultiplier.premultiply_to_postmultiply(
										a_source, a_destination,
										a_from_x, a_from_y,
										a_width, a_height,
										a_source_pitch, a_destination_pitch,
										16, 8, 0, 24,
										0, 8, 16, 24
									)
		end

	updating_cairo_from_vision2(a_source, a_destination:POINTER;
							a_from_x, a_from_y, a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER)
		do
			cairo_premultiplier.postmultiply_to_premultiply(
										a_source, a_destination,
										a_from_x, a_from_y,
										a_width, a_height,
										a_source_pitch, a_destination_pitch,
										0, 8, 16, 24,
										16, 8, 0, 24
									)
		end

feature {NONE} -- Implementation

	cairo_premultiplier:CAIRO_PREMULTIPLIER
		-- The premultiplier used un Eiffel_Cairo.


end
