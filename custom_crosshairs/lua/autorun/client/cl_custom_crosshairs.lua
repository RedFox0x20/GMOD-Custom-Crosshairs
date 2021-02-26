-- CustomCrosshair.lua

local GAMEMODE = engine.ActiveGamemode()

function CustomCrosshair_GUITab(dtabs)
	local CrosshairsTab = vgui.Create("DPanelList", dtabs)
	CrosshairsTab:StretchToParent(0, 0, dtabs:GetPadding() * 2, 0)
	CrosshairsTab:EnableVerticalScrollbar(true)
	CrosshairsTab:SetPadding(10)
	CrosshairsTab:SetSpacing(10)

	local CrosshairSettingsForm = vgui.Create("DForm", CrosshairsTab)
	CrosshairSettingsForm:SetName("Crosshair settings")
	CrosshairsTab:AddItem(CrosshairSettingsForm)
	
	-- Enable

	local EnableCheckbox = CrosshairSettingsForm:CheckBox(
			"Enable custom crosshair",
			"cl_custom_crosshair")
	
	local CrosshairDotCB = CrosshairSettingsForm:CheckBox(
			"Enable crosshair dot",
			"cl_custom_crosshair_dot")

	-- Size
	CrosshairSettingsForm:NumSlider(
			"Crosshair width",
			"cl_custom_crosshair_width", 5, 255, 0)

	CrosshairSettingsForm:NumSlider(
			"Crosshair height", 
			"cl_custom_crosshair_height", 5, 255, 0)

	CrosshairSettingsForm:NumSlider(
			"Crosshair gap", 
			"cl_custom_crosshair_gap", 0, 32, 0)

	CrosshairSettingsForm:NumSlider(
			"Crosshair radius", 
			"cl_custom_crosshair_radius", 1, 255, 0)
	
	CrosshairSettingsForm:NumSlider(
			"Dot radius",
			"cl_custom_crosshair_dot_radius", 1, 16, 0)
	
	CrosshairSettingsForm:NumSlider(
			"Dot resolution",
			"cl_custom_crosshair_dot_resolution", 5, 64, 0)


	-- Style

	local StyleBox = vgui.Create("DHorizontalScroller")
	local SBX, SBY = StyleBox:GetSize()
	StyleBox:SetSize(SBX, 64)	

	local StyleButton_None = vgui.Create("DButton", StyleBox)
	StyleButton_None:SetText("None")
	StyleButton_None:SetSize(64, 64)
	StyleButton_None:SetConsoleCommand("cl_custom_crosshair_style", "0")
	StyleBox:AddPanel(StyleButton_None)
	
	local StyleButton_Cross = vgui.Create("DButton", StyleBox)
	StyleButton_Cross:SetText("Cross")
	StyleButton_Cross:SetSize(64, 64)
	StyleButton_Cross:SetConsoleCommand("cl_custom_crosshair_style", "1")
	StyleButton_Cross:SetImage("crosshair_cross.png")
	StyleBox:AddPanel(StyleButton_Cross)
	
	local StyleButton_T = vgui.Create("DButton", StyleBox)
	StyleButton_T:SetText("T")
	StyleButton_T:SetSize(64, 64)
	StyleButton_T:SetConsoleCommand("cl_custom_crosshair_style", "2")
	StyleButton_T:SetImage("crosshair_t.png")
	StyleBox:AddPanel(StyleButton_T)
	
	local StyleButton_Circle = vgui.Create("DButton")
	StyleButton_Circle:SetText("Circle")
	StyleButton_Circle:SetSize(64, 64)
	StyleButton_Circle:SetConsoleCommand("cl_custom_crosshair_style", "3")
	StyleButton_Circle:SetImage("crosshair_circle.png")
	StyleBox:AddPanel(StyleButton_Circle)

	CrosshairSettingsForm:AddItem(StyleBox)

	-- Colour

	local CrosshairColourForm = vgui.Create("DForm", CrosshairsTab)
	CrosshairColourForm:SetName("Crosshair colour")
	CrosshairsTab:AddItem(CrosshairColourForm)

	local ColourSelector = vgui.Create("DColorMixer", CrosshairColourForm)
	ColourSelector:SetConVarR("cl_custom_crosshair_red")
	ColourSelector:SetConVarG("cl_custom_crosshair_green")
	ColourSelector:SetConVarB("cl_custom_crosshair_blue")
	ColourSelector:SetConVarA("cl_custom_crosshair_alpha")
	CrosshairColourForm:AddItem(ColourSelector)

	-- Credits
	local CreditsPanel = vgui.Create("DPanel", CrosshairsTab)
	CreditsPanel:SetText("Credits")
	CrosshairsTab:AddItem(CreditsPanel)

	local CreditsLabel = vgui.Create("DLabel", CreditsPanel)
	CreditsLabel:SetText("Custom crosshairs created by RedFox0x20")
	CreditsLabel:SetDark(1)
	CreditsLabel:Center()
	CreditsLabel:CenterHorizontal(0.5)
	CreditsLabel:Dock(FILL)

	dtabs:AddSheet("Crosshair", CrosshairsTab, "icon16/wrench.png", false, false, "Custom crosshair settings")
