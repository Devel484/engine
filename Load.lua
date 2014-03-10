local Module = {};

function InitGamemodeEngine(Setting)
	require("engine/Callbacks/default");
	require("engine/Callbacks/new")
	require("engine/Functions/handler_functions");
	require("engine/Functions/timer_functions");
	require("engine/Functions/gui_functions");
	for k,v in pairs(Setting.LoadModule) do
		LoadModule(v);
	end
	CallHandler("OnServerStart");
end

function LoadModule(module)
	if module and type(module) == "string" then
		if require("engine/Module/"..module.."") then
			Module[module] = true;
		end
	end
end

function IsModuleLoaded(module)
	if module and type(module) == "string" then
		if Module[module] then return true end
	end
	return false
end