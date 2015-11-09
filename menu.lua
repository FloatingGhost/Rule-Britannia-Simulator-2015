require 'TEsound'

local menu = {} -- public interface
local audiodir = "assets/"
local imagedir = "assets/"
local image = love.graphics.newImage
local draw  = love.graphics.draw

local bg = image(imagedir .. "union_flag.jpg")
local start = image(imagedir .. "play-button.png")
local options = image(imagedir.. "options-button.png")
local tutorial = image(imagedir .. "tutorial-button.png")
local exit = image(imagedir .. "exit-button.png")



function menu:enter(from)
  TEsound.playLooping(audiodir .. "Rule-Britannia.mp3", "theme")
end

function menu:update()
  TEsound.cleanup()
end

function menu:draw()
  draw(bg, 0, 0)
  draw(start, 200, 600)
  draw(options, 400, 600)
  draw(tutorial, 600, 600)
  draw(exit, 800, 600)  
end

function menu:mousereleased(x, y, button)
  --Start button
  if button_clicked(love.mouse.getX(), love.mouse.getY(), 200, 600) then
    TEsound.stop("theme")
    if Gamestate == nil then os.exit() end
    Gamestate.switch(empireselect)
  end

  --exit
  if button_clicked(love.mouse.getX(), love.mouse.getY(), 800, 600) then
    os.exit()
  end
 
end 


function button_clicked(mouseX, mouseY, rectX, rectY)
  x = rectX <= mouseX and mouseX <= rectX + 100
  y = rectY <= mouseY and mouseY <= rectY + 100
  return x and y
end

return menu

