function SWEP:BulletCallbackFunc(dmgAmt,ply,tr,dmg,tracer,hard,multi)
	if(tr.MatType==MAT_FLESH)then
		util.Decal("Impact.Flesh",tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal)
		local vPoint = tr.HitPos
		local effectdata = EffectData()
		effectdata:SetOrigin( vPoint )
		util.Effect( "BloodImpact", effectdata )
	end
	if(self.NumBullet or 1>1)then return end
	if(tr.HitSky)then return end
	if(hard)then self:RicochetOrPenetrate(tr) end
end

SSB_SurfaceHardness={
    [MAT_METAL]=.95,[MAT_COMPUTER]=.95,[MAT_VENT]=.95,[MAT_GRATE]=.95,[MAT_FLESH]=.5,[MAT_ALIENFLESH]=.3,
    [MAT_SAND]=.1,[MAT_DIRT]=.3,[74]=.1,[85]=.2,[MAT_WOOD]=.5,[MAT_FOLIAGE]=.5,
    [MAT_CONCRETE]=.9,[MAT_TILE]=.8,[MAT_SLOSH]=.05,[MAT_PLASTIC]=.3,[MAT_GLASS]=.6
} -- Jackcoding )))

function SWEP:RicochetOrPenetrate(initialTrace)
	local AVec,IPos,TNorm,SMul=initialTrace.Normal,initialTrace.HitPos,initialTrace.HitNormal,SSB_SurfaceHardness[initialTrace.MatType]
	if not(SMul)then SMul=.5 end
	local ApproachAngle=-math.deg(math.asin(TNorm:DotProduct(AVec)))
	local MaxRicAngle=60*SMul
	if(ApproachAngle>(MaxRicAngle*1.25))then -- all the way through
		local MaxDist,SearchPos,SearchDist,Penetrated=(self.Primary.Damage/SMul)*.15,IPos,5,false
		while((not(Penetrated))and(SearchDist<MaxDist))do
			SearchPos=IPos+AVec*SearchDist
			local PeneTrace=util.QuickTrace(SearchPos,-AVec*SearchDist)
			if((not(PeneTrace.StartSolid))and(PeneTrace.Hit))then
				Penetrated=true
			else
				SearchDist=SearchDist+5
			end
		end
		if(Penetrated)then
			self:FireBullets({
				Attacker=self.Owner,
				Damage=1,
				Force=1,
				Num=1,
				Tracer=0,
				TracerName="",
				Dir=-AVec,
				Spread=Vector(0,0,0),
				Src=SearchPos+AVec
			})
			self:FireBullets({
				Attacker=self.Owner,
				Damage=self.Primary.Damage*.65,
				Force=self.Primary.Damage/15,
				Num=1,
				Tracer=0,
				TracerName="",
				Dir=AVec,
				Spread=Vector(0,0,0),
				Src=SearchPos+AVec
			})
		end
	elseif(ApproachAngle<(MaxRicAngle*.25))then -- ping whiiiizzzz
		sound.Play("snd_jack_hmcd_ricochet_"..math.random(1,2)..".wav",IPos,70,math.random(90,100))
		local NewVec=AVec:Angle()
		NewVec:RotateAroundAxis(TNorm,180)
		NewVec=NewVec:Forward()
		self:FireBullets({
			Attacker=self.Owner,
			Damage=self.Primary.Damage*.85,
			Force=self.Primary.Damage/15,
			Num=1,
			Tracer=0,
			TracerName="",
			Dir=-NewVec,
			Spread=Vector(0,0,0),
			Src=IPos+TNorm
		})
	end
end

function SWEP:FireBullet(dmg, numbul, spread)
	if self:Clip1() <= 0 then return end
	if timer.Exists("reload"..self:EntIndex()) then return nil end
	
	local ply = self:GetOwner()

	ply:LagCompensation(true)

	local cone = self.Primary.Cone

	local bullet = {}
	bullet.Num 			= self.NumBullet or 1
	bullet.Src 			= ply:EyePos()
	bullet.Dir 			= (ply:EyeAngles()+(self.FinalRecoil or Angle(0,0,0))):Forward()
	bullet.Spread 		= Vector(cone,cone,0)
	bullet.Force		= self.Primary.Force/100
	bullet.Damage		= self.Primary.Damage
	bullet.AmmoType     = self.Primary.Ammo
	bullet.Attacker 	= self.Owner
	bullet.Tracer       = 1
	bullet.TracerName   = self.Tracer or "Tracer"
	bullet.IgnoreEntity = not self.Owner:IsNPC() and self.Owner:GetVehicle() or self.Owner

	bullet.Callback = function(ply,tr,dmgInfo)
		ply:GetActiveWeapon():BulletCallbackFunc(self.Primary.Damage,ply,tr,self.Primary.Damage,false,true,false)
		if SERVER then
			net.Start("shoot_huy")
				net.WriteTable(tr)
			net.Broadcast()
		end
	end

	if SERVER then self:TakePrimaryAmmo(1) end

	self:FireBullets(bullet)
    --self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	ply:LagCompensation(false)

end

if SERVER then
	util.AddNetworkString("shoot_huy")
else
	net.Receive("shoot_huy",function(len)
		local tr = net.ReadTable()
		--snd_jack_hmcd_bc_1.wav

		local dist,vec,dist2 = util.DistanceToLine(tr.StartPos,tr.HitPos,EyePos())
		if dist < 128 and dist2 > 128 then
			EmitSound("snd_jack_hmcd_bc_"..tostring(math.random(1,7))..".wav", vec, 1, CHAN_VOICE, 1, 75, 0, 100)
		end
	end)
