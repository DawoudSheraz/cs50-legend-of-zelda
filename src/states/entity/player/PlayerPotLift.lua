--[[
    Player state when lifting the pot
]]

PlayerPotLiftState = Class{__includes = BaseState}

function PlayerPotLiftState:init(player)
    self.player = player
end


function PlayerPotLiftState:update(dt)
    
    self.player:changeAnimation('pot-pick-' .. self.player.direction)

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerPotLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end