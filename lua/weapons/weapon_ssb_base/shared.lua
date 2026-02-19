SWEP.Base = 'weapon_base' -- base

SWEP.PrintName 				= "Weapon SalatSimpleBase"
SWEP.Author 				= "sadsalat"
SWEP.Instructions			= "The weapon base for everything related to SSB, uses the default gmod weapon base"
SWEP.Category 				= "SSB Other"

SWEP.Spawnable 				= false
SWEP.AdminOnly 				= true


SWEP.ViewModel				= "models/pwb/weapons/v_fnp45.mdl"
SWEP.WorldModel				= "models/pwb/weapons/w_fnp45.mdl"

SWEP.DrawCrosshair = false

------------------------------------------

SWEP.Primary.ClipSize		= 50
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"
SWEP.Primary.Cone = 0
SWEP.Primary.Damage = 100
SWEP.Primary.Spread = 0
SWEP.Primary.Sound = "pwb/weapons/fnp45/shoot.wav"      -- Near sound
SWEP.Primary.SoundFar = "snd_jack_hmcd_smp_far.wav"     -- Far sound | works only in multiplayer
SWEP.Primary.Force = 25                                 -- Force affects recoil

SWEP.ReloadTime = 2                                     -- Reload Time
SWEP.ShootWait = 0.12                                   -- Delay before firing
SWEP.NextShot = 0                                       -- Don't edit

SWEP.ReloadSounds = {                                   -- [0.1] = {""}
}                                                       -- playtime soundpatch

SWEP.DrawSounds = {                                     -- [0.1] = {""}
}                                                       -- playtime soundpatch

SWEP.ReloadingViewBob = {                               -- [0.1] = {Angle(0,0,0)}
}                                                       -- playtime  bobangle

SWEP.HoldType = "pistol"                                -- Weapon Holdtype

SWEP.IronRight = -2.83                                  -- IronSights Pos X
SWEP.IronUp = 1.3                                       -- IronSights Pos Y
SWEP.IronForward = 0                                    -- IronSights Pos Z
SWEP.IronAng = Angle(0,-2,0)                            -- IronSights Angle
SWEP.IronRecoilFixer = 2.5                              -- Visual weapon throwing modifier. Change if your bullets fly above or below the sight.

SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic    = true

SWEP.CSMuzzleFlashes = true

SWEP.DrawWeaponSelection = function(...) DrawWeaponSelection(...) end
SWEP.dwsPos = Vector(0,25,15)                           -- Hud Selector draw pos

SWEP.DeployPunch = Angle(0,0,0)                         -- Deploy bob

SWEP.Sight = 0                                          -- Don't edit

SWEP.Reloading = 0                                      -- Don't edit
SWEP.ReloadingTimer = 0                                 -- Don't edit

SWEP.Pumpsound = ""                                     -- If weapon need pump like shotgun or boltrifle
SWEP.Pump = false                                       -- If weapon need pump like shotgun or boltrifle
SWEP.Shotgun = false                                    -- If weapon is shootgun

SWEP.Scope = false 
SWEP.ScopeMult = 1
SWEP.ScopeMat = Material("sprites/mat_jack_hmcd_scope_diffuse")

if SERVER then
    recoilMulConVar = CreateConVar( "ssb_recoilmul", "1", FCVAR_NONE, "RecoilXD", 0.5, 5 )
    swayMulConVar = CreateConVar( "ssb_swaymul", "1", FCVAR_NONE, "RecoilXD", 0.25, 5 )
end
ssbviewbob = CreateClientConVar("ssb_viewbob", "1", true, false)
viewPunchConVar = CreateClientConVar("ssb_viewpunch","1",true,true,"RecoilXD",0,1)

function SWEP:Initialize()
    if not IsFirstTimePredicted() then return end
    self:SetHoldType(self.HoldType)
end

function SWEP:Deploy()
    if not IsFirstTimePredicted() then return end
    local ply = self:GetOwner()
    if viewPunchConVar:GetBool() then
    ply:ViewPunch( self.DeployPunch ) 
    end
	self:SetHoldType("normal")
    self:SendWeaponAnim( ACT_VM_DRAW )
	if SERVER then
		for k,v in pairs(self.DrawSounds) do
            if istable(k) then return end
            timer.Create(k.."drawsnd"..self:EntIndex(),tonumber( k, 10 ) or 0.1,1,function()
                if self:IsValid() then
                    if v[1] then
                        self:EmitSound(v[1])
                    end
                end
            end)
        end
	end

	self.NextShot = CurTime() + ply:GetViewModel():SequenceDuration()

	self:SetHoldType( self.HoldType )
end


