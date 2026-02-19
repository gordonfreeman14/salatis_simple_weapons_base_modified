SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Glock 17"
SWEP.Author 				= "gordon freeman"
SWEP.Instructions			= "Pistol chambered in .45 ACP. 17 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_pist_glock18_ssb.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_glock18.mdl"
SWEP.ViewModelFlip          = true

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 17
SWEP.Primary.DefaultClip	= 17
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "45pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 25
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "weapons/glock_ssb/glock18-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 25
SWEP.ReloadTime = 2.2
SWEP.ShootWait = 0.12
SWEP.NextShot = 0

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

SWEP.IronRight = -2.56
SWEP.IronUp = 0.9
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 1.8

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)