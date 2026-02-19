include( "sh_util.lua" )
include( "shared.lua" )
include( "sh_sounds.lua" )
include( "cl_options.lua" )

local crosshair = CreateClientConVar("ssb_crosshair", "0", true, false) -- Only for admins, very useful for sight adjust

net.Receive("huysound",function(len)
	local pos = net.ReadVector()
	local sound = net.ReadString()
	local farsound = net.ReadString()
	local ent = net.ReadEntity()

	if ent == LocalPlayer() then return end

	local dist = LocalPlayer():EyePos():Distance(pos)
	if ent:IsValid() and dist < 1100 then
		ent:EmitSound(sound,ent.Supressed and 55 or 125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
	elseif ent:IsValid() then
		ent:EmitSound(farsound,ent.Supressed and 55 or 125,math.random(100,120),1,CHAN_VOICE_BASE,0,0)
	end
end)

local function easedLerpAng(fraction, from, to)
	return LerpAngle(math.ease.OutBack(fraction), from, to)
end
local function easedLerpAng1(fraction, from, to)
	return LerpAngle(math.ease.OutBack(fraction), from, to)
end


local function easedLerp(fraction, from, to)
	return Lerp(math.ease.InOutQuart(fraction), from, to)
end


local FinalAng
local NewWepPos, NewWepAng
local larp = 1.2

if game.SinglePlayer() then
    larp = 3.25
end

local drawlerp = 0
local drawlerp1 = 0
local gradientdown = Material( "vgui/gradient-u" )
local gradientup = Material( "vgui/gradient-d" )

function SWEP:DrawScope(CrosshairToScreen, Color)
    if self.Sight <= 0 then return end
    local ScrX, ScrY = ScrW(), ScrH()
        drawlerp = Lerp(15*FrameTime(),drawlerp,self.Sight)
        if self.Sight > 0.4 and self.Sight < 0.9 then
            drawlerp1 = 1
        else
        drawlerp1 = Lerp(5*FrameTime(),drawlerp1,0)
        end
        surface.SetDrawColor( 0, 0, 0, 255*drawlerp1)
        surface.DrawRect(0, 0, ScrX, ScrY)
        Color.a = 225*drawlerp
        surface.SetDrawColor( Color )
        surface.DrawLine(0,CrosshairToScreen.y,ScrX,CrosshairToScreen.y)
        surface.DrawLine(CrosshairToScreen.x,0,CrosshairToScreen.x,ScrY)

        surface.SetDrawColor( 0, 0, 0, 275*drawlerp )
        surface.SetMaterial(self.ScopeMat)
        surface.DrawTexturedRect(CrosshairToScreen.x-ScrX/2, CrosshairToScreen.y-ScrY/2, ScrX, ScrY)

        surface.SetMaterial(gradientdown)
        surface.DrawTexturedRect(CrosshairToScreen.x-ScrX/2, CrosshairToScreen.y-ScrY/2, ScrX, ScrY)
        surface.SetMaterial(gradientup)
        surface.DrawTexturedRect(CrosshairToScreen.x-ScrX/2, CrosshairToScreen.y+ScrY/3, ScrX, ScrY/6)
    
        surface.DrawRect(CrosshairToScreen.x-ScrX/2, CrosshairToScreen.y-ScrY*1.5, ScrX, ScrY)
        surface.DrawRect(CrosshairToScreen.x-ScrX/2, CrosshairToScreen.y+ScrY/2, ScrX, ScrY*5)

        surface.DrawRect(CrosshairToScreen.x-ScrX*2.5, CrosshairToScreen.y-ScrY*2, ScrX*2, ScrY*15)
        surface.DrawRect(CrosshairToScreen.x+ScrX/2, CrosshairToScreen.y-ScrY*2, ScrX*2, ScrY*15)
end

local TrAngle
local TrPos
local Tr
local CH


function SWEP:DrawHUD()
    local lply = LocalPlayer()
    TrAngle = lply:EyeAngles() + (self.FinalRecoil or Angle(0,0,0))
    TrPos = lply:EyePos()
    Tr = util.TraceLine( {
        start = TrPos,
        endpos = TrPos + TrAngle:Forward()*10,
        filter = lply
    } )

    if self.Scope then
        Tr.HitPos:ToScreen()
        self:DrawScope(Tr.HitPos:ToScreen(), Color(0,0,0))
    end

    if crosshair:GetBool() then
        surface.SetDrawColor(255,255,255,255)
        surface.DrawRect(Tr.HitPos:ToScreen().x-1.5, Tr.HitPos:ToScreen().y-1.5, 5, 5)
    end
end

function SWEP:AdjustMouseSensitivity()
    if self.Scope and self.Sight > 0.6 then
        return math.Clamp(1-(self.ScopeMult/10)*3,0.025,1)
    else
        return 1
    end
end

local viewModelBobVec
local finalang1
local finalpos
local lerpang
local viewBobVec
local viewBobAng
local viewShootPunch = Angle(0,0,0)

function SWEP:ShootPunch(force)
    force = force/20
    viewShootPunch.x = math.Clamp(viewShootPunch.x - force,-force*4,0)
    viewShootPunch.z = math.Clamp(viewShootPunch.z+math.random(-force/10,force/10)*2,-force/5,force/5)
end

function SWEP:CalcView(ply, pos, ang, fov)
    if !ssbviewbob:GetBool() then return pos, ang, math.Clamp(fov+5 - self.Sight * 20*self.ScopeMult,5,140) end

    viewShootPunch = easedLerpAng1(0.7*FrameTime(),viewShootPunch,Angle(0,0,0))
    
    --print(viewShootPunch)

    local speed = ply:GetVelocity():Length()
    viewBobAng = ( Angle( -easedLerp(math.sin(CurTime()*6)/2,-1,2), easedLerp(math.sin(CurTime()*3)/2,-0.5,3), 0)*speed/400 )
    finalang1 = ang + viewBobAng
    if ply:IsSprinting() then
        viewBobVec = ( ang:Right()*easedLerp(math.sin(CurTime()*12)/4,-0.1,0.3) + ang:Up()*easedLerp(math.sin(CurTime()*12)/4,-0.1,3) )*speed/400
        finalpos = pos + viewBobVec
        finalang1 = ang + Angle(-easedLerp(math.sin(CurTime()*12)/2,-1,1),math.sin(CurTime()*12)/1,math.sin(CurTime()*12)/1.5)*speed/400
    else
        viewBobVec = ( ang:Right()*easedLerp(math.sin(CurTime()*3)/2,-0.1,0.3)/2 + ang:Up()*easedLerp(math.sin(CurTime()*6)/4,-0.1,1) )*speed/400
        finalpos = pos + viewBobVec
    end

    lerpang = easedLerpAng(5*FrameTime(),lerpang or LocalPlayer():EyeAngles(),finalang1+viewShootPunch)

    return finalpos, lerpang, math.Clamp((fov+5 - self.Sight * 20*self.ScopeMult)-viewShootPunch.x/5,5,140)
end


local FlipFinalRecoil = Angle(0,0,0)
function SWEP:CalcViewModelView(ViewModel, OldEyePos, OldEyeAng, EyePos, EyeAng)
    local speed = LocalPlayer():GetVelocity():Length()

    if self.Scope and self.Sight > 0.9 then ViewModel:SetNoDraw(true) return else
        ViewModel:SetNoDraw(false) 
    end

    
    if self.ViewModelFlip then
        if self.FinalRecoil then
            FlipFinalRecoil = self.FinalRecoil
            FlipFinalRecoil.y = -FlipFinalRecoil.y
        end
        if self.Sight > 0.5 and (!self.Sprint) then
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*1)/2,-0.2,0.3)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*6)/2.5,0,0.9) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (OldEyeAng:Right()*-self.IronRight + OldEyeAng:Up()*self.IronUp + OldEyeAng:Forward()*self.IronForward)*self.Sight
            NewWepAng = EyeAng + (((FlipFinalRecoil or LocalPlayer():EyeAngles()))/self.IronRecoilFixer) + (self.IronAng*self.Sight)
        elseif !self.Sprint then
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*3)/2,-0.2,0.1)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*8)/2.5,0,0.5) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (-OldEyeAng:Right()*self.IronRight + OldEyeAng:Up()*self.IronUp + OldEyeAng:Forward()*self.IronForward)*self.Sight + viewModelBobVec
            NewWepAng = EyeAng + (((FlipFinalRecoil or LocalPlayer():EyeAngles()))/self.IronRecoilFixer) + (self.IronAng*self.Sight)
        else
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*6)/2,-0.2,0.1)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*12)/2,0,0.2) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (OldEyeAng:Right()*-self.IronRight + OldEyeAng:Up()*1.3)*self.Sight + viewModelBobVec
            NewWepAng = EyeAng + Angle(15,-25,15) + Angle(math.cos(CurTime()*18)*1,0,math.sin(CurTime()*18)*1)*speed/400
        end
    else
        if self.Sight > 0.5 and (!self.Sprint) then
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*1)/2,-0.2,0.3)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*6)/2.5,0,0.9) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (OldEyeAng:Right()*self.IronRight + OldEyeAng:Up()*self.IronUp + OldEyeAng:Forward()*self.IronForward)*self.Sight
            NewWepAng = EyeAng + (((self.FinalRecoil or LocalPlayer():EyeAngles()))/self.IronRecoilFixer) + (self.IronAng*self.Sight)
        elseif !self.Sprint then
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*3)/2,-0.2,0.1)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*8)/2.5,0,0.5) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (OldEyeAng:Right()*self.IronRight + OldEyeAng:Up()*self.IronUp + OldEyeAng:Forward()*self.IronForward)*self.Sight + viewModelBobVec + OldEyeAng:Forward()*viewShootPunch.x/2.5
            NewWepAng = EyeAng + (((self.FinalRecoil or LocalPlayer():EyeAngles()))/self.IronRecoilFixer) + (self.IronAng*self.Sight)
        else
            viewModelBobVec = ( OldEyeAng:Right()*easedLerp(math.sin(CurTime()*6)/2,-0.2,0.1)/5 + OldEyeAng:Up()*-easedLerp(math.sin(CurTime()*12)/2,0,0.2) )*math.Max(speed/400,0)
            NewWepPos = OldEyePos + (OldEyeAng:Right()*-self.IronRight + OldEyeAng:Up()*1.3)*self.Sight + viewModelBobVec
            NewWepAng = EyeAng + Angle(15,25,-15) + Angle(math.cos(CurTime()*18)*1,0,math.sin(CurTime()*18)*1)*speed/400
        end
    end
    FinalAng = easedLerpAng(larp*FrameTime(),FinalAng or LocalPlayer():EyeAngles(),NewWepAng)

    return NewWepPos, FinalAng
end