require 'TEsound'
class = require "30log"

local gamescreen = {} -- public interface
local audiodir = "assets/"
local imagedir = "assets/"
local image = love.graphics.newImage
local draw  = love.graphics.draw

local bg = image(imagedir .. "water.png")

local boatsprite = image(imagedir .. "boat.png")

Entities = {}

--Set up boat class
boat = class("Boat")
cannon = class("Cannon")

function makeBoat(speed, hp, can_left, can_right, x, y, team)
  local new_boat = class("Boat")
  new_boat.width = 50
  new_boat.team = team
  new_boat.height = 50
  new_boat.maxvel = 10*speed
  new_boat.angle = (-1 * team) * math.pi/2
  new_boat.hp = hp
  new_boat.x = x
  new_boat.y = y
  new_boat.sprite = boatsprite
  new_boat.cannons_left = can_left 
  new_boat.cannons_right = can_right
  return new_boat 
end

function gamescreen:enter(from)
  for i = 1,5 do
    Entities[i] = makeBoat(1, 10, 1, 1, 100 * i, 50, -1)
  end
end

function gamescreen:update()
  TEsound.cleanup()
end

function gamescreen:draw()
  draw(bg, 0, 0)
  draw(sm_flegs[selected], 920, 0)
  for i = 1, #Entities do
    local a = Entities[i]
    draw(a.sprite,a.x,a.y,a.angle)  
  end
end

function gamescreen:mousereleased(x, y, button)
end 


function button_clicked(mouseX, mouseY, rectX, rectY)
  x = rectX <= mouseX and mouseX <= rectX + 100
  y = rectY <= mouseY and mouseY <= rectY + 100
  return x and y
end

return gamescreen

