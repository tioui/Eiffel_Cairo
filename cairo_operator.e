note
	description: "The type of operator for 2d drawing."
	author: "Louis Marchand"
	date: "Mon, 10 Apr 2017 12:02:16 +0000"
	revision: "0.1"

class
	CAIRO_OPERATOR

inherit
	CAIRO_INTERNAL_ENUM

create {CAIRO_ANY}
	make

create
	set_clear,
	set_source,
	set_over,
	set_in,
	set_out,
	set_atop,
	set_dest,
	set_dest_over,
	set_dest_in,
	set_dest_out,
	set_dest_atop,
	set_xor,
	set_add,
	set_saturate,
	set_multiply,
	set_screen,
	set_overlay,
	set_darken,
	set_lighten,
	set_color_dodge,
	set_color_burn,
	set_hard_light,
	set_soft_light,
	set_difference,
	set_exclusion,
	set_hsl_hue,
	set_hsl_saturation,
	set_hsl_color,
	set_hsl_luminosity

feature -- Access

	set_clear
			-- clear destination layer (bounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_clear
		ensure
			Is_Set: is_clear
		end

	is_clear:BOOLEAN
			-- clear destination layer (bounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_clear
		end

	set_source
			-- replace destination layer (bounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_source
		ensure
			Is_Set: is_source
		end

	is_source:BOOLEAN
			-- replace destination layer (bounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_source
		end

	set_over
			-- draw source layer on top of destination layer (bounded)
			-- This is the default.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_over
		ensure
			Is_Set: is_over
		end

	is_over:BOOLEAN
			-- draw source layer on top of destination layer (bounded)
			-- This is the default.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_over
		end

	set_in
			-- draw source where there was destination content (unbounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_in
		ensure
			Is_Set: is_in
		end

	is_in:BOOLEAN
			-- draw source where there was destination content (unbounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_in
		end

	set_out
			-- draw source where there was no destination content (unbounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_out
		ensure
			Is_Set: is_out
		end

	is_out:BOOLEAN
			-- draw source where there was no destination content (unbounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_out
		end

	set_atop
			-- draw source on top of destination content and only there
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_atop
		ensure
			Is_Set: is_atop
		end

	is_atop:BOOLEAN
			-- draw source on top of destination content and only there
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_atop
		end

	set_dest
			-- ignore the source
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest
		ensure
			Is_Set: is_dest
		end

	is_dest:BOOLEAN
			-- ignore the source
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest
		end

	set_dest_over
			-- draw destination on top of source
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_over
		ensure
			Is_Set: is_dest_over
		end

	is_dest_over:BOOLEAN
			-- draw destination on top of source
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_over
		end

	set_dest_in
			-- leave destination only where there was source content (unbounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_in
		ensure
			Is_Set: is_dest_in
		end

	is_dest_in:BOOLEAN
			-- leave destination only where there was source content (unbounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_in
		end

	set_dest_out
			-- leave destination only where there was no source content
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_out
		ensure
			Is_Set: is_dest_out
		end

	is_dest_out:BOOLEAN
			-- leave destination only where there was no source content
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_out
		end

	set_dest_atop
			-- leave destination on top of source content and only there (unbounded)
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_atop
		ensure
			Is_Set: is_dest_atop
		end

	is_dest_atop:BOOLEAN
			-- leave destination on top of source content and only there (unbounded)
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_dest_atop
		end

	set_xor
			-- source and destination are shown where there is only one of them
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_xor
		ensure
			Is_Set: is_xor
		end

	is_xor:BOOLEAN
			-- source and destination are shown where there is only one of them
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_xor
		end

	set_add
			-- source and destination layers are accumulated
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_add
		ensure
			Is_Set: is_add
		end

	is_add:BOOLEAN
			-- source and destination layers are accumulated
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_add
		end

	set_saturate
			-- like over, but assuming source and dest are disjoint geometries
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_saturate
		ensure
			Is_Set: is_saturate
		end

	is_saturate:BOOLEAN
			-- like over, but assuming source and dest are disjoint geometries
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_saturate
		end

	set_multiply
			-- source and destination layers are multiplied.
			-- This causes the result to be at least as dark as the darker inputs.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_multiply
		ensure
			Is_Set: is_multiply
		end

	is_multiply:BOOLEAN
			-- source and destination layers are multiplied.
			-- This causes the result to be at least as dark as the darker inputs.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_multiply
		end

	set_screen
			-- source and destination are complemented and multiplied. This
			-- causes the result to be at least as light as the lighter inputs.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_screen
		ensure
			Is_Set: is_screen
		end

	is_screen:BOOLEAN
			-- source and destination are complemented and multiplied. This
			-- causes the result to be at least as light as the lighter inputs.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_screen
		end

	set_overlay
			-- multiplies or screens, depending on the lightness of
			-- the destination color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_overlay
		ensure
			Is_Set: is_overlay
		end

	is_overlay:BOOLEAN
			-- multiplies or screens, depending on the lightness of
			-- the destination color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_overlay
		end

	set_darken
			-- replaces the destination with the source if it is darker,
			-- otherwise keeps the source.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_darken
		ensure
			Is_Set: is_darken
		end

	is_darken:BOOLEAN
			-- replaces the destination with the source if it is darker,
			-- otherwise keeps the source.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_darken
		end

	set_lighten
			-- replaces the destination with the source if it is
			-- lighter, otherwise keeps the source.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_lighten
		ensure
			Is_Set: is_lighten
		end

	is_lighten:BOOLEAN
			-- replaces the destination with the source if it is
			-- lighter, otherwise keeps the source.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_lighten
		end

	set_color_dodge
			-- brightens the destination color to reflect the source color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_color_dodge
		ensure
			Is_Set: is_color_dodge
		end

	is_color_dodge:BOOLEAN
			-- brightens the destination color to reflect the source color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_color_dodge
		end

	set_color_burn
			-- darkens the destination color to reflect the source color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_color_burn
		ensure
			Is_Set: is_color_burn
		end

	is_color_burn:BOOLEAN
			-- darkens the destination color to reflect the source color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_color_burn
		end

	set_hard_light
			-- Multiplies or screens, dependent on source color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hard_light
		ensure
			Is_Set: is_hard_light
		end

	is_hard_light:BOOLEAN
			-- Multiplies or screens, dependent on source color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hard_light
		end

	set_soft_light
			-- Darkens or lightens, dependent on source color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_soft_light
		ensure
			Is_Set: is_soft_light
		end

	is_soft_light:BOOLEAN
			-- Darkens or lightens, dependent on source color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_soft_light
		end

	set_difference
			-- Takes the difference of the source and destination color.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_difference
		ensure
			Is_Set: is_difference
		end

	is_difference:BOOLEAN
			-- Takes the difference of the source and destination color.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_difference
		end

	set_exclusion
			-- Produces an effect similar to difference, but with lower contrast.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_exclusion
		ensure
			Is_Set: is_exclusion
		end

	is_exclusion:BOOLEAN
			-- Produces an effect similar to difference, but with lower contrast.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_exclusion
		end

	set_hsl_hue
			-- Creates a color with the hue of the source and the
			-- saturation and luminosity of the target.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_hue
		ensure
			Is_Set: is_hsl_hue
		end

	is_hsl_hue:BOOLEAN
			-- Creates a color with the hue of the source and the
			-- saturation and luminosity of the target.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_hue
		end

	set_hsl_saturation
			-- Creates a color with the saturation of the source and
			-- the hue and luminosity of the target. Painting with
			-- this mode onto a gray area produces no change.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_saturation
		ensure
			Is_Set: is_hsl_saturation
		end

	is_hsl_saturation:BOOLEAN
			-- Creates a color with the saturation of the source and
			-- the hue and luminosity of the target. Painting with
			-- this mode onto a gray area produces no change.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_saturation
		end

	set_hsl_color
			-- Creates a color with the hue and saturation of the
			-- source and the luminosity of the target. This
			-- preserves the gray levels of the target and is
			-- useful for coloring monochrome images or tinting color images.
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_color
		ensure
			Is_Set: is_hsl_color
		end

	is_hsl_color:BOOLEAN
			-- Creates a color with the hue and saturation of the
			-- source and the luminosity of the target. This
			-- preserves the gray levels of the target and is
			-- useful for coloring monochrome images or tinting color images.
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_color
		end

	set_hsl_luminosity
			-- Creates a color with the luminosity of the source
			-- and the hue and saturation of the target. This
			-- produces an inverse effect to `set_hsl_color' .
		do
			item := {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_luminosity
		ensure
			Is_Set: is_hsl_luminosity
		end

	is_hsl_luminosity:BOOLEAN
			-- Creates a color with the luminosity of the source
			-- and the hue and saturation of the target. 
		do
			Result := item = {CAIRO_EXTERNALS}.CAIRO_OPERATOR_hsl_luminosity
		end


end
