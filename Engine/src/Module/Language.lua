local Player = {};
local ServerLanguage = "NONE";
-- 1 / DE / German 	= Deutsch
-- 2 / EN / English = English
-- 3 / PL / Polish 	= Polnisch
-- 4 / RU / Russian = Russian
-- Sprachenkürzel nach RFC 1766 =  Diese Sprachenkürzel basieren auf den Normen nach unten ISO 639-1 zur Kurzbezeichnung von Sprachen und nach unten ISO 3166-1 zur Kurzbezeichnung von Ländern.

function InitLanguageVars(playerid)
	Player[playerid] = {};
	Player[playerid].Language = GetDefaultLanguage();
end
AddEvent(InitLanguageVars, "OnPlayerConnect");

function SetDefaultLanguage(lan)
	if type(lan) == "number" then
		if lan == 1 then
			ServerLanguage = "DE"; return true
		elseif lan == 2 then
			ServerLanguage = "EN"; return true
		elseif lan == 3 then 
			ServerLanguage = "PL"; return true
		elseif lan == 4 then
			ServerLanguage = "RU"; return true
		end
	elseif type(lan) == "string" then
		lan = string.upper(lan);
		if lan == "DE" or lan == "GERMAN" then
			ServerLanguage = "DE"; return true
		elseif lan == "EN" or lan == "ENGLISH" then
			ServerLanguage = "EN"; return true
		elseif lan == "PL" or lan == "POLISH" then
			ServerLanguage = "PL"; return true
		elseif lan == "RU" or lan == "RUSSIAN" then
			ServerLanguage = "RU"; return true
		end
	end
	return false
end

function GetDefaultLanguage()
	return ServerLanguage;
end

function SetPlayerLanguage(playerid, ...)
	if playerid and arg[1] then
		if type(arg[1]) == "number" then
		if arg[1] == 1 then
			Player[playerid].Language = "DE"; return true
		elseif arg[1] == 2 then
			Player[playerid].Language = "EN"; return true
		elseif arg[1] == 3 then
			Player[playerid].Language = "PL"; return true
		elseif arg[1] == 4 then 
			Player[playerid].Language = "RU"; return true
		end
		elseif  type(arg[1]) == "string" then
			local lan = string.upper(arg[1]);
			if lan == "DE" or lan == "GERMAN" then
				Player[playerid].Language = "DE"; return true
			elseif lan == "EN" or lan == "ENGLISH" then
				Player[playerid].Language = "EN"; return true
			elseif lan == "PL" or lan == "POLISH" then
				Player[playerid].Language = "PL"; return true
			elseif lan == "RU" or lan == "RUSSIAN" then
				Player[playerid].Language = "RU"; return true
			end
		end
	end
	return false
end

function GetPlayerLanguage(playerid)
	if playerid then
		return Player[playerid].Language;
	end
end

print("Modul: Language\t\tv0.1\tloaded")