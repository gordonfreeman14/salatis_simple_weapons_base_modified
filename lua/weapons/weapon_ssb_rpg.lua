SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "RPG-7"
SWEP.Author 				= "gordon freeman"
SWEP.Instructions			= "Rocket launcher loaded with an rocket-propelled grenade. Holds 1 rocket."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_rpg_ssb.mdl"
SWEP.WorldModel				= "models/weapons/w_rpg_ssb.mdl"

SWEP.Slot = 4
SWEP.SlotPos = 3


------------------------------------------

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "rpglau"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 45
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "none"
SWEP.Primary.SoundFar = "none"
SWEP.Primary.Force = 200
SWEP.ReloadTime = 2.5
SWEP.ShootWait = 1
SWEP.NextShot = 0
SWEP.DrawSounds = {
    [0.1] = {"pwb2/weapons/m249paratrooper/m249_draw.wav"},
}
SWEP.DeployPunch = Angle(0.9,-0.9,0)

SWEP.HoldType = "rpg"

SWEP.IronRight = -3.72
SWEP.IronUp = -0.45
SWEP.IronAng = Angle(0,0,-10)
SWEP.IronRecoilFixer = 1.8

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,45,15)

function SWEP:PrimaryAttack()
    if not IsFirstTimePredicted() then return end
    if self:Clip1() <= 0 then
        self:EmitSound("Weapon_Pistol.Empty")
        self:SetNextPrimaryFire(CurTime() + 0.5)
        return
    end

    self:TakePrimaryAmmo(1)
    self:SetNextPrimaryFire(CurTime() + 1.2)

    self:EmitSound("Weapon_RPG.Single")
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    self:GetOwner():SetAnimation(PLAYER_ATTACK1)

    if SERVER then
local owner = self:GetOwner()
if not IsValid(owner) then return end

local shootPos = owner:GetShootPos()
local shootDir = owner:GetAimVector()
local right = owner:GetRight()

local offset = right * 12

if owner:KeyDown(IN_ATTACK2) then
    offset = Vector(0, 0, 0)
end

local rocket = ents.Create("rocket_ssb")
if not IsValid(rocket) then return end

rocket:SetPos(shootPos + offset + shootDir * 16)
rocket:SetAngles(shootDir:Angle())
rocket:SetOwner(owner)
rocket:Spawn()
rocket:Activate()

    end
end
