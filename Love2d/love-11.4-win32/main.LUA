WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

SPEED = 0.75
FRICTION = 0.9


function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
-- initialize var
	playerX = 0
    playerY = 0

    playerXVelocity = 0
    playerYVelocity = 0

    love.window.setTitle('holy crap lois it actually works')


end
function love.update(dt)
-- movement, friction, and positioning
    if love.keyboard.isDown('down') then
        playerYVelocity = playerYVelocity + SPEED
    elseif love.keyboard.isDown('up') then
        playerYVelocity = playerYVelocity + -SPEED
    end

    playerYVelocity = playerYVelocity * FRICTION
    playerY = playerY + playerYVelocity

    if love.keyboard.isDown('right') then
        playerXVelocity = playerXVelocity + SPEED
    elseif love.keyboard.isDown('left') then
        playerXVelocity = playerXVelocity + -SPEED
    end

    playerXVelocity = playerXVelocity * FRICTION
    playerX = playerX + playerXVelocity

end
function love.draw()
	-- draw char

    love.graphics.rectangle("fill", playerX, playerY, 20, 20)
    
    
    
end 
end <eof>
