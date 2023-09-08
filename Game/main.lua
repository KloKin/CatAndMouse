function love.load()
    
    love.window.setTitle('2 player cat and mouse')
    --backdrop white
    love.graphics.setBackgroundColor( 0, 0, 0)


    p1x = 30    
    p1y = 30
    p1xOld = 30
    p1yOld = 30

    p2x = 150
    p2y = 150
    p2xOld = 150
    p2yOld = 150

    colliding = false

    p1speed = 100
    p2speed = 80
    running = false
    stamina = 3.5

    corner1 = {0,  0,   0,   0,  775, 0,   0,   575, 400, 200, 465, 300}
    corner2 = {25, 600, 800, 25, 800, 600, 800, 600, 450, 400, 520, 305}

end


function love.update(dt)

    function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
        return x1 < x2+w2 and
               x2 < x1+w1 and
               y1 < y2+h2 and
               y2 < y1+h1
    end

    if CheckCollision(p1x,p1y,10,10, p2x,p2y,20,20) then

        p1x = 30
        p1y = 30
        stamina = 3.5
    
    end

    if love.keyboard.isDown("right") then
       p1x = p1x + (p1speed * dt)
    end

    if love.keyboard.isDown("left") then
        p1x = p1x + (p1speed * -dt)
    end

    if love.keyboard.isDown("down") then
        p1y = p1y + (p1speed * dt)
    end
    
    if love.keyboard.isDown("up") then
        p1y = p1y + (p1speed * -dt)
    end


    if love.keyboard.isDown("d") then
        p2x = p2x + (p2speed * dt)
    end

    if love.keyboard.isDown("a") then
         p2x = p2x + (p2speed * -dt)
    end

    if love.keyboard.isDown("s") then
         p2y = p2y + (p2speed * dt)
    end

    if love.keyboard.isDown("w") then
         p2y = p2y + (p2speed * -dt)
    end

    for count = 1, #corner1, 2 do 
        if CheckCollision(p1x,p1y,10,10, corner1[count], corner1[count + 1], corner2[count] - corner1[count], corner2[count + 1] - corner1[count + 1]) then
            p1x = p1xOld
            p1y = p1yOld
        end
    end 

    for count = 1, #corner1, 2 do 
        if CheckCollision(p2x,p2y,20,20, corner1[count], corner1[count + 1], corner2[count] - corner1[count], corner2[count + 1] - corner1[count + 1]) then
            p2x = p2xOld
            p2y = p2yOld
        end
    end 

    running = false
    p2speed = 60
    p1xOld = p1x
    p1yOld = p1y
    p2xOld = p2x
    p2yOld = p2y

    if love.keyboard.isDown("space") and stamina > 0 then
        running = true
        p2speed = 160
        stamina = stamina - 2 * dt
    else if not love.keyboard.isDown("space") then
        stamina = stamina + 1 * dt
        if stamina > 3.5 then
            stamina = 3.5
        end
    end

    

end 
end

function love.draw()
    --blocks black
    love.graphics.setColor(1, 1, 1)
    for count = 1, #corner1, 2 do 
        love.graphics.rectangle ("fill", corner1[count], corner1[count + 1], corner2[count] - corner1[count], corner2[count + 1] - corner1[count + 1], 2, 2, 1)
    end 
    --player 1 blue
    love.graphics.setColor(0, 0, 0.4)
    love.graphics.rectangle("fill", p1x, p1y, 10, 10, 2, 2, 1)
    --player 2 red
    love.graphics.setColor(0.4, 0, 0)
    love.graphics.rectangle("fill", p2x, p2y, 20, 20, 4, 4, 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(math.floor(stamina * 5), p2x, p2y - 20)
    
    
end