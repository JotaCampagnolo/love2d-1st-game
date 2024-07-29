-- This is a core function of Love2D.
-- ... It is responsible for the initial loading.
function love.load()
    -- Importing the <anim8> library:
    anim8 = require 'libs/anim8'
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Importing the <sti> library:
    sti = require 'libs/sti'
    gameMap = sti('maps/map1.lua')
    -- Player table declaration:
    player = {}
    player.posX = 10 -- This is the player position at X axis.
    player.posY = 10 -- This is the player position at Y axis.
    player.speed = 0.1 -- This si the player speed.
    player.isMoving = false
    player.direction = -1
    player.spriteSheet = love.graphics.newImage('sprites/characters/swordman.png')
    player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
    player.animations = {}
    player.animations.idleLeft = anim8.newAnimation(player.grid('1-4', 1), 0.1):flipH()
    player.animations.idleRight = anim8.newAnimation(player.grid('1-4', 1), 0.1)
    player.animations.walkLeft = anim8.newAnimation(player.grid('1-6', 2), 0.1):flipH()
    player.animations.walkRight = anim8.newAnimation(player.grid('1-6', 2), 0.1)
    player.anim = player.animations.idleLeft
end

-- This is a core function of Love2D.
-- ... It is responsible for the game loop update logic.
function love.update(dt)
    -- By default, palyer is never moving:
    player.isMoving = false
    -- Dealing with player movement through keyboard keys:
    if love.keyboard.isDown("d") then
        player.direction = 1
        player.posX = player.posX + (player.speed * player.direction)
        player.isMoving = true
    end
    if love.keyboard.isDown("a") then
        player.direction = -1
        player.posX = player.posX + (player.speed * player.direction)
        player.isMoving = true
    end
    if love.keyboard.isDown("w") then
        player.posY = player.posY - player.speed
        player.isMoving = true
    end
    if love.keyboard.isDown("s") then
        player.posY = player.posY + player.speed
        player.isMoving = true
    end
    if player.isMoving then
        if player.direction >= 0 then
            player.anim = player.animations.walkRight
        else
            player.anim = player.animations.walkLeft
        end
    end
    if not player.isMoving then
        if player.direction >= 0 then
            player.anim = player.animations.idleRight
        else
            player.anim = player.animations.idleLeft
        end
    end
    -- Updating the player animation:
    player.anim:update(dt)
end

-- This is a core function of Love2D.
-- ... It is responsible for the game loop drawing to screen logic.
function love.draw()
    -- This adjust the game view scale.
    love.graphics.scale(4, 4)
    -- Drawing the game map:
    gameMap:draw(nil, nil, 4, 4)
    -- Drawing the player as a circle:
    player.anim:draw(player.spriteSheet, player.posX, player.posY)
end