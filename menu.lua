local menu = {} -- public interface

local bg = love.graphics.newImage("assets/union_flag.jpg")
local theme = love.audio.newSource("assets/Rule-Britannia.mp3")


love.audio.play(theme)

function menu.load()

end

function menu.draw()
  love.graphics.draw(bg, 0, 0)
end


return menu

