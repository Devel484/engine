--[[
	Russische Schrift : Kodierung Windows 1251
	Polnische Schrift : Kodierung Windows 1250
	Deutche Schrift : Kodierung Windows 1250
]]
--local Server = {Char={}};

if not IsModuleLoaded("Language") then
	print("ERROR: Can not load modul: Scale , because modul 'Language' is not loaded.")
	return false
end

local F = {};
local H = {};
local Player={};
-- Deutsch
H["FONT_DEFAULT.TGA"] = 18; 
H["FONT_OLD_10_WHITE.TGA"] = 18; 
H["FONT_OLD_10_WHITE_HI.TGA"] = 18; 
H["FONT_OLD_20_WHITE.TGA"] = 32; 
H["FONT_OLD_20_WHITE_HI.TGA"] = 32; 
H["FONT_10_BOOK.TGA"] = 17; 
H["FONT_10_BOOK_HI.TGA"] = 17; 
H["FONT_20_BOOK.TGA"] = 32; 
H["FONT_20_BOOK_HI.TGA"] = 32; 

-- Polnisch
H["FONT_DEFAULT_PL.TGA"] = 18; 
H["FONT_OLD_10_WHITE_PL.TGA"] = 18; 
H["FONT_OLD_10_WHITE_HI_PL.TGA"] = 18; 
H["FONT_OLD_20_WHITE_PL.TGA"] = 32; 
H["FONT_OLD_20_WHITE_HI_PL.TGA"] = 32; 
H["FONT_10_BOOK_PL.TGA"] = 17; 
H["FONT_10_BOOK_HI_PL.TGA"] = 17; 
H["FONT_20_BOOK_PL.TGA"] = 32; 
H["FONT_20_BOOK_HI_PL.TGA"] = 32; 

--Russisch
H["FONT_DEFAULT_PL.TGA"] = 19; 
H["FONT_OLD_10_WHITE_PL.TGA"] = 19; 
H["FONT_OLD_10_WHITE_HI_PL.TGA"] = 19; 
H["FONT_OLD_20_WHITE_PL.TGA"] = 36; 
H["FONT_OLD_20_WHITE_HI_PL.TGA"] = 36; 
H["FONT_10_BOOK_PL.TGA"] = 18; 
H["FONT_10_BOOK_HI_PL.TGA"] = 18; 
H["FONT_20_BOOK_PL.TGA"] = 36; 
H["FONT_20_BOOK_HI_PL.TGA"] = 36; 

dofile("engine/Include/Scale/Windows-1251.luac");

function InitTextureFontData()
	local t = {"FONT_DEFAULT.TGA", "FONT_10_BOOK.TGA", "FONT_10_BOOK_HI.TGA","FONT_20_BOOK.TGA", "FONT_20_BOOK_HI.TGA", "FONT_OLD_10_WHITE.TGA", "FONT_OLD_10_WHITE_HI.TGA", "FONT_OLD_20_WHITE.TGA", "FONT_OLD_20_WHITE_HI.TGA",}
	local l = {".luac", "_PL.luac", "_RU.luac"};
	for l, m in pairs(l) do
		for k,v in pairs(t) do
			local file = table.concat({string.sub(v, 1, -5), m});
			local font = table.concat({string.sub(file, 1, -5), ".TGA"});
			F[string.upper(font)]=dofile("engine/Include/Scale/"..file.."");
		end
	end
end
AddEvent(InitTextureFontData, "OnServerStart");

function InitScalePlayerVars(playerid)
	Player[playerid]={};
	Player[playerid].ScaleX = nil;
	Player[playerid].ScaleY = nil;
end
AddEvent(InitScalePlayerVars, "OnPlayerConnect");

local function GetLanguageFont(lang, font)
	if lang and font then
		if lang == "PL" or lang == "RU" then
			return table.concat({string.sub(font, 1, -5), ""..lang..".TGA"});
		else
			return font;
		end
	end
end

function GetPlayerTextX(playerid, font, text)
	if playerid and font and text then
		local x = 0;
		local scale = Player[playerid].ScaleX; if scale == nil then scale = 5.63; end
		local lang = GetPlayerLanguage(playerid);
		font = string.upper(GetLanguageFont(lang, font));
		local bytes;
		if lang == "RU" then
			bytes = GetTextBytesRU(text);
		else
			bytes = GetTextBytes(text);
		end
		if bytes and F[font] then
			for k,v in pairs(bytes) do
				if F[font][v] then
					x = x + F[font][v];
				end
			end
		end
		return x;
	end
end

function GetTextBytes(text)
	local t = {};
	if text then
		for i=1, #text do
			table.insert(t, string.byte(string.sub(text, i, i)));
		end
	end
	return t;
end

function GetPlayerTextY(playerid, font)
	if playerid and font then
		local scale = Player[playerid].ScaleY;
		if scale == nil then
			scale = 10;
		end
		local lang = GetPlayerLanguage(playerid);
		font = GetLanguageFont(lang, font);
		if H[string.upper(font)] then
			return Server.Char_Height[string.upper(font)]*scale;
		end
	end
end

print("Modul: Scale\t\tv0.1\tloaded")