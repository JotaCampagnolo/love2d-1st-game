-- This is a core function of Love2D.
-- ... It is responsible for the initial loading.
function love.load()
    -- Player table declaration:
    player = {
        posX = 400, -- This is the player position at X axis.
        posY = 200, -- This is the player position at Y axis.
        speed = 1 -- This si the player speed.
    }
end

-- This is a core function of Love2D.
-- ... It is responsible for the game loop update logic.
function love.update(dt)
    -- Dealing with player movement through keyboard keys:
    if love.keyboard.isDown("d") then
        player.posX = player.posX + player.speed
    end
    if love.keyboard.isDown("a") then
        player.posX = player.posX - player.speed
    end
    if love.keyboard.isDown("w") then
        player.posY = player.posY - player.speed
    end
    if love.keyboard.isDown("s") then
        player.posY = player.posY + player.speed
    end
end

-- This is a core function of Love2D.
-- ... It is responsible for the game loop drawing to screen logic.
function love.draw()
    -- Drawing the player as a circle:
    love.graphics.circle("fill", player.posX, player.posY, 25)
end