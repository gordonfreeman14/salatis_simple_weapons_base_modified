SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "M4A1"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Rifle chambered in 5.56x45. 30 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_rif_m4a1_ssb.mdl"
SWEP.WorldModel				= "models/weapons/w_rif_m4a1.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "556rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 32
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "snd_jack_hmcd_ar_close.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_ar_far.wav"
SWEP.Primary.Force = 23
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.08
SWEP.NextShot = 0
SWEP.DrawSounds = {
    [0.1] = {"pwb/weapons/akm/draw.wav"},
}
SWEP.ReloadSounds = {
    [0.1] = {"pwb/weapons/fnp45/cloth.wav"},
    [0.3] = {"weapons/sg550_ssb/magout.wav"},
    [1.3] = {"weapons/sg550_ssb/magin.wav"},
    [1.5] = {"pwb/weapons/fnp45/cloth.wav"},
    [2.4] = {"weapons/sg550_ssb/boltback.wav"},
	[2.8] = {"weapons/sg550_ssb/boltforward.wav"}
}
SWEP.DeployPunch = Angle(0.9,-0.9,0)
SWEP.ReloadingViewBob = {
    [0.4] = {Angle(2,0,2)},
    [1.1] = {Angle(-1,-1,-2)},
    [1.4] = {Angle(-2,-1,1)},
    [1.8] = {Angle(-2,-1,1)},
}


SWEP.HoldType = "ar2"

SWEP.IronRight = -3.53
SWEP.IronUp = 0.84
SWEP.IronAng = Angle(0,0,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)
