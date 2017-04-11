note
	description: "Classes that can use antialias functionnality."
	author: "Louis Marchand"
	date: "Sun, 09 Apr 2017 23:55:46 +0000"
	revision: "0.1"

deferred class
	CAIRO_ANTIALIASABLE

feature -- Settings

	set_default_antialiasing
			-- Use the default antialiasing in `Current'
		deferred
		ensure
			Is_Set: is_default_antialiasing
		end

	set_no_antialiasing
			-- Don't use any antialiasing in `Current'
		deferred
		ensure
			Is_Set: is_no_antialiasing
		end

	set_single_color_antialiasing
			-- Use single-color antialiasing in `Current'.
			-- For exemple, using shades of gray for black text on a white background
		deferred
		ensure
			Is_Set: is_single_color_antialiasing
		end

	set_subpixel_antialiasing
			-- Use antialiasing by taking advantage of the order of subpixel elements on devices such as LCD panels.
		deferred
		ensure
			Is_Set: is_subpixel_antialiasing
		end

	set_fast_antialiasing
			-- Hint that `Current' should perform some antialiasing but prefer speed over quality
		deferred
		ensure
			Is_Set: is_fast_antialiasing
		end

	set_good_antialiasing
			-- Hint that `Current' should balance quality against performance
		deferred
		ensure
			Is_Set: is_good_antialiasing
		end

feature -- Status report

	is_default_antialiasing:BOOLEAN
			-- `True' if `Current' use the default antialiasing
		deferred
		end

	is_no_antialiasing:BOOLEAN
			-- `True' if `Current' don't use any antialiasing
		deferred
		end

	is_single_color_antialiasing:BOOLEAN
			-- `True' if `Current' use a single-color antialiasing
		deferred
		end

	is_subpixel_antialiasing:BOOLEAN
			-- `True' if `Current' use antialiasing by taking advantage
			-- of the order of subpixel elements on devices such as LCD panels.
		deferred
		end

	is_fast_antialiasing:BOOLEAN
			-- `True' if `Current' should perform some antialiasing but prefer speed over quality
		deferred
		end

	is_good_antialiasing:BOOLEAN
			-- `True' if `Current' should balance quality against performance
		deferred
		end

	is_best_antialiasing:BOOLEAN
			-- `True' if `Current' should render at the highest quality, sacrificing speed if necessary
		deferred
		end

end