end

function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y +
					math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v =
					math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute
	table.insert( cir, { x = x + math.sin( a ) * radius, y =
		y + math.cos( a ) * radius, u = math.sin( a ) /
		2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function CustomCrosshair_Draw()
	if (not GetConVar("cl_custom_crosshair"):GetBool()) then return end

	local Style = GetConVar("cl_custom_crosshair_style"):GetInt()
	local R = GetConVar("cl_custom_crosshair_red"):GetInt()
	local G = GetConVar("cl_custom_crosshair_green"):GetInt()
	local B = GetConVar("cl_custom_crosshair_blue"):GetInt()
	local A = GetConVar("cl_custom_crosshair_alpha"):GetInt()
	local CW = GetConVar("cl_custom_crosshair_width"):GetInt()
	local CH = GetConVar("cl_custom_crosshair_height"):GetInt()
	local CG = GetConVar("cl_custom_crosshair_gap"):GetInt()
	local CR = GetConVar("cl_custom_crosshair_radius"):GetInt()
	local CD = GetConVar("cl_custom_crosshair_dot"):GetBool()
	local CDR = GetConVar("cl_custom_crosshair_dot_radius"):GetInt()
	local CS = GetConVar("cl_custom_crosshair_dot_resolution"):GetInt()
	local SW = ScrW()
	local SH = ScrH()

	local Crosshairs = {
		-- None
		[0] = function () end,
		-- Cross
		[1] = function()
				surface.DrawLine(SW/2-CW-CG, SH/2, SW/2-CG, SH/2)
				surface.DrawLine(SW/2+CW+CG, SH/2, SW/2+CG, SH/2)
				surface.DrawLine(SW/2, SH/2-CH-CG, SW/2, SH/2-CG)
				surface.DrawLine(SW/2, SH/2+CH+CG, SW/2, SH/2+CG)
			end,
		-- T
		[2] = function()
				surface.DrawLine(SW/2-CW-CG, SH/2, SW/2-CG, SH/2)
				surface.DrawLine(SW/2+CW+CG, SH/2, SW/2+CG, SH/2)
				surface.DrawLine(SW/2, SH/2+CH+CG, SW/2, SH/2+CG)
			end,
		-- Circle
		[3] = function()
				surface.DrawCircle(SW/2, SH/2, CR, R, G, B, A)
			end,
	}

	surface.SetDrawColor(R, G, B, A)
	local DrawFn = Crosshairs[Style]
	if (DrawFn != nil) then 
		DrawFn()
	else
		GetConVar("cl_custom_crosshair_style"):SetInt(0)
	end

	if (CD == true) then draw.Circle(SW/2, SH/2, CDR, CS) end
end

function CustomCrosshair_Default()
	GetConVar("cl_custom_crosshair_style"):Revert()
	GetConVar("cl_custom_crosshair_red"):Revert()
	GetConVar("cl_custom_crosshair_green"):Revert()
	GetConVar("cl_custom_crosshair_blue"):Revert()
	GetConVar("cl_custom_crosshair_alpha"):Revert()
	GetConVar("cl_custom_crosshair_width"):Revert()
	GetConVar("cl_custom_crosshair_height"):Revert()
	GetConVar("cl_custom_crosshair_gap"):Revert()
	GetConVar("cl_custom_crosshair_radius"):Revert()
	GetConVar("cl_custom_crosshair_dot"):Revert()
	GetConVar("cl_custom_crosshair_dot_radius"):Revert()
	GetConVar("cl_custom_crosshair_dot_resolution"):Revert()
end
concommand.Add("cl_custom_crosshair_default", CustomCrosshair_Default,
		true, "Reset the custom crosshair to default settings", 0)

-- Standalone UI

function CustomCrosshair_Form()
   local margin = 15

   local dframe = vgui.Create("DFrame")
   local w, h = 630, 470
   dframe:SetSize(w, h)
   dframe:Center()
   dframe:SetTitle("Crosshair editor")
   dframe:ShowCloseButton(true)

   local dbut = vgui.Create("DButton", dframe)
   local bw, bh = 50, 25
   dbut:SetSize(bw, bh)
   dbut:SetPos(w - bw - margin, h - bh - margin/2)
   dbut:SetText("Close")
   dbut.DoClick = function() dframe:Close() end


   local dtabs = vgui.Create("DPropertySheet", dframe)
   dtabs:SetPos(margin, margin * 2)
   dtabs:SetSize(w - margin*2, h - margin*3 - bh)

	CustomCrosshair_GUITab(dtabs)
	
	dframe:MakePopup()
end
concommand.Add("cl_custom_crosshair_menu", CustomCrosshair_Form,
			true, "Open the custom crosshair editor", 0)

-- Hooks

if (GAMEMODE == "terrortown") then
	hook.Add("TTTSettingsTabs", "Custom crosshairs helpscrn hook", CustomCrosshair_GUITab)
	hook.Add("TTTCrosshairHook", "Custom crosshair hud", CustomCrosshair_Draw)
end
