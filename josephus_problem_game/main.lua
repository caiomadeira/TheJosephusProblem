-- Note: ALT + L for run in VSCode on Windows
-- Has been three main functions thats make your love2d project works
-- Load, Update and Draw

function getMousePosition()
    x = love.mouse.getX()
    y = love.mouse.getY()
    return x, y 
end

function getScreenSize()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    return width, height
end

-- is the main function for the game. This function runs when the project start and her we put the locals variables, for example.
function love.load()

    number = 0

    player = loadTestAsset("arrow")
    shoot = loadTestAsset("shoot")

    w, h = getScreenSize() -- multiples values in return, so atribute two variables
    
    -- obj personagem
    character = { x = w / 2, y = h / 2}
    projectile = {x = character.x, y = character.y, posX = 0, posY = 0, rotationProj = 0}

    direction = false
    keepDirection = true

end

-- our game loop
function love.update(dt)
    number = number + 1
    --------------------------------------
-- math.atan2 - calcule the angule of the player and projectile
    -------------------------------------
    w, h = getScreenSize()
    mX, mY = getMousePosition() 

    mouseX = mX - w / 2
    mouseY = mY - h / 2

    angle = math.atan(mouseY, mouseX)

    if direction and keepDirection then
        projectile.x = projectile.x + projectile.posX * dt
        projectile.y = projectile.y + projectile.posY * dt
    else
        projectile.x = character.x
        projectile.y = character.y
        projectile.rotationProj = angle
    end

    if projectile.x > w or projectile.x < 0 or projectile.y > h or projectile.y < 0 then
        direction = false
        keepDirection = true
    end
end

-- our graphic of the project

function love.draw()
    debug()
    -- The projectile img is rendering first, so that the img stay below the player
    love.graphics.draw(shoot, projectile.x, projectile.y, projectile.rotationProj, 1, 1, -20, shoot:getHeight() / 2)
    -- The player img
    love.graphics.draw(player, character.x, character.y, angle, 1, 1, player:getWidth() / 2, player:getHeight() / 2)

end

function love.keyreleased(key)
   
    if key == "a" and not direction then
        projectile.posX = math.cos(angle) * 900
        projectile.posY = math.sin(angle) * 900
        direction = true
    end

end

-- debug methods 
function debug()
    love.graphics.print("Player Angle: " .. angle, 0, 10)
    love.graphics.print("FPS: " .. number, 0, 30)

end

function loadTestAsset(typeAsset)

    if (typeAsset == "player" and type(typeAsset) == "string") then
        player = love.graphics.newImage("resources/assets/testAssets/testPlayer.png")
        return player

    else if (typeAsset == "shoot" and type(typeAsset) == "string") then
        shoot = love.graphics.newImage("resources/assets/testAssets/testShoot.png")
        return shoot
    else if (typeAsset == "arrow" and type(typeAsset) == "string") then
        shoot = love.graphics.newImage("resources/assets/testAssets/testArrow.png")
        return shoot
    else
        love.graphics.print("Error: type of test asset is not string")
    end
    end
    end
end
