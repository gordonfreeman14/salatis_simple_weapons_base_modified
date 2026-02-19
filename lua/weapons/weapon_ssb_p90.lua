SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "P90"
SWEP.Author 				= "gordon freeman"
SWEP.Instructions			= "Sub-Machine Pistol chambered in FN 5.7×28mm. 50 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb/weapons/v_p90.mdl"
SWEP.WorldModel				= "models/pwb/weapons/w_p90.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "57sub"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 24
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb/weapons/p90/shoot.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 15
SWEP.ReloadTime = 2.9
SWEP.ShootWait = 0.08
SWEP.NextShot = 0
SWEP.DeployPunch = Angle(1,2,0)
SWEP.ReloadingViewBob = {
    [0.5] = {Angle(2,0,2)},
    [1.2] = {Angle(3,-0.5,-1)},
    [2.1] = {Angle(-2,-0.5,-1)},
    [2.7] = {Angle(5,-2,-1)},
    [3.4] = {Angle(-0.5,-0.5,-0.5)},
}
SWEP.ReloadSounds = {
    [0.5] = {"pwb/weapons/p90/unlock.wav"},
	[0.9] = {"pwb/weapons/p90/clipout.wav"},
	[1.7] = {"pwb/weapons/p90/clipin.wav"},
	[2.0] = {"pwb/weapons/p90/cliptap.wav"},
    [2.8] = {"pwb/weapons/p90/boltpull.wav"},
}
SWEP.DrawSounds = {
   	[0.1] = {"pwb/weapons/p90/draw.wav"},
    [0.4] = {"pwb/weapons/p90/boltpull.wav"},
}


SWEP.HoldType = "smg"

SWEP.IronRight = -3.41
SWEP.IronUp = -0.22
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 2.3

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,35,15)