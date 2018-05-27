function love.load()
    love.window.setMode(500, 260) 

    
    front = true
    
    joy = nil
    
    config = true
    
    tic = 0
    
    a = {}
    a.normal = love.graphics.newImage("/sprites/a1.png")
    a.press = love.graphics.newImage("/sprites/a2.png")
    a.state = a.normal
    
    b = {}
    b.normal = love.graphics.newImage("/sprites/b1.png")
    b.press = love.graphics.newImage("/sprites/b2.png")
    b.state = b.normal
    
    x = {}
    x.normal = love.graphics.newImage("/sprites/x1.png")
    x.press = love.graphics.newImage("/sprites/x2.png")
    x.state = x.normal
    
    y = {}
    y.normal = love.graphics.newImage("/sprites/y1.png")
    y.press = love.graphics.newImage("/sprites/y2.png")
    y.state = y.normal
    
    text = love.graphics.newImage("/sprites/text.png")
    
    pad = love.graphics.newImage("/sprites/pad.png")
    no_focus = love.graphics.newImage("/sprites/No_Focus.png")
end

function love.update()
    tic = tic + 1
    
    if (tic >= 60) then tic = 0 end
end

function love.draw()
    love.graphics.setColor(255, 0, 255)
    love.graphics.rectangle("fill", 0, 0, 500, 260)
    
    love.graphics.setColor(255, 255, 255)
    
    if not config then
        love.graphics.draw(b.state, 420, 90)
        love.graphics.draw(x.state, 260, 90)
    
        love.graphics.draw(y.state, 340, 5)
        love.graphics.draw(a.state, 340, 175)
    
        local joysticks = love.joystick.getJoysticks()
        for i, joystick in ipairs(joysticks) do
            if (joystick:getName() == joy) then
                joyx = joystick:getAxis(1)
                joyy = joystick:getAxis(2)
        
                love.graphics.draw(pad, 50 + joyx * 40, 50 + joyy * 40)
            end
        end
    else
        love.graphics.draw(text, 118, 50)
        if (tic <= 30) then
            love.graphics.draw(a.normal, 213, 90)
        elseif (tic > 30) then
            love.graphics.draw(a.press, 213, 90)
        end
    end
    
    if (front == false) then
        love.graphics.draw(no_focus, 190, 80) 
    end
end

function love.gamepadpressed(joystick, button)
    if (button == "b") then
        if (config) then
            joy = joystick:getName()
            config = false
        else
            b.state = b.press
        end
    end
    
    if (button == "x") then
        if (config) then
            joy = joystick:getName()
            config = false
        else
            x.state = x.press
        end
    end
    
    if (button == "y") then
        if (config) then
            joy = joystick:getName()
            config = false
        else
            y.state = y.press
        end
    end
    
    if (button == "a") then
        if (config) then
            joy = joystick:getName()
            config = false
        else
            a.state = a.press
        end
    end
end

function love.gamepadreleased(joystick, button)
    if (button == "b") then
        b.state = b.normal
    end
    
    if (button == "x") then
        x.state = x.normal
    end
    
    if (button == "y") then
        y.state = y.normal
    end
    
    if (button == "a") then
        a.state = a.normal
    end
end

function love.focus(f)
    if f then
        front = true
    else
        front = false
        love.window.requestAttention(false)
    end
end

function love.keypressed( key, scancode, isrepeat )
    if (key == "c") then
        config = true
    end
end