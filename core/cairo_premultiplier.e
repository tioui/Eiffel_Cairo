note
	description: "Tools used to convert premultiplied and postmultiplied pixel values"
	author: "Louis Marchand"
	date: "Sat, 20 Jan 2018 18:39:47 +0000"
	revision: "0.1"

class
	CAIRO_PREMULTIPLIER

feature -- Access

	premultiply_to_postmultiply(
							a_source, a_destination:POINTER;
							a_from_x, a_from_y, a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER;
							a_source_red_shift, a_source_green_shift, a_source_blue_shift, a_source_alpha_shift:INTEGER;
							a_destination_red_shift, a_destination_green_shift, a_destination_blue_shift, a_destination_alpha_shift:INTEGER
						)
			-- Since Cairo use premultiplied alpha value and a lot of other technology use
			-- a postmultiplied alpha value, a transcription need to be made. This
			-- copy the data (in premultiplied format) in `a_souce' to `a_destination'
			-- (in postmultiplied format). The pixel region to copy start at `a_from_x', `a_from_y'
			-- (start at 0) and have a dimension of `a_width' x `a_height'.
			-- The lenght (in byte) of each pixel line in `a_source' is `a_source_pitch' and in
			-- `a_destination', it is `a_destination_pitch'.
			-- The Color format use `a_source_red_shift', `a_source_green_shift', `a_source_blue_shift' and
			-- `a_source_alpha_shift' to mask the source colors and `a_destination_red_shift', `a_destination_green_shift',
			-- `a_destination_blue_shift' and `a_destination_alpha_shift' to mask the destination color
		require
			Source_Width_Valid: (a_from_x + a_width) * 4 <= a_source_pitch
			Destination_Width_Valid: (a_from_x + a_width) * 4 <= a_destination_pitch
		external
			"C inline use <stdint.h>"
		alias
			"[
				uint32_t *l_source = (uint32_t *)$a_source;
				uint32_t *l_destination = (uint32_t *)$a_destination;
				int i, j, x_index, y_index;
				uint32_t l_color, l_alpha, l_red, l_green, l_blue;
				int l_source_pitch = $a_source_pitch / 4;
				int l_destination_pitch = $a_destination_pitch / 4;
				for(i=0; i < $a_height; i = i + 1)
				{
					for(j=0; j < $a_width; j = j + 1)
					{
						x_index = (j + $a_from_x);
						y_index = (i + $a_from_y);
						l_color = l_source[(y_index * l_source_pitch) + x_index];
						l_alpha = (l_color >> $a_source_alpha_shift) & 0xFF;
						
						l_blue = (l_color >> $a_source_blue_shift) & 0xFF;
						l_green = (l_color >> $a_source_green_shift) & 0xFF;
						l_red = (l_color >> $a_source_red_shift) & 0xFF;
						if(l_alpha != 0){
							l_blue = (l_blue * 255) / l_alpha;
							l_green = (l_green * 255) / l_alpha;
							l_red = (l_red * 255) / l_alpha;
						}
						l_color = (l_alpha << $a_destination_alpha_shift) | (l_red << $a_destination_red_shift) | (l_green << $a_destination_green_shift) | (l_blue << $a_destination_blue_shift);
						l_destination[(y_index * l_destination_pitch) + x_index] = l_color;
					}
				}
			]"
		end

	postmultiply_to_premultiply(
							a_source, a_destination:POINTER;
							a_from_x, a_from_y, a_width, a_height, a_source_pitch, a_destination_pitch:INTEGER;
							a_source_red_shift, a_source_green_shift, a_source_blue_shift, a_source_alpha_shift:INTEGER;
							a_destination_red_shift, a_destination_green_shift, a_destination_blue_shift, a_destination_alpha_shift:INTEGER
						)
			-- Since Cairo use premultiplied alpha value and a lot of other technology use
			-- a postmultiplied alpha value, a transcription need to be made. This
			-- copy the data (in postmultiplied format) in `a_souce' to `a_destination'
			-- (in premultiplied format). The pixel region to copy start at `a_from_x', `a_from_y'
			-- (start at 0) and have a dimension of `a_width' x `a_height'.
			-- The lenght (in byte) of each pixel line in `a_source' is `a_source_pitch' and in
			-- `a_destination', it is `a_destination_pitch'.
			-- The Color format use `a_source_red_shift', `a_source_green_shift', `a_source_blue_shift' and
			-- `a_source_alpha_shift' to mask the source color and `a_destination_red_shift', `a_destination_green_shift',
			-- `a_destination_blue_shift' and `a_destination_alpha_shift' to mask the destination color
		require
			Source_Width_Valid: (a_from_x + a_width) * 4 <= a_source_pitch
			Destination_Width_Valid: (a_from_x + a_width) * 4 <= a_destination_pitch
		external
			"C inline use <stdint.h>"
		alias
			"[
				uint32_t *l_source = (uint32_t *)$a_source;
				uint32_t *l_destination = (uint32_t *)$a_destination;
				int i, j, x_index, y_index;
				uint32_t l_color, l_alpha, l_red, l_green, l_blue;
				int l_source_pitch = $a_source_pitch / 4;
				int l_destination_pitch = $a_destination_pitch / 4;
				for(i=0; i < $a_height; i = i + 1)
				{
					for(j=0; j < $a_width; j = j + 1)
					{
						x_index = (j + $a_from_x);
						y_index = (i + $a_from_y);
						l_color = l_source[(y_index * l_source_pitch) + x_index];
						l_alpha = (l_color >> $a_source_alpha_shift) & 0xFF;
						if(l_alpha!=0)
						{
							l_blue = (l_color >> $a_source_blue_shift) & 0xFF;
							l_green = (l_color >> $a_source_green_shift) & 0xFF;
							l_red = (l_color >> $a_source_red_shift) & 0xFF;
							l_blue = (l_blue * l_alpha) / 255;
							l_green = (l_green * l_alpha) / 255;
							l_red = (l_red * l_alpha) / 255;
						}
						else
						{
							l_blue = 0;
							l_green = 0;
							l_blue = 0;
						}
						l_color = (l_alpha << $a_destination_alpha_shift) | (l_red << $a_destination_red_shift) | (l_green << $a_destination_green_shift) | (l_blue << $a_destination_blue_shift);
						l_destination[(y_index * l_destination_pitch) + x_index] = l_color;
					}
				}
			]"
		end
end
