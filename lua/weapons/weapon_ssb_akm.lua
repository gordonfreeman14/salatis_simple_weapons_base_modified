SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "AKM"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Rifle chambered in 7.62x39. 30 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb/weapons/v_akm.mdl"
SWEP.WorldModel				= "models/pwb/weapons/w_akm.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "762rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 55
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb/weapons/akm/shoot.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 35
SWEP.ReloadTime = 2.9
SWEP.ShootWait = 0.08
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.4] = {"pwb/weapons/akm/clipout.wav"},
    [0.6] = {"pwb/weapons/akm/cloth_fast.wav"},
    [1.2] = {"pwb/weapons/akm/clipin.wav"},
    [1.7] = {"pwb/weapons/akm/cloth.wav"},
    [2.1] = {"pwb/weapons/akm/boltpull.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb/weapons/akm/draw.wav"},
    [0.4] = {"pwb/weapons/akm/safety.wav"}
}
SWEP.DeployPunch = Angle(0.9,-0.9,0)
SWEP.ReloadingViewBob = {
    [0.4] = {Angle(2,0,2)},
    [0.5] = {Angle(-3,0,-1)},
    [0.95] = {Angle(2,-2,2)},
    [1] = {Angle(-0.5,0.5,-2)},
    [1.4] = {Angle(-2,-0.5,-1)},
    [1.6] = {Angle(2,0.5,1)},
    [2.2] = {Angle(2,-3,-1)},
    [2.5] = {Angle(2,-3,-1)}
}


SWEP.HoldType = "ar2"

SWEP.IronRight = -2.35
SWEP.IronUp = 0.6
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 1.8

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)
