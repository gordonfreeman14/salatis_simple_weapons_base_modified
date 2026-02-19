SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Kar98k"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Sniper chambered in 7.92mm. 5 round clips."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_snip_jwp.mdl"
SWEP.WorldModel				= "models/weapons/w_snip_jwp.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

SWEP.ViewModelFlip = true

------------------------------------------

SWEP.Primary.ClipSize		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "792sni"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 125
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "snd_jack_hmcd_snp_close.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 155
SWEP.ReloadTime = 4
SWEP.ShootWait = 1.5
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"snd_jack_hmcd_boltreload.wav"},
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m4super90/cloth2.wav"},
}
SWEP.DeployPunch = Angle(5,0.9,0)
SWEP.ReloadingViewBob = {
    [0.1] = {Angle(5,0,2)},
    [0.4] = {Angle(-2,0,-2)},
    [0.6] = {Angle(2,1,-2)},
    [1.2] = {Angle(2,1,-2)},
    [2] = {Angle(2,1,-2)},
    [2.2] = {Angle(2,1,-2)},
    [2.3] = {Angle(2,1,-2)},
    [2.4] = {Angle(2,1,-2)},
    [2.6] = {Angle(2,1,-2)},
    [3] = {Angle(-2,1,2)},
    [3.5] = {Angle(3,4,2)},
    [4] = {Angle(2,-2,-2)},
}

SWEP.HoldType = "ar2"

SWEP.IronRight = -1.82
SWEP.IronUp = 1.25
SWEP.IronForward = -1
SWEP.IronAng = Angle(0,0,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)

SWEP.Pump = true 
SWEP.Pumpsound = "snd_jack_hmcd_boltcycle.wav"

SWEP.Scope = true 
SWEP.ScopeMult = 5
SWEP.ScopeMat = Material("sprites/mat_jack_hmcd_scope_diffuse")

if CLIENT then
local WorldModel = ClientsideModel(SWEP.WorldModel)

	-- Settings...
	WorldModel:SetSkin(1)
	WorldModel:SetNoDraw(true)

	function SWEP:DrawWorldModel()
		local _Owner = self:GetOwner()

		if (IsValid(_Owner)) then
            -- Specify a good position
			local offsetVec = Vector(-2,-1,0)
			local offsetAng = Angle(5, 0, 180)
			
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