note
	description: "cairo_test application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_test:CAIRO_SURFACE_IMAGE
			l_test2:CAIRO_PIXEL_FORMAT
			l_test3:CAIRO_PATTERN_GRADIENT_LINEAR
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
