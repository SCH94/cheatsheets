--[[
Lua programminng with Love
]]

message = "lua is awesome!"

function love.draw()
	love.graphics.setFont(love.graphics.newFont(30))
	love.graphics.print(message)
end
