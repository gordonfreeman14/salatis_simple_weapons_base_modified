SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Remington 870"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Shotgun chambered in 12/70 buckshot. 6 round tube."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_shot_m3juper90.mdl"
SWEP.WorldModel				= "models/weapons/w_shot_m3juper90.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "1270buck"
SWEP.Primary.Cone = 0.08
SWEP.Primary.Damage = 20
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "snd_jack_hmcd_sht_close.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_sht_far.wav"
SWEP.Primary.Force = 125
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 1.1
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.2] = {"pwb2/weapons/m4super90/cloth1.wav"},
    [0.6] = {"pwb2/weapons/m4super90/shell.wav"},
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m4super90/cloth2.wav"},
}
SWEP.DeployPunch = Angle(0.9,0.9,0)


SWEP.NumBullet = 12

SWEP.HoldType = "shotgun"

SWEP.IronRight = -1.95
SWEP.IronUp = 1.1
SWEP.IronForward = -1.5
SWEP.IronAng = Angle(-0.5,0.1,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)

SWEP.Pump = true 
SWEP.Pumpsound = "snd_jack_hmcd_shotpump.wav"
SWEP.Shotgun = true

if CLIENT then
    local WorldModel = ClientsideModel(SWEP.WorldModel)
    
        -- Settings...
        WorldModel:SetSkin(1)
        WorldModel:SetNoDraw(true)
    
        function SWEP:DrawWorldModel()
            local _Owner = self:GetOwner()
    
            if (IsValid(_Owner)) then
                -- Specify a good position
                local offsetVec = Vector(0,-0.5,0.7)
                local offsetAng = Angle(0, -2, 180)
                
                local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
                if !boneid then return end
    
                local matrix = _Owner:GetBoneMatrix(boneid)
                if !matrix then return end
    
                local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())
    
                WorldModel:SetPos(newPos)
                WorldModel:SetAngles(newAng)
                WorldModel:SetModelScale(1)
    
                WorldModel:SetupBones()
            else
                WorldModel:SetPos(self:GetPos())
                WorldModel:SetAngles(self:GetAngles())
            end
    
            WorldModel:DrawModel()
        end
    end