end

local function PrintWeaponInfo(self,x,y,alpha)
	if self.DrawWeaponInfoBox == false then return end

	if self.InfoMarkup == nil then
		local str
		local title_color = "<color=230,230,230,255>"
		local text_color = "<color=150,150,150,255>"

		str = "<font=HudSelectionText>"
		if self.Author != "" then str = str .. title_color .. "Autor:</color>\t"..text_color..self.Author.."</color>\n" end
		--if ( self.Contact != "" ) then str = str .. title_color .. "Contact:</color>\t"..text_color..self.Contact.."</color>\n\n" end
		--if ( self.Purpose != "" ) then str = str .. title_color .. "Purpose:</color>\n"..text_color..self.Purpose.."</color>\n\n" end
		if self.Instructions != "" then str = str .. title_color .. "Info:</color>\t"..text_color..self.Instructions.."</color>\n" end
		str = str .. "</font>"

		self.InfoMarkup = markup.Parse(str,250)
	end

	--surface.DrawTexturedRect(x,y - 64 - 5,128,64)
	draw.RoundedBox(5,x,y,260,self.InfoMarkup:GetHeight() + 2,Color(60,60,60,alpha))

	self.InfoMarkup:Draw(x + 5,y,nil,nil,alpha)
end

local vecZero = Vector(0,0,0)
local angZero = Angle(0,0,0)
local cameraPos,cameraAng
local angRotate = Angle(0,0,0)
local _cameraPos = Vector(20,20,10)
local _cameraAng = Angle(10,0,0)

DrawWeaponSelectionEX = function(self,x,y,wide,tall,alpha)
	if SERVER then return end
    local cameraPos = self.dwsPos or _cameraPos
    local mdl = self.WorldModel

    if mdl then
        local DrawModel = G_DrawModel

        local lply = LocalPlayer()

        if not IsValid(DrawModel) then
            G_DrawModel = ClientsideModel(mdl,RENDER_GROUP_OPAQUE_ENTITY)
            DrawModel = G_DrawModel
            DrawModel:SetNoDraw(true)
        else
            DrawModel:SetModel(mdl)

            cam.Start3D(cameraPos,(-cameraPos):Angle() - (self.cameraAng or _cameraAng),45,x,y,wide,tall)
                --cam_IgnoreZ(true)
                render.SuppressEngineLighting(true)

                render.SetLightingOrigin(vecZero)
                render.ResetModelLighting(50 / 255,50 / 255,50 / 255)
                render.SetColorModulation(1,1,1)
                render.SetBlend(255)

                render.SetModelLighting(4,1,1,1)

                angRotate:Set(angZero)
                angRotate[2] = RealTime() * 30 % 360
                angRotate:Add(self.dwsItemAng or angZero)

                local dir = Vector(0,0,0)
                dir:Set(self.dwsItemPos or vecZero)
                dir:Rotate(angRotate)

                DrawModel:SetRenderAngles(angRotate)
                DrawModel:SetRenderOrigin(dir)
                DrawModel:DrawModel()

                render.SetColorModulation(1,1,1)
                render.SetBlend(1)
                render.SuppressEngineLighting(false)
                --cam_IgnoreZ(false)
            cam.End3D()
        end
    end

	if self.PrintWeaponInfo then PrintWeaponInfo(self,x + wide,y + tall,alpha) end
end



local white = Color(255,255,255)
DrawWeaponSelection = function(self,x,y,w,h,alpha) DrawWeaponSelectionEX(self,x,y,w,h + 35,alpha) end
OverridePaintIcon = function(self,x,y,w,h,obj) DrawWeaponSelectionEX(obj,x + 5,y + 5,w - 10,h - 30) end

function SWEP:ReloadViewBob()
	
	local ply = self:GetOwner()
	if !viewPunchConVar:GetBool() then return end
	for k,v in pairs(self.ReloadingViewBob) do
        if istable(k) then return end
        timer.Create(k.."bobing"..self:EntIndex(),tonumber( k, 10 ) or 0.1,1,function()
			if not IsFirstTimePredicted() then return end
        	if self:IsValid() and ply:GetActiveWeapon():GetClass() == self:GetClass() then
            	if v[1] then
                	ply:ViewPunch(v[1])
            	end
        	end
		end)
	end
end

-- For Shotguns

function SWEP:ReloadInsert()
	local ply = self:GetOwner()
    self:SendWeaponAnim( ACT_VM_RELOAD )
    ply:SetAnimation( PLAYER_RELOAD )
    self:SetClip1( self:Clip1() + 1 )
    ply:RemoveAmmo( 1, self.Primary.Ammo, false )
    self:EmitSound("pwb2/weapons/m4super90/shell.wav")
    self.Reloading = 1
    self.ReloadingTimer = CurTime() + ply:GetViewModel():SequenceDuration()
    self.Idle = 2
end
    
function SWEP:ReloadEnd()
	local ply = self:GetOwner()
    self:SendWeaponAnim( ACT_SHOTGUN_RELOAD_FINISH )
    self.Reloading = 0
    self.ReloadingTimer = CurTime() + ply:GetViewModel():SequenceDuration()
    self:EmitSound("pwb2/weapons/m4super90/cloth2.wav")
    timer.Simple(0.2,function()
        self:EmitSound(self.Pumpsound)
		if viewPunchConVar:GetBool() then
        ply:ViewPunch( Angle( 2, -2, 0.9 ) )
		end
    end)
end

