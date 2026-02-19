SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "GSh-18"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Pistol chambered in 9x19. 18 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.ViewModelFOV = 70

SWEP.ViewModel				= "models/weapons/c_doge_pist_gsh18.mdl"
SWEP.WorldModel				= "models/weapons/w_doge_pist_gsh18.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 36
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 12
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/DOGE_GSH18/fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 1.9
SWEP.ShootWait = 0.12
SWEP.NextShot = 0

SWEP.ReloadSounds = {
}

SWEP.DrawSounds = {
}

SWEP.DeployPunch = Angle(0.5,-0.5,0)

SWEP.ReloadingViewBob = {
    [0.2] = {Angle(2,0,1)},
	[1.0] = {Angle(2,0.8,0)},
	[1.3] = {Angle(-2,0.8,0)},
	[1.4] = {Angle(-3,1.8,1)},
	[1.9] = {Angle(-1,1,1)},
}

SWEP.Supressed = false

SWEP.HoldType = "revolver"

SWEP.IronSightsPos = Vector(-2.25, -10.653, 0.93)
SWEP.IronSightsAng = Vector(0, -4.1, -0.704)

SWEP.IronRight = -3
SWEP.IronUp = 1.04
SWEP.IronAng = Angle(0, -5, 0)

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
			local offsetVec = Vector(-0.5, -0.5, 0.5)
			local offsetAng = Angle(180, 180, 0)
			
			local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
			if !boneid then return end

			local matrix = _Owner:GetBoneMatrix(boneid)
			if !matrix then return end

			local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())

			WorldModel:SetPos(newPos)
			WorldModel:SetAngles(newAng)

            WorldModel:SetupBones()
		else
			WorldModel:SetPos(self:GetPos())
			WorldModel:SetAngles(self:GetAngles())
		end

		WorldModel:DrawModel()
	end
end