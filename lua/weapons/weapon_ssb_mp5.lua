SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "MP5"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Sub-Machine Pistol chambered in 9x19. 30 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb2/weapons/v_mp5a3.mdl"
SWEP.WorldModel				= "models/pwb2/weapons/w_mp5a3.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 15
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb2/weapons/mp5a3/mp5-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 15
SWEP.ReloadTime = 2.9
SWEP.ShootWait = 0.08
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.5] = {"pwb2/weapons/mp5a3/kry_mp5_boltpull.wav"},
    [1.2] = {"pwb2/weapons/mp5a3/kry_mp5_magout.wav"},
    [2.1] = {"pwb2/weapons/mp5a3/kry_mp5_magin.wav"},
    [2.7] = {"pwb2/weapons/mp5a3/kry_mp5_bolt_slap.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/mp5a3/foley.wav"},
    [0.3] = {"pwb2/weapons/mp5a3/kry_mp5_bolt_slap.wav"}
}
SWEP.DeployPunch = Angle(1,2,0)
SWEP.ReloadingViewBob = {
    [0.5] = {Angle(2,0,2)},
    [1.2] = {Angle(3,-0.5,-1)},
    [2.1] = {Angle(-2,-0.5,-1)},
    [2.7] = {Angle(5,-2,-1)},
    [3.4] = {Angle(-0.5,-0.5,-0.5)},
}


SWEP.HoldType = "ar2"

SWEP.IronRight = -2.26
SWEP.IronUp = 0.7
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 2.3

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,35,15)