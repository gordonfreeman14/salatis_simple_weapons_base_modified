SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Desert Eagle Dual"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Two pistols chambered in .357 Magnum. 18 round magazines."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.ViewModelFOV = 60

SWEP.ViewModel				= "models/weapons/c_Doge_pist_dual_deagles.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_deagle.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------



------------------------------------------

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 36
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 49
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/deagle/fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 125
SWEP.ReloadTime = 3.3
SWEP.ShootWait = 0.2
SWEP.NextShot = 0

SWEP.ReloadSounds = {
}

SWEP.DrawSounds = {
}

SWEP.DeployPunch = Angle(0.5,-0.5,0)

SWEP.ReloadingViewBob = {
    [0.2] = {Angle(2,1,0)},
	[0.5] = {Angle(3,2,0)},
	[1.2] = {Angle(-3,-2,0)},
	[1.7] = {Angle(2,-2,0)},
	[2.5] = {Angle(-4,2.4,0)},
	[3.0] = {Angle(-0.5,0.5,0)},
	[3.1] = {Angle(-0.8,0.8,0)},
	[3.3] = {Angle(-0.8,0.8,4)},
}

SWEP.Supressed = false

SWEP.HoldType = "duel"

SWEP.IronSightsPos = Vector(0, 0, 8.843)
SWEP.IronSightsAng = Vector(-5.628, 0, 0)

SWEP.IronRight = 0
SWEP.IronUp = 0
SWEP.IronAng = Angle(0, 0, 0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)