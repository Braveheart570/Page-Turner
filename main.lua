if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
  end

print("hello World")

local page = {x=100,y=100,w=love.graphics.getWidth()-200,h=love.graphics.getHeight()-200}


 function love.draw()
    love.graphics.rectangle("line",page.x,page.y,page.w,page.h)
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