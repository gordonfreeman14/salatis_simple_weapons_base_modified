SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "M249"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Machine Gun chambered in 5.56x45. 150 round magazine."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb2/weapons/v_m249paratrooper.mdl"
SWEP.WorldModel				= "models/pwb2/weapons/w_m249paratrooper.mdl"

SWEP.Slot = 2
SWEP.SlotPos = 2

SWEP.ViewModelFlip = true

------------------------------------------

SWEP.Primary.ClipSize		= 150
SWEP.Primary.DefaultClip	= 150
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "556rif"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 45
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb2/weapons/m249paratrooper/m249-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_ar_far.wav"
SWEP.Primary.Force = 45
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 0.08
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.5] = {"pwb2/weapons/m249paratrooper/m249_coverup.wav"},
    [1.7] = {"pwb2/weapons/m249paratrooper/m249_boxout.wav"},
    [2.8] = {"pwb2/weapons/m249paratrooper/m249_boxin.wav"},
    [3.7] = {"pwb2/weapons/m249paratrooper/m249_chain.wav"},
    [4.3] = {"pwb2/weapons/m249paratrooper/m249_coverdown.wav"},
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m249paratrooper/m249_draw.wav"},
}
SWEP.DeployPunch = Angle(0.9,-0.9,0)
SWEP.ReloadingViewBob = {
    [0.3] = {Angle(2,0,-2)},
    [0.5] = {Angle(-3,0,-2)},
    [1.9] = {Angle(-6,-0.5,-1)},
    [2.9] = {Angle(2,-3,-1)},
    [3.8] = {Angle(-2,3,-1)},
    [4.3] = {Angle(5,3,-1)},
}

SWEP.HoldType = "ar2"

SWEP.IronRight = -3.735
SWEP.IronUp = 1.49
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 1.8

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)