if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
  end

print("hello World")

local page = {x=100,y=100,w=love.graphics.getWidth()-200,h=love.graphics.getHeight()-200}
local corner = {x=100,y=100,r=0,xw=100,yw=100}

function love.update (dt)


    local x,y = love.mouse.getPosition()
    if x > page.x and y > page.y then
        corner.x = x
        corner.y = y
    end
    
    corner.xw = corner.x - page.x
    corner.yw = corner.y - page.y
end

 function love.draw()
    if corner.x > page.x and corner.y > page.y then
        love.graphics.line(corner.x,page.y,page.x + page.w,page.y)
        love.graphics.line(page.x,corner.y,page.x,page.y + page.h)
        love.graphics.line(corner.x,page.y,page.x,corner.y)
    else
        love.graphics.line(page.x,page.y,page.x+page.w,page.y)
        love.graphics.line(page.x,page.y,page.x,page.y + page.h)
    end
    
    love.graphics.line(page.x+page.w,page.y,page.x+page.w,page.y+page.h)
    love.graphics.line(page.x,page.y + page.h,page.x + page.w ,page.y + page.h)


    love.graphics.line(corner.x,corner.y,corner.x - corner.xw,corner.y)
    love.graphics.line(corner.x,corner.y,corner.x,corner.y - corner.yw)
    end


--sits at the bottom of our script
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end