note
	description: "An internal Cairo C Enum management."
	author: "Louis Marchand"
	date: "Sun, 09 Apr 2017 15:09:40 +0000"
	revision: "0.1"

class
	CAIRO_INTERNAL_ENUM

inherit
	CAIRO_ANY
		redefine
			is_equal
		end

feature {NONE} -- Iniialization

	make(a_item:INTEGER)
			-- Initialization of `Current' using `a_item' as `item'
		do
			item := a_item
		ensure
			Is_Assign: item ~ a_item
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := item ~ a_other.item
		end

feature {CAIRO_ANY} -- Implementation

	item:INTEGER
			-- Internal representation of `Current'

end
