note
	description: "Options used in {CAIRO_SCALED_FONT}"
	author: "Louis Marchand"
	date: "Wed, 29 Mar 2017 02:01:53 +0000"
	revision: "0.1"

class
	CAIRO_FONT_OPTION

inherit
	CAIRO_ANTIALIASABLE
		redefine
			default_create, is_equal
		end
	CAIRO_INTERNAL_MEMORY_POINTER
		redefine
			default_create, is_equal
		end
	CAIRO_NO_MEMORY_ERROR
		redefine
			default_create, is_equal
		end
	DISPOSABLE
		redefine
			default_create, is_equal
		end

create
	default_create,
	make_from_other

feature {NONE} -- Initialization

	default_create
			-- Initialization of `Current'
		do
			make ({CAIRO_EXTERNALS}.cairo_font_options_create)
			error_code := {CAIRO_EXTERNALS}.cairo_font_options_status(item)
			is_valid := is_success
		end

	make_from_other(a_other:CAIRO_FONT_OPTION)
			-- Initialization of `Current' copying `a_other'
		do
			make ({CAIRO_EXTERNALS}.cairo_font_options_copy(a_other.item))
			error_code := {CAIRO_EXTERNALS}.cairo_font_options_status(item)
			is_valid := is_success
		end

feature -- Access

	hash:NATURAL_32
			-- A Hash of `Current'
		require
			Is_Valid: is_valid
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_hash(item)
		end

feature -- Settings

	merge(a_other:CAIRO_FONT_OPTION)
			-- Merges non-default options from `a_other' to `Current', replacing existing values.
		require
			Is_Valid: is_valid and a_other.is_valid
		do
			{CAIRO_EXTERNALS}.cairo_font_options_merge(item, a_other.item)
		end

	set_default_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_DEFAULT)
		end

	set_no_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_NONE)
		end

	set_single_color_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GRAY)
		end

	set_subpixel_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_SUBPIXEL)
		end

	set_fast_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_FAST)
		end

	set_good_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GOOD)
		end

	set_best_antialiasing
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_antialias(item, {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_BEST)
		end

	set_default_subpixel_order
			-- Use the default subpixel order in `Current'
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_subpixel_order(item, {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_DEFAULT)
		ensure
			Is_Set: is_default_subpixel_order
		end

	set_rgb_subpixel_order
			-- Subpixel elements are arranged horizontally with red at the left in `Current'
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_subpixel_order(item, {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_RGB)
		ensure
			Is_Set: is_rgb_subpixel_order
		end

	set_bgr_subpixel_order
			-- Subpixel elements are arranged horizontally with blue at the left in `Current'
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_subpixel_order(item, {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_BGR)
		ensure
			Is_Set: is_bgr_subpixel_order
		end

	set_vrgb_subpixel_order
			-- Subpixel elements are arranged vertically with red at the left in `Current'
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_subpixel_order(item, {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_VRGB)
		ensure
			Is_Set: is_vrgb_subpixel_order
		end

	set_vbgr_subpixel_order
			-- Subpixel elements are arranged vertically with blue at the left in `Current'
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_subpixel_order(item, {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_VBGR)
		ensure
			Is_Set: is_vbgr_subpixel_order
		end

	set_default_hint_style
			-- `Current' use the default hinting style
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_style(item, {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_DEFAULT)
		ensure
			Is_Set: is_default_hint_style
		end

	set_no_hint_style
			-- `Current' don't use any hinting style
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_style(item, {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_NONE)
		ensure
			Is_Set: is_no_hint_style
		end

	set_slight_hint_style
			-- `Current' hint outlines slightly to improve contrast while
			-- retaining good fidelity to the original shapes
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_style(item, {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_SLIGHT)
		ensure
			Is_Set: is_slight_hint_style
		end

	set_medium_hint_style
			-- `Current' hint outlines with medium strength giving a compromise
			-- between fidelity to the original shapes and contrast
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_style(item, {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_MEDIUM)
		ensure
			Is_Set: is_medium_hint_style
		end

	set_full_hint_style
			-- `Current' hint outlines to maximize contrast
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_style(item, {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_FULL)
		ensure
			Is_Set: is_full_hint_style
		end

	set_default_hint_metrics
			-- `Current' use hint metrics if this is the
			-- font backend and target device default manner.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_metrics(item, {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_DEFAULT)
		ensure
			Is_Set: is_default_hint_metrics
		end

	enable_hint_metrics
			-- Use hint metrics in `Current'.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_metrics(item, {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_ON)
		ensure
			Is_Set: is_hint_metrics_enabled
		end

	disable_hint_metrics
			-- Do not use hint metrics in `Current'.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			{CAIRO_EXTERNALS}.cairo_font_options_set_hint_metrics(item, {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_OFF)
		ensure
			Is_Set: is_hint_metrics_disabled
		end

feature -- Status report

	is_default_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_DEFAULT
		end

	is_no_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_NONE
		end

	is_single_color_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GRAY
		end

	is_subpixel_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_SUBPIXEL
		end

	is_fast_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_FAST
		end

	is_good_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_GOOD
		end

	is_best_antialiasing:BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_antialias(item) = {CAIRO_EXTERNALS}.CAIRO_ANTIALIAS_BEST
		end

	is_default_subpixel_order:BOOLEAN
			-- `True' if `Current' use the default subpixel order
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_subpixel_order(item) = {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_DEFAULT
		end

	is_rgb_subpixel_order:BOOLEAN
			-- `True' if subpixel elements are arranged horizontally with red at the left in `Current'
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_subpixel_order(item) = {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_RGB
		end

	is_bgr_subpixel_order:BOOLEAN
			-- `True' if subpixel elements are arranged horizontally with blue at the left in `Current'
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_subpixel_order(item) = {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_BGR
		end

	is_vrgb_subpixel_order:BOOLEAN
			-- `True' if subpixel elements are arranged vertically with red at the left in `Current'
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_subpixel_order(item) = {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_VRGB
		end

	is_vbgr_subpixel_order:BOOLEAN
			-- `True' if subpixel elements are arranged vertically with blue at the left in `Current'
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_subpixel_order(item) = {CAIRO_EXTERNALS}.CAIRO_SUBPIXEL_ORDER_VBGR
		end

	is_default_hint_style:BOOLEAN
			-- `True' if `Current' use the default hinting style
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_style(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_DEFAULT
		end

	is_no_hint_style:BOOLEAN
			-- `True' if `Current' don't use any hinting style
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_style(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_NONE
		end

	is_slight_hint_style:BOOLEAN
			-- `True' if `Current' hint outlines slightly to improve contrast while
			-- retaining good fidelity to the original shapes
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_style(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_SLIGHT
		end

	is_medium_hint_style:BOOLEAN
			-- `True' if `Current' hint outlines with medium strength giving a compromise
			-- between fidelity to the original shapes and contrast
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_style(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_MEDIUM
		end

	is_full_hint_style:BOOLEAN
			-- `True' if `Current' hint outlines to maximize contrast
			-- Hinting is the process of fitting outlines to the pixel
			-- grid in order to improve the appearance of the result.
			-- Since hinting outlines involves distorting them, it also
			-- reduces the faithfulness to the original outline shapes.
			-- Not all of the outline hinting styles are supported by all font backends.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_style(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_STYLE_FULL
		end

	is_default_hint_metrics: BOOLEAN
			-- `True' if `Current' use the default hint metrics of the
			-- font backend and target device.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_metrics(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_DEFAULT
		end

	is_hint_metrics_enabled: BOOLEAN
			-- `True' if `Current' use hint metrics.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_metrics(item) =  {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_ON
		end

	is_hint_metrics_disabled: BOOLEAN
			-- `True' if `Current' do not use hint metrics.
			-- Hinting font metrics means quantizing them so that
			-- they are integer values in device space
			-- Doing this improves the consistency of letter and line spacing,
			-- however it also means that text will be laid out differently at different zoom factors.
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_get_hint_metrics(item) = {CAIRO_EXTERNALS}.CAIRO_HINT_METRICS_OFF
		end

feature -- Comparison

	is_equal (a_other: like Current): BOOLEAN
			-- <Precursor>
		do
			Result := {CAIRO_EXTERNALS}.cairo_font_options_equal(item, a_other.item)
		end

feature {NONE} -- Removal

	dispose
			-- <Precursor>
		do
			{CAIRO_EXTERNALS}.cairo_font_options_destroy(item)
		end
end
