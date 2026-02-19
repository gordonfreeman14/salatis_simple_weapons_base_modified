AddCSLuaFile()

local num = 120
local ammo = "762rif"
local model = "models/items/boxmrounds.mdl"
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "7.62x39 Rounds"
ENT.Category = "SSB Ammo"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.Editable = false

function ENT:Draw()
self.Entity:DrawModel()
end

function ENT:Initialize()
if SERVER then
self.Entity:SetModel( model )
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:PhysicsInit( SOLID_VPHYSICS )
self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
end
end

function ENT:PhysicsCollide( data )
if SERVER then
if data.Speed >= 300 then
self.Entity:EmitSound( "Wood.ImpactHard" )
end
if data.Speed >= 150 and data.Speed < 300 then
self.Entity:EmitSound( "Wood.ImpactSoft" )
end
end
end

function ENT:Use( entity )
if SERVER and entity:IsPlayer() then
self.User = entity
self.Entity:Remove()
end
end

function ENT:OnRemove()
if SERVER and IsValid( self.User ) then
self.User:GiveAmmo( num, ammo )
end
end