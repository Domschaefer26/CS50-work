

PauseState = Class {__includes = BaseState}


local gamePaused = false

function PauseState.update( dt )
	if love.keyboard.wasPressed ('p') and gamePaused then
		gamePaused = false
		gStateMachine:change('play')
		return
	end
	if love.keyboard.wasPressed ('p') and not gamePaused then
		gamePaused = true
		gStateMachine:change('pause')
	end


end
