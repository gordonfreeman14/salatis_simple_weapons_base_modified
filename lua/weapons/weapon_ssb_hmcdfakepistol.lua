SWEP.Base = 'weapon_ssb_base' -- base

SWEP.PrintName 				= "Fake Pistol"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "Fake pistol that fires blanks incase you want to scare the fuck out of your friend. Unlimited ammo."
SWEP.Category 				= "SSB Weapons"

SWEP.Spawnable 				= true
SWEP.AdminOnly 				= false


SWEP.ViewModel				= "models/weapons/v_pist_jivejevej.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_fiveseven.mdl"

SWEP.Slot = 1
SWEP.SlotPos = 2

SWEP.ViewModelFlip = true

------------------------------------------

function SWEP:CustomAmmoDisplay()
    self.AmmoDisplay = self.AmmoDisplay or {}
    self.AmmoDisplay.Draw = false
    return self.AmmoDisplay
end

SWEP.Primary.ClipSize		= 999999999
SWEP.Primary.DefaultClip	= 999999999
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 0
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "snd_jack_hmcd_smp_close.wav"
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"
SWEP.Primary.Force = 20
SWEP.ReloadTime = 2
SWEP.ShootWait = 0.12
SWEP.NextShot = 0
SWEP.ReloadSounds = {
    [0.1] = {"pwb/weapons/fnp45/cloth.wav"},
    [0.35] = {"pwb/weapons/fnp45/clipout.wav"},
    [1.2] = {"pwb/weapons/fnp45/clipin.wav"},
    [1.5] = {"pwb/weapons/fnp45/cloth.wav"},
    [1.8] = {"pwb/weapons/fnp45/sliderelease.wav"}
}
SWEP.DrawSounds = {
    [0.1] = {"pwb/weapons/fnp45/draw.wav"}
}
SWEP.DeployPunch = Angle(0.5,-0.9,0.9)
SWEP.ReloadingViewBob = {
    [0.4] = {Angle(2,0,1)},
    [0.45] = {Angle(-1,0,-1)},
    [1.2] = {Angle(-1,0.5,-2)},
    [1.5] = {Angle(1,-0.5,1)},
    [1.8] = {Angle(-1,-1,1)},
}

SWEP.HoldType = "revolver"

SWEP.IronRight = -1.75
SWEP.IronUp = 1.12
SWEP.IronAng = Angle(0,0.08,0)

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.dwsPos = Vector(0,25,15)

if CLIENT then
    local WorldModel = ClientsideModel(SWEP.WorldModel)
    
        -- Settings...
        WorldModel:SetNoDraw(true)
    
        function SWEP:DrawWorldModel()
            local _Owner = self:GetOwner()
    
            if (IsValid(_Owner)) then
                -- Specify a good position
                local offsetVec = Vector(3.5,-1,1.6)
                local offsetAng = Angle(5, 0, 180)
                
                local boneid = _Owner:LookupBone("ValveBiped.Bip01_R_Hand") -- Right Hand
                if !boneid then return end
    
                local matrix = _Owner:GetBoneMatrix(boneid)
                if !matrix then return end
    
                local newPos, newAng = LocalToWorld(offsetVec, offsetAng, matrix:GetTranslation(), matrix:GetAngles())
    
                WorldModel:SetPos(newPos)
                WorldModel:SetAngles(newAng)
                WorldModel:SetModelScale(0.8)
    
                WorldModel:SetupBones()
            else
                WorldModel:SetPos(self:GetPos())
                WorldModel:SetAngles(self:GetAngles())
            end
    
            WorldModel:DrawModel()

        end
    end

    function SWEP:PrimaryAttack()
        if self.Sprint or false then return end
        if self:Clip1() <= 0 then return end
        if self.NextShot > CurTime() then return end
        if timer.Exists("reload"..self:EntIndex()) then return end
        local ply = self:GetOwner()
    
        self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
        self.NextShot = CurTime() + self.ShootWait
    
        ply:ViewPunch( Angle( -0.5, 0, math.Rand( -0.5, 0.2 ) )*self.Primary.Force/20 )
        ply:SetAnimation(PLAYER_ATTACK1)
    
        if !game.SinglePlayer() then
            if SERVER then
                self.Recoil = (self.Recoil or Angle(0,0,0))+Angle(-math.Rand(4,6),math.Rand( -2, 2.5 ),0)*self.Primary.Force/20
                self:SetNWAngle("Recoil",self.Recoil)
                net.Start("huysound")
                    net.WriteVector(self:GetPos())
                    net.WriteString(self.Primary.Sound)
                    net.WriteString(self.Primary.SoundFar)
                    net.WriteEntity(ply)
                net.Broadcast()
                self:TakePrimaryAmmo(1)
            else
                self:EmitSound(self.Primary.Sound,125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
            end
        else
            self.Recoil = (self.Recoil or Angle(0,0,0))+Angle(-math.Rand(4,6),math.Rand( -2, 2.5 ),0)*self.Primary.Force/20
            self:EmitSound(self.Primary.Sound,125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
        end
    end