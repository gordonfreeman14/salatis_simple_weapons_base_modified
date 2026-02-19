SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "M4 Super 90"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Shotgun chambered in 12/70 buckshot. 8 round tube."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb2/weapons/v_m4super90.mdl"
SWEP.WorldModel				= "models/pwb2/weapons/w_m4super90.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "1270buck"
SWEP.Primary.Cone = 0.05
SWEP.Primary.Damage = 15
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb2/weapons/m4super90/xm1014-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_sht_far.wav"
SWEP.Primary.Force = 125
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 0.2
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.2] = {"pwb2/weapons/m4super90/cloth1.wav"},
    [0.6] = {"pwb2/weapons/m4super90/shell.wav"},
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m4super90/cloth2.wav"},
}
SWEP.DeployPunch = Angle(0.9,0.9,0)


SWEP.NumBullet = 12

SWEP.HoldType = "shotgun"

SWEP.IronRight = -1.58
SWEP.IronUp = 0.65
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 2

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)

SWEP.Shotgun = true
SWEP.Pumpsound = "pwb2/weapons/m4super90/bolt.wav"

    

