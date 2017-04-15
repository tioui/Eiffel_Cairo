note
	description: "Exemple using {GAME_SURFACE_CAIRO}."
	author: "Louis Marchand"
	date: "Wed, 12 Apr 2017 14:57:01 +0000"
	revision: "0.1"
	license: "GPL Version 3"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_engine:ENGINE
		do
			create l_engine.make
			l_engine.run
		end

end
