SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "MR96"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Revolver chambered in .357 Magnum. 6 round cylinder."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_pist_jeagle.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_jeagle.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 55
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb2/weapons/matebahomeprotection/deagle-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 65
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.46
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"pwb2/weapons/matebahomeprotection/mateba_clipout.wav"},
    [0.6] = {"pwb2/weapons/matebahomeprotection/mateba_bullets.wav"},
    [1.2] = {"pwb2/weapons/matebahomeprotection/mateba_clipin.wav"},
    [1.75] = {"pwb2/weapons/matebahomeprotection/mateba_clipback.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/usptactical/cloth.wav"}
}
SWEP.DeployPunch = Angle(0.5,-0.5,0)
SWEP.ReloadingViewBob = {
    [0.1] = {Angle(-1,3,2)},
    [0.6] = {Angle(3,-0.5,-1)},
    [1.2] = {Angle(-2,-0.5,-1)},
    [1.75] = {Angle(2,-4,-1)},
}

SWEP.HoldType = "revolver"

SWEP.IronRight = -1.73
SWEP.IronUp = 0.35
SWEP.IronAng = Angle(0,0,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)

if CLIENT then
    local WorldModel = ClientsideModel(SWEP.WorldModel)
    
        -- Settings...
        WorldModel:SetSkin(1)
        WorldModel:SetNoDraw(true)
    
        function SWEP:DrawWorldModel()
            local _Owner = self:GetOwner()
    
            if (IsValid(_Owner)) then
                -- Specify a good position
                local offsetVec = Vector(-1,0,0)
                local offsetAng = Angle(2, -5, 180)
                
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