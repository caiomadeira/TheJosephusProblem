-- test file
angle = 0
rotationCircle = 0
rotationArrow = 0
--------------------------------
-- SCREEN PROPERTIES
wid = love.graphics.getWidth()
hei = love.graphics.getHeight()
--------------------------------
-- SQUARE PROPERTIES

mainSquare = {
    posX = wid / 4.5,
    posY = 0,

    squareWid = hei,
    squareHei = hei,
}
--------------------------------
-- MINOR CIRCLE ROTATION BOLL VALUES
turns = 0
pause = false

checkpoint0 = false
checkPoint1 = false
checkPoint2 = false
checkPoint3 = false
checkPoint4 = false
checkPoint5 = false
checkPoint6 = false
checkPoint7 = false
checkPoint8 = false
checkPoint9 = false


-------------------------------
function love.load()
    
    arrow = love.graphics.newImage("testArrow.png")
    love.filesystem.setIdentity('./');

end

function love.update(dt)


    -- arrow rotation
    -- angle is incremented according to delta time
    angle = angle + dt


    circleInitialX = wid / 2
    circleInitialY = hei / 2
    distanceXFromArrow = circleInitialY
    distanceYFromArrow = circleInitialY
    cX, cY = circleInitialX + math.cos(angle) * distanceXFromArrow, circleInitialY + math.sin(angle) * distanceYFromArrow 
    cX_Formatted = string.format("%2.0f", cX)
    cY_Formatted = string.format("%2.0f", cY)
    rotationArrow = rotationArrow + 1 * dt -- girando em sentido horario
    
-- math.floor(x) - Returns the largest integer smaller than or equal to x.

end

function love.draw()
     --  background color
     red = 40/255
     green = 27/255
     blue = 135/255
     alpha = 50/100
     love.graphics.setBackgroundColor(red, green, blue, alpha)
    --------------------------------------------

    love.graphics.print("square pos x:" .. mainSquare.posX, 0, 0)
    love.graphics.print("square pos y:" .. mainSquare.posY, 0, 15)

    love.graphics.print("square wid: " .. mainSquare.squareWid, 0, 30)
    love.graphics.print("square hei: " .. mainSquare.squareHei, 0, 45)

    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", mainSquare.posX, mainSquare.posY, mainSquare.squareWid, mainSquare.squareHei)


    r = mainSquare.squareHei / 2
    love.graphics.setColor(255,255,255) -- reset colours
    love.graphics.print("radius: " .. r, 0, 60)

    mainCircle = {
        posX = wid / 2,
        posY = mainSquare.squareHei / 2,
        radius = r
    }

     -- MAIN CIRCLE SETTINGS
    love.graphics.print("MAIN CIRCLE: PosX: " .. mainCircle.posX .. "\nMAIN CIRCLE: PosY: " .. mainCircle.posY .. "\nMAIN CIRCLE RADIUS: " .. mainCircle.radius, wid - 200, 0)
    love.graphics.circle("line", mainCircle.posX, mainCircle.posY, mainCircle.radius)

    -- ARROW SETTINGS
    love.graphics.print("arrow rotation: " .. rotationArrow, 0, 75)
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill", cX, cY, 20)
    love.graphics.setColor(255,255,255) -- reset colours

    arrowObj = {
        posX  = circleInitialX,
        posY = circleInitialY,
        widthCentralized = arrow:getWidth() / 2, 
        heightCentralized = arrow:getHeight() / 2
    }

    love.graphics.print("ARROW: PosX: " .. arrowObj.posX .. "\nARROW: PosY: " .. arrowObj.posY .. "\nARROW WIDTH / 2: " .. arrowObj.widthCentralized .. "\nARROW HEIGHT / 2: " .. arrowObj.heightCentralized, wid - 200, 100)
    love.graphics.draw(arrow, arrowObj.posX, arrowObj.posY, rotationArrow, 1, 1, arrowObj.widthCentralized, arrowObj.heightCentralized)


    love.graphics.print("-----------------------------------------", 0, 85)
    love.graphics.print("circle X formatted: " .. cX_Formatted .. " | circle X huge: " .. cX, 0, 95)
    love.graphics.print("circle Y formatted: " .. cY_Formatted .. " | circle Y huge: " .. cY, 0, 110)
----------------------------------------------------
-- checkpoint 0
----------------------------------------------------
    
    if math.floor(rotationArrow) == 0 then
        checkpoint0 = true
        love.graphics.print("INIT", 0 , 700)
    end

    if checkpoint0 == true then
        love.graphics.circle("fill",  mainSquare.squareWid, mainSquare.squareHei / 2 , 20)
    end

----------------------------------------------------
-- checkpoint 1
----------------------------------------------------
    if (math.floor(cY) == 0) then
        checkPoint1 = true      
        turns = math.floor(turns + 1)
        love.graphics.print("CHECKPOINT", 0 , 700)
    end

    if checkPoint1 == true then 
        love.graphics.setColor(0,255,0)
        love.graphics.circle("fill",  wid / 2, 0, 20)
        love.graphics.setColor(255,255,255) -- reset colours 
    end
----------------------------------------------------
-- checkpoint 2
----------------------------------------------------
    if (math.floor(cY) == 0) then
        checkPoint2 = true      
        love.graphics.print("CHECKPOINT", 0 , 700)
    end

    if checkPoint2 == true then 
        love.graphics.circle("fill", mainSquare.squareWid, mainSquare.squareHei, 20)
    end
----------------------------------------------------
-- checkpoint 3
----------------------------------------------------
if (math.floor(cY) == 0) then
    checkPoint2 = true      
    love.graphics.print("CHECKPOINT", 0 , 700)
end

if checkPoint2 == true then 
    love.graphics.circle("fill", mainSquare.squareWid, mainSquare.squareHei, 20)
end

----------------------------------------------------
-- FINAL TURN
----------------------------------------------------

    if turns >= 27 then
        love.event.quit()
    end
    
    love.graphics.print("Turns: " .. turns, 0, 200)

end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        pause = true
        
        while pause == true do
            love.event.wait()
        end
    elseif button == 2 then
        pause = false
        love.run()
    end
 end
