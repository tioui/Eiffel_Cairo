note
	description: "Specify the way pixels are stocked in memory."
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_PIXEL_FORMAT

inherit
	CAIRO_ANY
		redefine
			is_equal
		end

create {CAIRO_ANY}
	make_from_item

create
	make_argb32,
	make_rgb24,
	make_a8,
	make_a1,
	make_rgb16_565,
	make_rgb30

feature {NONE} -- Initialization

	make_from_item(a_item:INTEGER)
			-- Initialization of `Current' using `a_item' as `item'
		do
			item := a_item
		end

	make_argb32
			-- Initialization of `Current' with `is_argb32' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_ARGB32)
		ensure
			Is_Valid: is_argb32
		end

	make_rgb24
			-- Initialization of `Current' with `is_rgb24' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB24)
		ensure
			Is_Valid: is_rgb24
		end

	make_a8
			-- Initialization of `Current' with `is_a8' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_A8)
		ensure
			Is_Valid: is_a8
		end

	make_a1
			-- Initialization of `Current' with `is_a1' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_A1)
		ensure
			Is_Valid: is_a1
		end

	make_rgb16_565
			-- Initialization of `Current' with `is_rgb16_565' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB16_565)
		ensure
			Is_Valid: is_rgb16_565
		end

	make_rgb30
			-- Initialization of `Current' with `is_rgb30' set to `True'
		do
			make_from_item ({CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB30)
		ensure
			Is_Valid: is_rgb30
		end

feature -- Access

	is_unsupported:BOOLEAN
			-- The value of `Current' is not supported
		do
			Result := not (is_argb32 or is_rgb24 or is_a8 or is_a1 or is_rgb16_565 or is_rgb30)
		end

	is_argb32:BOOLEAN
			-- Each pixel is a 32-bit quantity, with alpha in the upper 8 bits, then red, then green, then blue
			-- Pre-multiplied alpha is used. (That is, 50% transparent red is 0x80800000, not 0x80ff0000.)
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_ARGB32
		end

	is_rgb24:BOOLEAN
			-- Each pixel is a 32-bit quantity, with the upper 8 bits unused. Red, Green, and Blue are stored
			-- in the remaining 24 bits in that order.
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB24
		end

	is_a8:BOOLEAN
			-- Each pixel is a 8-bit quantity holding an alpha value.
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_A8
		end

	is_a1:BOOLEAN
			-- Each pixel is a 1-bit quantity holding an alpha value. Pixels are packed together into 32-bit quantities.
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_A1
		end

	is_rgb16_565:BOOLEAN
			-- Each pixel is a 16-bit quantity with red in the upper 5 bits,
			-- then green in the middle 6 bits, and blue in the lower 5 bits.
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB16_565
		end

	is_rgb30:BOOLEAN
			-- Like `is_rgb26' but with 10 bits per color
		do
			Result := item  = {CAIRO_EXTERNALS}.CAIRO_FORMAT_RGB30
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := item ~ a_other.item
		end

feature {CAIRO_ANY} -- Implementation

	item:INTEGER
			-- The internal value of `Current'

end
