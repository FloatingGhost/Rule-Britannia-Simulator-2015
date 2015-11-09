Gamestate = require 'hump.gamestate'
yui       = require 'yui'

--Load gamestates
local menu = require 'menu'
local empire_select = require 'empire_select'

function love.load()
  Gamestate.registerEvents()
  yui.UI.registerEvents()
  Gamestate.switch(menu)
end

function love.update(dt)
  yui.update({})
end



