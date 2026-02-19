SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Mateba Home Protection"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Revolver chambered in .44 Magnum. 6 round cylinder."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/pwb2/weapons/v_matebahomeprotection.mdl"
SWEP.WorldModel				= "models/pwb2/weapons/w_matebahomeprotection.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

------------------------------------------

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "44pis"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 55
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb2/weapons/matebahomeprotection/deagle-1.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_snp_far.wav"
SWEP.Primary.Force = 55
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.46
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"pwb2/weapons/matebahomeprotection/mateba_clipout.wav"},
    [0.6] = {"pwb2/weapons/matebahomeprotection/mateba_bullets.wav"},
    [1.2] = {"pwb2/weapons/matebahomeprotection/mateba_clipin.wav"},
    [1.75] = {"pwb2/weapons/matebahomeprotection/mateba_clipback.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/usptactical/cloth.wav"}
}
SWEP.DeployPunch = Angle(0.5,-0.5,0)
SWEP.ReloadingViewBob = {
    [0.1] = {Angle(2,0,2)},
    [0.6] = {Angle(3,-0.5,-1)},
    [1.2] = {Angle(-2,-0.5,-1)},
    [1.75] = {Angle(2,-2,-1)},
}

SWEP.HoldType = "revolver"

SWEP.IronRight = -3.72
SWEP.IronUp = 1.2
SWEP.IronAng = Angle(0,0,0)
SWEP.IronRecoilFixer = 2.5

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)