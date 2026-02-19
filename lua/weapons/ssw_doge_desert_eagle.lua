SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Desert Eagle"
SWEP.Author 				= "Doge"
SWEP.Instructions			= "Pistol chambered in .357 Magnum. 9 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false

SWEP.UseHands = true
SWEP.ViewModelFOV = 80

SWEP.ViewModel				= "models/weapons/c_pist_deagle_big.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_deagle.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 9
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 49
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/deagle/fire.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 100
SWEP.ReloadTime = 2.1
SWEP.ShootWait = 0.2
SWEP.NextShot = 0

SWEP.ReloadSounds = {
}

SWEP.DrawSounds = {
    [0.1] = {"DOGE.Draw_small"}
}

SWEP.DeployPunch = Angle(0.5,-0.5,0)

SWEP.ReloadingViewBob = {
    [0.2] = {Angle(2,1,0)},
	[0.4] = {Angle(9,6,3)},
	[0.5] = {Angle(3,3,3)},
	[1.3] = {Angle(-2,-2,-0)},
	[1.45] = {Angle(-4,-4,-1)},
	[2.1] = {Angle(0,4,-1)},
}

SWEP.Supressed = false

SWEP.HoldType = "revolver"

SWEP.IronSightsPos = Vector(-3.81, -9.247, 1.279)
SWEP.IronSightsAng = Vector(0, 0.029, 0)

SWEP.IronRight = -3.81
SWEP.IronUp = 1.279
SWEP.IronAng = Angle(0, 0.029, 0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)