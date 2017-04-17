note
	description: "Example tranlating {GAME_SURFACE} to {CAIRO_SURFACE} and inverse"
	author: "Louis Marchand"
	date: "Mon, 17 Apr 2017 15:27:49 +0000"
	revision: "0.1"

class
    APPLICATION

create
    make

feature {NONE} -- Initialization

    make
            -- Running the game.
        local
        	l_engine:ENGINE
        do
			create l_engine.make
			l_engine.run
        end

end
