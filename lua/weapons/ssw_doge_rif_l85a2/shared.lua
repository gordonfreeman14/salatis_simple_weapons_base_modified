SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "L85A2"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Rifle chambered in 5.56x45. 30 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.CSMuzzleFlashes = true
SWEP.CSMuzzleX = true
SWEP.ViewModelFOV = 80

SWEP.ViewModel				= "models/weapons/c_doge_rif_l85a2.mdl"
SWEP.WorldModel				= "models/weapons/w_doge_rif_l85a2.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 1

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "556rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 20
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/DOGE_L85A2/Fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 18
SWEP.ReloadTime = 3.4
SWEP.ShootWait = 0.1
SWEP.NextShot = 0

SWEP.ReloadSounds = {
	[3.8] = {"weapons/doge_shared/Draw_end.wav"}
}

SWEP.DrawSounds = {

}

SWEP.DeployPunch = Angle(0.9,-0.9,0)

SWEP.ReloadingViewBob = {
	[0.1] = {Angle(3,3,0)},
	[0.6] = {Angle(9,3,0)},
	[1.0] = {Angle(3,3,0)},
	[1.7] = {Angle(2,2,0)},
	[1.9] = {Angle(-5,-3,2)},
	[3.0] = {Angle(3,3,3)},
	[3.3] = {Angle(-3,-3,-3)}
}


SWEP.HoldType = "ar2"

SWEP.IronSightsPos = Vector(-3.37, -0.403, -0.601)
SWEP.IronSightsAng = Vector(0.703, 0, 0)

SWEP.IronRight = -3.37
SWEP.IronUp = -0.601
SWEP.IronAng = Angle(-0.703, 0, 0)

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
			local offsetVec = Vector(-2, -1, -1)
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