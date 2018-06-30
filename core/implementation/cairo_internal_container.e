note
	description: "A memory array of cairo object"
	author: "Louis Marchand"
	date: "Tue, 11 Apr 2017 15:55:10 +0000"
	revision: "0.1"

deferred class
	CAIRO_INTERNAL_CONTAINER[G -> CAIRO_ANY]

inherit
	CAIRO_ANY
	DISPOSABLE
	BILINEAR[G]
	READABLE_INDEXABLE[G]
		rename
			item as i_th alias "[]"
		end

feature {NONE} -- Initialization

	make(a_count:INTEGER)
			-- Initialization of `Current' using `a_count' as `count'
		require
			a_count > 0
		deferred
		end

	make_from_pointer(a_pointer:POINTER; a_count:INTEGER)
			-- Initialization of `Current' using `a_pointer' as
			-- `pointer' and `a_count' as `count'
		require
			a_count > 0
			Pointer_Not_Null: not a_pointer.is_default_pointer
		do
			item_pointer := a_pointer
			count := a_count
			compare_objects
		end

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := create_item(item_pointer + ((index - 1) * item_size))
		end

	i_th alias "[]" (a_index: INTEGER): like item
			-- <Precursor>
		do
			Result := create_item(item_pointer + ((a_index - 1) * item_size))
		end

feature -- Cursor movement

	index:INTEGER
			-- The cursor position

	before: BOOLEAN
			-- <Precursor>
		do
			Result := index <= 1
		end

	after: BOOLEAN
			-- <Precursor>
		do
			Result := index >= count
		end

	back
			-- <Precursor>
		do
			index := index - 1
		end

	finish
			-- <Precursor>
		do
			index := count
		end

	forth
			-- <Precursor>
		do
			index := index + 1
		end

	start
			-- <Precursor>
		do
			index := count
		end

feature -- Status report

	is_empty: BOOLEAN
			-- <Precursor>
		do
			Result := count = 0
		end

	valid_index (a_index: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := a_index >= 1 and a_index <= count
		end

feature -- Measurement

	count:INTEGER
			-- The number of element in `Current'

	lower: INTEGER = 1
			-- <Precursor>

	upper: INTEGER
			-- <Precursor>
		do
			Result := count
		end

feature {CAIRO_ANY} -- Implementation

	item_pointer:POINTER
			-- Internal memory array containing the `item's.

feature {NONE} -- Implementation

	create_item(a_pointer:POINTER): like item
			-- Create an instance of {G} using `a_pointer'
			-- a internal pointer
		deferred
		end

	item_size:INTEGER
			-- The size in memory of an `item'
		deferred
		end


end
