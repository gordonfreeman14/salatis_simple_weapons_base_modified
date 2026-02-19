SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "M16A2"
SWEP.Author 				= "gordon freeman"
SWEP.Instructions			= "Sniper chambered in 5.56x45mm. 30 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_snip_sg550_ssb.mdl"
SWEP.WorldModel				= "models/weapons/w_snip_sg550_ssb.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "556rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 38
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/sg550_ssb/sg550-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 20
SWEP.ReloadTime = 4
SWEP.ShootWait = 0.2
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.2] = {"pwb2/weapons/m4super90/cloth1.wav"},
    [0.6] = {"weapons/sg550_ssb/magout.wav"},
	[1.6] = {"weapons/sg550_ssb/magin.wav"},
    [2.2] = {"weapons/sg550_ssb/boltback.wav"},
    [2.7] = {"weapons/sg550_ssb/boltforward.wav"},
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m4super90/cloth2.wav"},
}
SWEP.DeployPunch = Angle(5,0.9,0)
SWEP.ReloadingViewBob = {
    [0.1] = {Angle(5,0,2)},
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