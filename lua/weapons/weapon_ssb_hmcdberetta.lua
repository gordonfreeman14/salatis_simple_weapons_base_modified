SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Beretta"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Pistol chambered in 9x19. 15 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_pist_jivejeven.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_fiveseven.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

SWEP.ViewModelFlip = true

------------------------------------------

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 20
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "snd_jack_hmcd_smp_close.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 20
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.12
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"pwb/weapons/fnp45/cloth.wav"},
    [0.35] = {"pwb/weapons/fnp45/clipout.wav"},
    [1.2] = {"pwb/weapons/fnp45/clipin.wav"},
    [1.5] = {"pwb/weapons/fnp45/cloth.wav"},
    [1.8] = {"pwb/weapons/fnp45/sliderelease.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb/weapons/fnp45/draw.wav"}
}
SWEP.DeployPunch = Angle(0.5,-0.9,0.9)
SWEP.ReloadingViewBob = {
    [0.4] = {Angle(2,0,1)},
    [0.45] = {Angle(-1,0,-1)},
    [1.2] = {Angle(-1,0.5,-2)},
    [1.5] = {Angle(1,-0.5,1)},
    [1.8] = {Angle(-1,-1,1)},
}

SWEP.HoldType = "revolver"

SWEP.IronRight = -1.75
SWEP.IronUp = 1.12
SWEP.IronAng = Angle(0,0.08,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)

if CLIENT then
    local WorldModel = ClientsideModel(SWEP.WorldModel)
    
        -- Settings...
        WorldModel:SetNoDraw(true)
    
        function SWEP:DrawWorldModel()
            local _Owner = self:GetOwner()
    
            if (IsValid(_Owner)) then
                -- Specify a good position
                local offsetVec = Vector(3.5,-1,1.6)
                local offsetAng = Angle(5, 0, 180)
                
                local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
                if !boneid then return end
    
                local matrix = _Owner:GetBoneMatrix(boneid)
                if !matrix then return end
    
                local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())
    
                WorldModel:SetPos(newPos)
                WorldModel:SetAngles(newAng)
                WorldModel:SetModelScale(0.8)
    
                WorldModel:SetupBones()
            else
                WorldModel:SetPos(self:GetPos())
                WorldModel:SetAngles(self:GetAngles())
            end
    
            WorldModel:DrawModel()

        end
    end