function SWEP:PrimaryAttack()
    if self.Sprint or false then return end
	if self:IsReloading() or false then return end
    if self:Clip1() <= 0 then return end
    if self.NextShot > CurTime() then return end
    if not IsFirstTimePredicted() then return end
    local ply = self:GetOwner()

    self.Reloading = 0
    self:FireBullet(dmg, 1, 5)
    self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
    self.NextShot = CurTime() + self.ShootWait


    if game.SinglePlayer() then
        ply:ViewPunch( Angle( -0.8, 0, math.Rand( -0.2, 0.2 ) )*self.Primary.Force/20 )
    end
    if CLIENT and ssbviewbob:GetBool() then
        self:ShootPunch(self.Primary.Force)
    end
    ply:SetAnimation(PLAYER_ATTACK1)

    if self.Pump then
        timer.Create("pump"..self:EntIndex(),0.2,1,function()
            self:EmitSound(self.Pumpsound)
            ply:ViewPunch( Angle( 2, -2, 0.9 ) )
        end)
    end

    if !game.SinglePlayer() then
        if SERVER then
            self.Recoil = (self.Recoil or Angle(0,0,0))+Angle(-math.Rand(4,6)*recoilMulConVar:GetFloat(),math.Rand( -3, 3.5 )*swayMulConVar:GetFloat(),0)*(self.Primary.Force/20)
            self:SetNWAngle("Recoil",self.Recoil)
            net.Start("huysound")
                net.WriteVector(self:GetPos())
                net.WriteString(self.Primary.Sound)
                net.WriteString(self.Primary.SoundFar)
                net.WriteEntity(ply)
            net.Broadcast()
        else
            self:EmitSound(self.Primary.Sound,125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
        end
    else
        self.Recoil = (self.Recoil or Angle(0,0,0))+Angle(-math.Rand(4,6)*recoilMulConVar:GetFloat(),math.Rand( -3, 3.5 )*swayMulConVar:GetFloat(),0)*(self.Primary.Force/20)
        self:EmitSound(self.Primary.Sound,125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
    end
end


function SWEP:Think()
    local ply = self:GetOwner() or LocalPlayer()
    --if not IsFirstTimePredicted() then return end
    
    if ply:IsSprinting() then self.Sprint = true else self.Sprint = false end

    if SERVER then
        self.Recoil = LerpAngle(0.08,self.Recoil or Angle(0,0,0),Angle(0,0,0))
        self:SetNWAngle("Recoil",self.Recoil)
    else
        if !ply:KeyDown(IN_ATTACK2) or self.Sprint or self:IsReloading() then
            self.Sight = Lerp(0.11,self.Sight or 0,0)
        else
            self.Sight = Lerp(0.09,self.Sight or 0,1)
        end
    end

    self.FinalRecoil = LerpAngle(0.1,self.FinalRecoil or Angle(0,0,0),self:GetNWAngle("Recoil") or Angle(0,0,0))
    self.FinalRecoil.x = math.Round(self.FinalRecoil.x,5) 
    self.FinalRecoil.y = math.Round(self.FinalRecoil.y,5)
    self.FinalRecoil.z = math.Round(self.FinalRecoil.z,5)  

    if self.Shotgun then
        if self.Reloading == 1 then
            if self.ReloadingTimer >= CurTime() + 0.25 and viewPunchConVar:GetBool() then
                ply:ViewPunch( Angle( 0.05, 0.025, 0.05 ) )
            end
            if self.ReloadingTimer >= CurTime() and self.ReloadingTimer < CurTime() + 0.25 and viewPunchConVar:GetBool() then
                ply:ViewPunch( Angle( 0.025, 0.05, 0.025 ) )
            end
            if self.ReloadingTimer <= CurTime() and self:Clip1() < self.Primary.ClipSize and self:Ammo1() > 0 then
                self:ReloadInsert()
            end
            if self.ReloadingTimer <= CurTime() and ( self:Clip1() == self.Primary.ClipSize || ( self:Clip1() > 0 and self:Ammo1() <= 0 ) ) then
                self:ReloadEnd()
            end
        end   
    end

end

function SWEP:IsReloading()
    return timer.Exists("reload"..self:EntIndex()) or self.Reloading>0
end

function SWEP:Reload()
    local ply = self:GetOwner()

    if self.Shotgun then
        if self.Reloading == 0 and self.ReloadingTimer <= CurTime() and self:Clip1() < self.Primary.ClipSize and self:Ammo1() > 0 then
            self:SendWeaponAnim( ACT_SHOTGUN_RELOAD_START )
            self.Reloading = 1
            self.ReloadingTimer = CurTime() + ply:GetViewModel():SequenceDuration()
            self:EmitSound("pwb2/weapons/m4super90/cloth2.wav")
        end
        return
    end

	if timer.Exists("reload"..self:EntIndex())  or self:Clip1()>=self:GetMaxClip1() or self:GetOwner():GetAmmoCount( self:GetPrimaryAmmoType() )<=0 then return nil end
	if ply:IsSprinting() then return nil end
	if ( self.NextShot > CurTime() ) then return end

	ply:SetAnimation(PLAYER_RELOAD)
    self:SendWeaponAnim( ACT_VM_RELOAD )
    self:ReloadViewBob()
	timer.Create( "reload"..self:EntIndex(), self.ReloadTime, 1, function()
			if IsValid(self) and IsValid(ply) and ply:GetActiveWeapon()==self then
			local oldclip = self:Clip1()
			self:SetClip1(math.Clamp(self:Clip1()+self:GetOwner():GetAmmoCount( self:GetPrimaryAmmoType() ),0,self:GetMaxClip1()))
			local needed = self:Clip1()-oldclip
			ply:SetAmmo(self:GetOwner():GetAmmoCount( self:GetPrimaryAmmoType() )-needed, self:GetPrimaryAmmoType())
		end
	end)
    self:ReloadSound()
end

function SWEP:SecondaryAttack()
end

function SWEP:Holster( wep )
    return true
end
    


