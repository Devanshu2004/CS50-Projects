local STI = require("sti")
require("player")
require("player2")
love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    anim8 = require 'libraries/anim8'

	Map = STI("map/1.lua", {"box2d"})
	World = love.physics.newWorld(0,0)
	Map:box2d_init(World)
	Map.layers.solid.visible = false
	background = love.graphics.newImage("Spirits/background1.jpg")
	Player:load()
    Player2:load()
end

function love.update(dt)
	World:update(dt)
	Player:update(dt)
    Player2:update(dt)
end

function love.draw()
	love.graphics.draw(background)
	Map:draw(0, 0, 2, 2)

	love.graphics.push()
	love.graphics.scale(2,2)

    love.graphics.print("The first one to hit wins!", 250, 0)

	Player:draw()
    Player2:draw()

    if (Player2.x - Player.x < 25 and Player2.x - Player.x > 0) and (((Player.y - Player2.y < 65) and (Player.y - Player2.y > 0)) or ((Player2.y - Player.y < 65) and (Player2.y - Player.y > 0))) then
        if Player.attack_count == 1 then
            love.graphics.print("Player 1 has won!")
        elseif Player2.attack_count == 1 then
            love.graphics.print("Player 2 has won!", 530, 0)
        end
    elseif (Player.x - Player2.x < 25 and Player.x - Player2.x > 0) and (((Player.y - Player2.y < 65) and (Player.y - Player2.y > 0)) or ((Player2.y - Player.y < 65) and (Player2.y - Player.y > 0))) then
        if Player.attack_count == 1 then
            love.graphics.print("Player 1 has won!")
        elseif Player2.attack_count == 1 then
            love.graphics.print("Player 2 has won!", 530, 0)
        end
    end

	love.graphics.pop()

end

function love.keypressed(key)
    Player:jump(key)
    Player2:jump(key)
end