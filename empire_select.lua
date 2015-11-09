require 'TEsound'

local empire_select = {} 
local audiodir = "assets/"
local imagedir = "assets/"
local image = love.graphics.newImage
local draw  = love.graphics.draw
local flegdir = imagedir .. "flegs/"
local anthemdir = audiodir .. "anthems/"

local bg = image(imagedir .. "union_flag.jpg")

local names = {"Britain", "France", "Spain", "Portugal", "Netherlands"}
local bg_flegs = {image(flegdir .. "union_flag_bg.jpg"), 
                  image(flegdir .."france_bg.png"),
                  image(flegdir .. "spain_bg.png"), image(flegdir.."portugal_bg.png"),
                  image(flegdir.."holland_bg.png")}

local sm_flegs = {image(flegdir.."union_flag_sm.jpg"), image(flegdir.."france_sm.png"),
                  image(flegdir.."spain_sm.png"), image(flegdir.."portugal_sm.png"),
                  image(flegdir.."holland_sm.png")}

local backing = image(flegdir .. "flag_backing.png")

local anthems = {"British-Grenadiers.mp3", "France.mp3", "Spain.mp3", "Portugal.mp3",
                "Netherlands.mp3"}

local selected = 1
local last_sel = 1


function empire_select:enter(from)
  love.graphics.clear()
  TEsound.playLooping(audiodir .. "British-Grenadiers.mp3", "theme")
end

function empire_select:update()
  TEsound.cleanup()
end

function empire_select:draw()
  draw(bg_flegs[selected], 0, 0)
  for i = 1,5 do
    if i == selected then
      draw(backing, 200 * (i-1) + 50, 320)
    end
    draw(sm_flegs[i], 200*(i-1) + 65, 335)
    love.graphics.print(names[i], 200*(i-1) + 75, 440)
  end
end


function empire_select:mousereleased(x, y, button)
  if love.mouse.getY() > 335 and love.mouse.getY() < 435 then
    selected = math.floor((love.mouse.getX() - 75) / 200) + 1
    if selected ~= last_sel then
      TEsound.stop("theme")
      TEsound.playLooping(anthemdir .. anthems[selected], "theme")
      last_sel = selected
    end
  end  
end

function empire_select:keypressed(key, isrepeat)
  if isrepeat then return end
  if key == "left" then
    selected = selected - 1
    if selected == 0 then selected = 5 end
  end
  if key == "right" then
    selected = (selected + 1)%6
    if selected == 0 then selected = 1 end
  end
  if selected ~= last_sel then
      TEsound.stop("theme")
      TEsound.playLooping(anthemdir .. anthems[selected], "theme")
      last_sel = selected
 end 
end  


function button_clicked(mouseX, mouseY, rectX, rectY)
  x = rectX <= mouseX and mouseX <= rectX + 100
  y = rectY <= mouseY and mouseY <= rectY + 100
  return x and y
end

return empire_select

