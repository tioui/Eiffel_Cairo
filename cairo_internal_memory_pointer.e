note
	description: "An internal Cairo {POINTER} management."
	author: "Louis Marchand"
	date: "Sun, 09 Apr 2017 15:09:40 +0000"
	revision: "0.1"

deferred class
	CAIRO_INTERNAL_MEMORY_POINTER

inherit
	CAIRO_ANY
		redefine
			is_equal
		end

feature {NONE} -- Implementation

	make(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		require
			Is_Not_Null: not a_item.is_default_pointer
		do
			item := a_item
		ensure
			Is_Created: not item.is_default_pointer
		end
feature -- Access

	is_valid:BOOLEAN
			-- `Current' can be used

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := item ~ a_other.item
		end

feature {CAIRO_ANY} -- Implementation

	item:POINTER
			-- Internal representation of `Curren'

end
