SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "SIG P220 - OD"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Pistol chambered in 9x19. 10 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.CSMuzzleFlashes = true
SWEP.CSMuzzleX = false
SWEP.ViewModelFOV = 80

SWEP.ViewModel				= "models/weapons/c_doge_pist_p220_grn.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_p228.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 1

------------------------------------------

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x19pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 18
SWEP.Primary.Spread = 9
SWEP.Primary.Sound = "weapons/DOGE_P220/Fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 10
SWEP.ReloadTime = 2.4
SWEP.ShootWait = 0.12
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"weapons/doge_shared/Draw_start.wav"}
}
SWEP.DrawSounds = {

}

SWEP.DeployPunch = Angle(0.5,-0.5,0)

SWEP.ReloadingViewBob = {
    [0.1] = {Angle(5,0,1)},
	[0.7] = {Angle(3,-4,0)},
    [1.3] = {Angle(-5,-6,0)},
	[2.2] = {Angle(6,2,0)}
}

SWEP.HoldType = "revolver"

--SWEP.IronSightsPos = Vector(-2.641, -4, 0.839)
--SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.IronRight = -2.641
SWEP.IronUp = 0.77
SWEP.IronAng = Angle(0, 0, 0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.dwsPos = Vector(0,25,15)