Gamestate = require 'hump.gamestate'
yui       = require 'yui'

--Load gamestates
menu = require 'menu'
empireselect = require 'empire_select'
gamescreen = require 'gamescreen'

function love.load()
  Gamestate.registerEvents()
  yui.UI.registerEvents()
  Gamestate.switch(menu)
end

function love.update(dt)
  yui.update({})
end



