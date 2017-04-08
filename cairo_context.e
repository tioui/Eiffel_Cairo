note
	description: "[
				Contains the current state of the rendering device, including 
				coordinates of yet to be drawn shapes.
			]"
	author: "Louis Marchand"
	date: "Tue, 28 Mar 2017 01:55:45 +0000"
	revision: "0.1"

class
	CAIRO_CONTEXT

inherit
	CAIRO_ERROR
	DISPOSABLE

create
	make

feature {NONE} -- Initialization

	make(a_surface:CAIRO_SURFACE)
			-- Initialization of `Current' drawing on `a_surface'
		require
			Surface_Valid: a_surface.is_valid
		do
			surface := a_surface
			item := {CAIRO_EXTERNALS}.cairo_create(a_surface.item)
			if not item.is_default_pointer then
				error_code := {CAIRO_EXTERNALS}.cairo_status(item)
				is_valid := is_success
			end
		ensure
			Surface_assign:surface~ a_surface
			Item_Valid: not item.is_default_pointer
		end

feature -- Access

	is_valid:BOOLEAN
			-- `Current' is a valid context

	surface:CAIRO_SURFACE
			-- The {CAIRO_SURFACE} that `Current' is drawing on

	save_state
			-- Push the state of `Current' in the internal state stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_save(item)
		end

	restore_state
			-- Pull the state of `Current' from the internal state stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_save(item)
		end

	push_group
			-- Temporarily redirects drawing to an intermediate surface
			-- known as a group. Must call `pop_group' to geting back to
			-- the original target. Can be call multiple times as group are
			-- store in an internal stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_push_group(item)
		end

	push_group_with_content(a_content:CAIRO_CONTENT_TYPE)
			-- Temporarily redirects drawing to an intermediate surface
			-- known as a group. Must call `pop_group' to geting back to
			-- the original target. Can be call multiple times as group are
			-- store in an internal stack
		require
			Is_Valid:is_valid
		do
			{CAIRO_EXTERNALS}.cairo_push_group_with_content(item, a_content.item)
		end

--	pop_group
--			-- Replace the group pushed by `push_group'.
--		require
--			Is_Valid:is_valid
--		do

--		end

feature {CAIRO_ANY} -- Implementation

	item:POINTER
			-- Internal representation of `Current'

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_destroy(item)
		end

end
