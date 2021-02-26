-- cvars.lua

if (not ConVarExists("cl_custom_crosshair")) then
	CreateClientConVar("cl_custom_crosshair", "1", true, false,
			"Enable/Disable the custom crosshair", 0, nil)
end

if (not ConVarExists("cl_custom_crosshair_reactive")) then
	CreateClientConVar("cl_custom_crosshair_reactive", "0", true, false,
			"Make the crosshair respond to movement and recoil", 0, 1)
end

-- Crosshair colours

if (not ConVarExists("cl_custom_crosshair_red")) then
	CreateClientConVar("cl_custom_crosshair_red", "255", true, false, 
			"Set the red attribute of the custom crosshair", 0, 255)
end

if (not ConVarExists("cl_custom_crosshair_green")) then
	CreateClientConVar("cl_custom_crosshair_green", "255", true, false, 
			"Set the green attribute of the custom crosshair", 0, 255)
end

if (not ConVarExists("cl_custom_crosshair_blue")) then
	CreateClientConVar("cl_custom_crosshair_blue", "255", true, false, 
			"Set the blue attribute of the custom crosshair", 0, 255)
end

if (not ConVarExists("cl_custom_crosshair_alpha")) then
	CreateClientConVar("cl_custom_crosshair_alpha", "255", true, false, 
			"Set the alpha attribute of the custom crosshair", 0, 255)
end

-- Crosshair styling

if (not ConVarExists("cl_custom_crosshair_style")) then
	CreateClientConVar("cl_custom_crosshair_style", "1", true, false,
			"Set the custom crosshair style", 0, nil)
end

if (not ConVarExists("cl_custom_crosshair_width")) then
	CreateClientConVar("cl_custom_crosshair_width", "10", true, false,
			"Set the custom crosshair width", 1, nil)
end

if (not ConVarExists("cl_custom_crosshair_height")) then
	CreateClientConVar("cl_custom_crosshair_height", "10", true, false,
			"Set the custom crosshair height", 1, nil)
end

if (not ConVarExists("cl_custom_crosshair_gap")) then
	CreateClientConVar("cl_custom_crosshair_gap", "10", true, false,
			"Change the crosshair gap", 0, 32)
end

if (not ConVarExists("cl_custom_crosshair_radius")) then
	CreateClientConVar("cl_custom_crosshair_radius", "10", true, false,
			"Set the custom crosshair radius", 1, nil)
end

-- Crosshair dot

if (not ConVarExists("cl_custom_crosshair_dot")) then
	CreateClientConVar("cl_custom_crosshair_dot", "0", true, false,
			"Enable the crosshair dot", 0, 1)
end

if (not ConVarExists("cl_custom_crosshair_dot_radius")) then
	CreateClientConVar("cl_custom_crosshair_dot_radius", "1", true, false,
			"Enable the crosshair dot", 1, 16)
end

if (not ConVarExists("cl_custom_crosshair_dot_resolution")) then
	CreateClientConVar("cl_custom_crosshair_dot_resolution", "16", true, false,
			"Set the custom crosshair dot resolution", 4, 64)
end


