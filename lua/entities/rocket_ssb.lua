AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

ENT.Speed = 2500

function ENT:Initialize()
    self:SetModel("models/weapons/w_missile_closed.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:SetMass(5)
        phys:EnableGravity(false)
        phys:SetVelocity(self:GetForward() * self.Speed)
    end

    -- SERVER-SIDE VISUALS
    if SERVER then
        -- 🚀 Smoke trail
        self.Trail = ents.Create("env_spritetrail")
        if IsValid(self.Trail) then
            self.Trail:SetParent(self)
            self.Trail:SetOwner(self)
            self.Trail:SetPos(self:GetPos())

            self.Trail:SetKeyValue("lifetime", "0.4")
            self.Trail:SetKeyValue("startwidth", "16")
            self.Trail:SetKeyValue("endwidth", "2")
            self.Trail:SetKeyValue("spritename", "trails/smoke.vmt")
            self.Trail:SetKeyValue("renderamt", "200")
            self.Trail:SetKeyValue("rendermode", "5")

            self.Trail:Spawn()
            self.Trail:Activate()
        end

        -- 🔥 Bright muzzle-flash exhaust
        self.ExhaustFX = ents.Create("env_muzzleflash")
        if IsValid(self.ExhaustFX) then
            self.ExhaustFX:SetPos(self:GetPos() - self:GetForward() * 12)
            self.ExhaustFX:SetAngles(self:GetAngles())
            self.ExhaustFX:SetParent(self)
            self.ExhaustFX:SetOwner(self)

            self.ExhaustFX:SetKeyValue("scale", "1.5")
            self.ExhaustFX:SetKeyValue("brightness", "4")
            self.ExhaustFX:SetKeyValue("color", "255 180 80")

            self.ExhaustFX:Spawn()
            self.ExhaustFX:Activate()
            self.ExhaustFX:Fire("Fire")
        end
    end

    -- CLIENT-SIDE SOUND
    if CLIENT then
        timer.Simple(0, function()
            if not IsValid(self) then return end
            self:EmitSound(
                "weapons/rpg/rocket1.wav",
                90,
                100,
                1,
                CHAN_STATIC
            )
        end)
    end
end

function ENT:Think()
    if SERVER then
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocity(self:GetForward() * self.Speed)
        end

        -- Keep exhaust flashing
        if IsValid(self.ExhaustFX) then
            self.ExhaustFX:Fire("Fire")
        end
    end
end

function ENT:PhysicsCollide(data, phys)
    if self.Exploded then return end
    self.Exploded = true

    if SERVER then
        local pos = data.HitPos
        local normal = data.HitNormal

        -- Damage
        util.BlastDamage(
            self,
            self:GetOwner() or self,
            pos,
            300,
            140
        )

        -- 💥 Default explosion
        local fx1 = EffectData()
        fx1:SetOrigin(pos)
        fx1:SetNormal(normal)
        util.Effect("Explosion", fx1, true, true)

        -- 🚁 Helicopter mega bomb
        local fx2 = EffectData()
        fx2:SetOrigin(pos)
        fx2:SetNormal(normal)
        fx2:SetScale(1.2)
        util.Effect("HelicopterMegaBomb", fx2, true, true)

        -- Scorch decal
        util.Decal("Scorch", pos + normal, pos - normal)

        sound.Play("BaseExplosionEffect.Sound", pos, 100, 100)

        self:Remove()
    end
end

function ENT:OnRemove()
    if CLIENT then
        self:StopSound("weapons/rpg/rocket1.wav")
    end

    if SERVER then
        if IsValid(self.ExhaustFX) then
            self.ExhaustFX:Remove()
        end

        if IsValid(self.Trail) then
            self.Trail:Remove()
        end
    end
end
