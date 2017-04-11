note
	description: "[
				Representing a device.
				The devices types are also known as 'backends' within cairo
			]"
	author: "Louis Marchand"
	date: "Wed, 29 Mar 2017 02:01:53 +0000"
	revision: "0.1"

class
	CAIRO_DEVICE

inherit
	CAIRO_INTERNAL_MEMORY_POINTER
		redefine
			make
		end
	CAIRO_DEVICE_ERROR
		undefine
			is_equal
		end
	DISPOSABLE
		undefine
			is_equal
		end

create {CAIRO_ANY}
	make

feature {NONE} -- Initialization

	make(a_item:POINTER)
			-- Initialization of `Current' using `a_item' as `item'
		do
			item := {CAIRO_EXTERNALS}.cairo_device_reference(a_item)
			type_index := {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_INVALID
			error_code := {CAIRO_EXTERNALS}.cairo_device_status(item)
			is_valid := is_success
			if is_success then
				type_index := {CAIRO_EXTERNALS}.cairo_device_get_type(item)
			end
		end

feature -- Access

	flush
			-- Finish any pending operations on `Current' and also restore
			-- any temporary modifications cairo has made to `Current''s state.
			-- This feature may `acquire' `Current'.
		require
			Is_valid: not is_type_valid
		do
			{CAIRO_EXTERNALS}.cairo_device_flush(item)
			error_code := {CAIRO_EXTERNALS}.cairo_device_status(item)
		end

	aquire
			-- Acquires `Current' for the current thread.
			-- After `Current' is aquired, a matching call to `release' is required.
			-- This feature will block until no other thread has acquired `Current'.
			-- You must never acquire two different devices at the same time unless this
			-- is explicitly allowed. Otherwise the possibility of deadlocks exist.
			-- As various features can acquire {CAIRO_DEVICE} when called, these features
			-- may also cause deadlocks when you call them with an acquired {CAIRO_DEVICE}.
			-- So you must not have a {CAIRO_DEVICE} acquired when calling them. These features
			-- are marked in the documentation.
		do
			error_code := {CAIRO_EXTERNALS}.cairo_device_acquire(item)
		end

	release
			-- Release `Current' that has been previously `aquire'd
		do
			{CAIRO_EXTERNALS}.cairo_device_release(item)
		end

feature -- Status report

	is_type_drm:BOOLEAN
			-- Is `Current' of type 'Direct Render Manager' (DRM)
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_DRM
		end

	is_type_opengl:BOOLEAN
			-- Is `Current' of type OpenGL
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_GL
		end

	is_type_script:BOOLEAN
			-- Is `Current' of type script (usefull to batch a drawing sequence)
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_GL
		end

	is_type_xcb:BOOLEAN
			-- Is `Current' of type 'X protocol C-language Binding' (XCB)
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_XCB
		end

	is_type_xlib:BOOLEAN
			-- Is `Current' of type X library
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_XLIB
		end

	is_type_xml:BOOLEAN
			-- Is `Current' of type X library
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_XML
		end

	is_type_cogl:BOOLEAN
			-- Is `Current' of type X library
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_COGL
		end

	is_type_win32:BOOLEAN
			-- Is `Current' of type Microsoft Windows
		do
			Result := type_index = {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_WIN32
		end

	is_type_valid:BOOLEAN
			-- Is `Current' valid
		do
			Result := type_index /= {CAIRO_EXTERNALS}.CAIRO_DEVICE_TYPE_INVALID
		end

feature {CAIRO_ANY} -- Implementation

	type_index:INTEGER
			-- The type of `Current'

feature{NONE} -- Implementation

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_device_destroy(item)
		end

end
