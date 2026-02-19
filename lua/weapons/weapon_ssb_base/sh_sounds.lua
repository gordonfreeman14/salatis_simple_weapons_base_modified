
function SWEP:ReloadSound()
    local ply = self:GetOwner()
    for k,v in pairs(self.ReloadSounds) do
        if istable(k) then return end
        timer.Create(k.."snd"..self:EntIndex(),tonumber( k, 10 ) or 0.1,1,function()
            if self:IsValid() and ply:GetActiveWeapon():GetClass() == self:GetClass() then
                if v[1] then
                    self:EmitSound(v[1])
                end
            end
        end)
    end
end