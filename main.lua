Gamestate = require 'hump.gamestate'

--Load gamestates
local menu = require 'menu'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(menu)
end



