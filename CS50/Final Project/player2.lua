Player2 = {}

function Player2:load()
    self.x = 600
    self.y = 0
    self.width = 20
    self.height = 60
    self.xVel = 0
    self.yVel = 0
    self.maxSpeed = 200
    self.acceleration = 4200
    self.friction = 3500
    self.gravity = 300
    self.jumpAmount = -300
    self.attack_count = 0
    self.counter = 0
    
    self.direction = "right"
    self.state = "idel"

    self:loadSpirites()

    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
end

function Player2:loadSpirites()
    self.animation = {timer = 0, rate = 0.14}
    self.animation.move_right = {total = 6, current = 1, img = {}}
    for i = 1, self.animation.move_right.total do 
        self.animation.move_right.img[i] = love.graphics.newImage("Spirits/Player2/move_right/"..i..".png")
    end

    self.animation.jump = {total = 4, current = 1, img = {}}
    for i = 1, self.animation.jump.total do 
        self.animation.jump.img[i] = love.graphics.newImage("Spirits/Player2/jump/"..i..".png")
    end

    self.animation.attack_right = {total = 6, current = 1, img = {}}
    for i = 1, self.animation.attack_right.total do 
        self.animation.attack_right.img[i] = love.graphics.newImage("Spirits/Player2/attack_right/"..i..".png")
    end

    self.animation.defeat = {total = 6, current = 1, img = {}}
    for i = 1, self.animation.defeat.total do 
        self.animation.defeat.img[i] = love.graphics.newImage("Spirits/Player2/defeat/"..i..".png")
    end

    self.animation.idel = {total = 1, current = 1, img = {}}
    for i = 1, self.animation.idel.total do 
        self.animation.idel.img[i] = love.graphics.newImage("Spirits/Player2/idel/"..i..".png")
    end

    self.animation.draw = self.animation.move_right.img[1]
    self.animation.width = self.animation.draw:getWidth()
    self.animation.height = self.animation.draw:getHeight()
end

function Player2:update(dt)
    self:setState()
    self:setDirection()
    self:animate(dt)
    self:syncPhysics()
    self:move(dt)
    self:applyGravity(dt)
end

function Player2:setState()
    if self.y < 260 then
        self.state = "jump"
    elseif self.xVel == 0 then
        self.state = "idel"
    elseif self.attack_count == 1 then
        self.state = "attack_right"
    elseif self.xVel > 0 or self.xVel < 0 then
        self.state = "move_right"
    end
end
function Player2:setDirection()
    if self.xVel < 0 then
        self.direction = "left"
    elseif self.xVel > 0 then
        self.direction = "right"
    end
end

function Player2:animate(dt)
    self.animation.timer = self.animation.timer + dt
    if self.animation.timer > self.animation.rate then
        self.animation.timer = 0
        self:setNewFrame()
    end
end

function Player2:setNewFrame()
    local anim = self.animation[self.state]
    if anim.current < anim.total then
        anim.current = anim.current + 1
    else
        anim.current = 1
    end
    self.animation.draw = anim.img[anim.current]
end

function Player2:applyGravity(dt)
    self.yVel = self.yVel + self.gravity * dt

    if self.y > 281 then
        self.yVel = 0
    end
    if self.x < 12 then
        self.xVel = 0
        self.x = 18
        self:move(dt)
    end
    if self.x > 633 then 
        self.xVel = 0
        self.x = 629
        self:move(dt)
    end

    if self.y < 0 then 
        self.yVel = 0
        self.y = 30
        self.yVel = self.yVel + self.gravity * dt
        self:jump(key)
    end
end

function Player2:move(dt)
    if love.keyboard.isDown("l") then
        if self.xVel < self.maxSpeed then
            if self.xVel + self.acceleration * dt < self.maxSpeed then
                self.xVel = self.xVel + self.acceleration * dt
            else 
                self.xVel = self.maxSpeed
            end
        end
    elseif love.keyboard.isDown("j") then
        if self.xVel > -self.maxSpeed then
            if self.xVel - self.acceleration * dt > self.maxSpeed then
                self.xVel = self.xVel - self.acceleration * dt
            else 
                self.xVel = -self.maxSpeed
            end
        end
    else 
        self:applyFriction(dt)
    end 
end

function Player2:applyFriction(dt)
    if self.xVel > 0 then 
        if self.xVel - self.friction * dt > 0 then 
            self.xVel = self.xVel - self.friction * dt
        else 
            self.xVel = 0
        end
    elseif self.xVel < 0 then
        if self.xVel + self.friction * dt < 0 then
            self.xVel = self.xVel + self.friction * dt
        else 
            self.xVel = 0
        end 
    end
end

function Player2:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end    

function Player2:jump(key)
    if key == "i" then
        self.y = 269
        self.yVel = self.jumpAmount
    end
    
    if key == "k" then
        self.attack_count = 1
    end
    if key == "j" then
        self.attack_count = 0
    end
    if key == "l" then
        self.attack_count = 0
    end
    if self.xVel == 0 and key =="k" then
        self.attack_count = 1
    end
    print(self.attack_count)
end

function Player2:draw()
    local scaleX = 1
    if self.direction == "left" then
        scaleX = -1
    end
    love.graphics.draw(self.animation.draw, self.x, self.y, 0, scaleX, 1, self.animation.width / 2, self.animation.height / 2)
end