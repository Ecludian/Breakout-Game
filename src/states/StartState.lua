StartState = Class{__includes = BaseState}

-- to know either "Start" or "High Scores" the player are highligthting
local highlighted = 1

function StartState:update(dt)
    -- toggle highlighted option if we press an arrow keys
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
        gSounds['paddle-hit']:play()
    end

    -- not global because its function differently
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    -- Title
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("BREAKOUT", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')

    -- Instructions
    love.graphics.setFont(gFonts['medium'])

    -- render the option blue
    if highlighted == 1 then
        love.graphics.setColor(103/255, 255, 255, 255)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 70, VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255, 255, 255, 255)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 255, 255, 255)
    end
    love.graphics.printf("HIGH SCORES", 0, VIRTUAL_HEIGHT / 2 + 90, VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(255, 255, 255, 255)
end
