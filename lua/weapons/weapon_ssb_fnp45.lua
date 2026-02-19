SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "FNP-45"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Pistol chambered in .45 ACP. 16 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb/weapons/v_fnp45.mdl"
SWEP.WorldModel				= "models/pwb/weapons/w_fnp45.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 16
SWEP.Primary.DefaultClip	= 16
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "45pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 25
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb/weapons/fnp45/shoot.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.12
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"pwb/weapons/fnp45/clipout.wav"},
    [0.6] = {"pwb/weapons/fnp45/cloth.wav"},
    [1.4] = {"pwb/weapons/fnp45/clipin.wav"},
    [2] = {"pwb/weapons/fnp45/sliderelease.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb/weapons/fnp45/draw.wav"}
}
SWEP.DeployPunch = Angle(0.5,-0.5,0)
SWEP.ReloadingViewBob = {
    [0.2] = {Angle(2,0,1)},
    [0.4] = {Angle(-1,0,-1)},
    [0.6] = {Angle(-1,0.5,-2)},
    [0.7] = {Angle(1,0.5,0.5)},
    [1.4] = {Angle(-1,-0.5,-1)},
    [1.5] = {Angle(1,-0.5,1)},
    [2] = {Angle(-1,-1,1)},
}
SWEP.Supressed = true

SWEP.HoldType = "revolver"

SWEP.IronRight = -2.83
SWEP.IronUp = 1.3
SWEP.IronAng = Angle(0,-2,0)
SWEP.IronRecoilFixer = 1.8

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)