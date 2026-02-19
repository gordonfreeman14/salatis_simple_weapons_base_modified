SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Galil ACE 23"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Rifle chambered in 5.56x45. 35 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.CSMuzzleFlashes = true
SWEP.CSMuzzleX = true
SWEP.ViewModelFOV = 85

SWEP.ViewModel				= "models/weapons/c_doge_rif_ace23.mdl"
SWEP.WorldModel				= "models/weapons/w_doge_rif_ace23.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 1

------------------------------------------

SWEP.Primary.ClipSize		= 35
SWEP.Primary.DefaultClip	= 70
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "556rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 27
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/DOGE_ACE23/Fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 23
SWEP.ReloadTime = 2.3
SWEP.ShootWait = 0.08
SWEP.NextShot = 0

SWEP.ReloadSounds = {
    [0.1] = {"weapons/doge_shared/Draw_start.wav"},
	[3.0] = {"weapons/doge_shared/Draw_end.wav"}
}

SWEP.DrawSounds = {

}

SWEP.DeployPunch = Angle(0.9,-0.9,0)

SWEP.ReloadingViewBob = {
	[0.1] = {Angle(3,3,0)},
    [0.7] = {Angle(9,9,0)},
	[1.1] = {Angle(-1,-1,0)},
	[1.3] = {Angle(-4,-4,0)},
	[1.9] = {Angle(0,-3,2)},
	[2.3] = {Angle(0,2,-4)}
}


SWEP.HoldType = "ar2"

SWEP.IronSightsPos = Vector(-2.32, -1.005, 0.319)
SWEP.IronSightsAng = Vector(1.2, 0, 0)

SWEP.IronRight = -2.32
SWEP.IronUp = 0.319
SWEP.IronAng = Angle(-1.5, 0, 0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.dwsPos = Vector(0,45,15)

if CLIENT then
	local WorldModel = ClientsideModel(SWEP.WorldModel)

	-- Settings...
	WorldModel:SetSkin(1)
	WorldModel:SetNoDraw(true)

	function SWEP:DrawWorldModel()
		local _Owner = self:GetOwner()

		if (IsValid(_Owner)) then
            -- Specify a good position
			local offsetVec = Vector(-3, -1.5, 0)
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