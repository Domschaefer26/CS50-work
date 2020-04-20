--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
	
	-- Set medal achieved based on final Score
	-- 10 or less points earns a bronze medal
	if self.score <= 10 then
		self.image = love.graphics.newImage('bronzemedal.png')
		self.medal = 'BRONZE MEDAL!'
	end

	-- 10 to 50 points earns a silver medal
	if self.score > 10 then
		self.image = love.graphics.newImage('silvermedal.png')
		self.medal = 'SILVER MEDAL!'
	end

	-- Over 50 points earns you a gold medal
		if self.score > 50 then
		self.image = love.graphics.newImage('goldmedal.png')
		self.medal = 'GOLD MEDAL!'
	end


end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 40, VIRTUAL_WIDTH, 'center')
	love.graphics.printf(self.medal, 0, 95, VIRTUAL_WIDTH, 'center') -- write the medal earned words.
	love.graphics.draw(self.image, VIRTUAL_WIDTH/2-27, 135) -- draw the medal image below the words.

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 75, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end