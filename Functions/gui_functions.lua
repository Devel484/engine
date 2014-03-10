local Draw = {};
local Texture = {};
local Player = {};

function InitGUIVars(playerid)
	Player[playerid]={};
end
AddEvent(InitGUIVars, "OnPlayerConnect");

OldCreateDraw = CreateDraw;
function _CreateDraw(x, y, text, font, r, g, b,class)
	if x and y and text then
		if not font then font="Font_default.tga" end
		if not r then r=255 end
		if not g then g=255 end
		if not b then b=255 end
		if string.upper(string.sub(font, -3)) == ".TGA" then
			local ID = OldCreateDraw(x, y, text, font, r,g,b);
			if ID >= 0 then
				Draw[ID] = {X=x, Y=y, Text=text, Font=font, Red=r, Green=g, Blue=b, Class = class, Shown = {}};
				return ID;
			else
				if table.getn(Draw)-1 >= GetMaxDraws() then
					print("Konnte Draw nicht erstellen: Es müssen mehr Draws zugewiesen werden! MaxDraws:", GetMaxDraws());
				else
					print("Konnte Draw nicht erstellen");
				end
			end
		else	
			print("Es wurde versucht die Funktion: CreateDraw mit einem falschem Fon-Format zu öffnen! -> .TGA benötigt erhalten:", font);
		end
	end
	return -1;
end
CreateDraw = _CreateDraw;

function DestroyAllDraws()
	for i=0, GetMaxDraws() do
		OldDestroyDraw(i);
	end
	Draw={};
end

OldDestroyDraw = DestroyDraw;
function _DestroyDraw(ID)
	if ID then
		if type(ID) == "number" then
			OldDestroyDraw(ID);
			Draw[ID] = nil;
		elseif type(ID) == "string" then
			local class = ID;
			for k in pairs(Draw) do
				if Draw[k].Class == class then
					OldDestroyDraw(k);
				end
			end
		end
	end
end
DestroyDraw = _DestroyDraw;

OldUpdateDraw = UpdateDraw;
function _UpdateDraw(ID, ...)
	if ID and table.getn(arg) >= 1 then
		local x, y, text, font, r, g, b, class;
		if type(arg[1]) == "table" then
			local info = GetDrawInfo(ID);
			if arg[1].X then x = arg[1].X; else x=info.X end
			if arg[1].Y then y = arg[1].Y; else y=info.Y end
			if arg[1].Text then text = arg[1].Text else text=info.Text end
			if arg[1].Font then font = arg[1].Font else font=info.Font end
			if arg[1].Red then r = arg[1].Red else r = info.Red end
			if arg[1].Green then g = arg[1].Green else g = info.Green end
			if arg[1].Blue then b = arg[1].Blue else b = info.Blue end
			if arg[1].Class then class = arg[1].Class else class = info.Class end
		else
			if table.getn(arg) >= 7 then
				x = arg[1]; y = arg[2]; text = arg[3]; font = arg[4]; r=arg[5]; g=arg[6]; b = arg[7]; class = arg[8];
			end
		end
		if x and y and text and font and r and g and b then
			if string.upper(string.sub(font, -3)) == ".TGA" then
				OldUpdateDraw(ID, x, y, text, font, r, g, b);
				local shown = Draw[ID].Shown;
				Draw[ID] = {X=x, Y=y, Text=text, Font=font, Red=r, Green=g, Blue=b, Class = class, Shown = shown};
			else	
				print("Es wurde versucht die Funktion: CreateDraw mit einem falschem Fon-Format zu öffnen! -> .TGA benötigt erhalten:", font);
			end
		else
			print("Fehler bei dem Draw:", ID, x , y , text , font , r , g , b);
		end
	end
end
UpdateDraw = _UpdateDraw;

OldShowDraw = ShowDraw;
function _ShowDraw(playerid, ID)
	if playerid and ID then
		if type(ID)=="number" then
			OldShowDraw(playerid, ID);
			Draw[ID].Shown[playerid]=true;
		elseif type(ID)=="string" then
			local class = ID;
			for k in pairs(Draw) do
				if class == Draw[k].Class then
					OldShowDraw(playerid, k);
					Draw[k].Shown[playerid]=true;
				end
			end
		end
	end
end
ShowDraw = _ShowDraw;

OldHideDraw = HideDraw;
function _HideDraw(playerid, ID)
	if playerid and ID then
		if type(ID)=="number" then
			OldHideDraw(playerid, ID);
			Draw[ID].Shown[playerid]=nil;
		elseif type(ID)=="string" then
			local class = ID;
			for k in pairs(Draw) do
				if class == Draw[k].Class then
					OldHideDraw(playerid, k);
					Draw[k].Shown[playerid]=nil;
				end
			end
		end
	end
end
HideDraw = _HideDraw;

function GetDrawInfo(ID)
	if Draw[ID] then return Draw[ID] end
end

OldCreatePlayerDraw = CreatePlayerDraw;
function _CreatePlayerDraw(playerid, x,y,text, font, r, g, b, class)
	if playerid and x and y and text then
		local r, g, b, class;
		if not font then font="Font_default.tga" end
		if not r then r=255 end
		if not g then g=255 end
		if not b then b=255 end
		if string.upper(string.sub(font, -3)) == ".TGA" then
			local ID = OldCreatePlayerDraw(playerid, x, y, text, font, r, g, b);
			if ID >= 0 then
				Player[playerid][ID] = {X=x, Y=y, Text=text, Font=font, Red=r, Green=g, Blue=b, Class = class, Shown = false};
				return ID;
			else
				if table.getn(Draw)-1 >= GetMaxDraws() then
					print("Konnte Draw nicht erstellen: Es müssen mehr Draws zugewiesen werden! MaxDraws:", GetMaxDraws());
				else
					print("Konnte Draw nicht erstellen");
				end
			end
		else	
			print("Es wurde versucht die Funktion: CreatePlayerDraw mit einem falschem Fon-Format zu öffnen! -> .TGA benötigt erhalten:", font);
		end
	end
	return -1;
end
CreatePlayerDraw = _CreatePlayerDraw;

OldUpdatePlayerDraw = UpdatePlayerDraw;
function _UpdatePlayerDraw(playerid, ID, ...)
	if playerid and ID and Player[playerid][ID] then
		local x, y, text, font, r, g, b, class;
		local info = GetPlayerDrawInfo(playerid, ID);
		if type(arg[1])=="table" then
			if arg[1].X then x = arg[1].X; else x=info.X end
			if arg[1].Y then y = arg[1].Y; else y=info.Y end
			if arg[1].Text then text = arg[1].Text else text=info.Text end
			if arg[1].Font then font = arg[1].Font else font=info.Font end
			if arg[1].Red then r = arg[1].Red else r = info.Red end
			if arg[1].Green then g = arg[1].Green else g = info.Green end
			if arg[1].Blue then b = arg[1].Blue else b = info.Blue end
			if arg[1].Class then class = arg[1].Class else class = info.Class end
		else
			if table.getn(arg) >= 7 then
				x = arg[1]; y = arg[2]; text = arg[3]; font = arg[4]; r=arg[5]; g=arg[6]; b = arg[7]; class = arg[8];
			end
		end
		if x and y and text and font and r and g and b then
			if string.upper(string.sub(font, -3)) == ".TGA" then
				OldUpdatePlayerDraw(playerid, ID, x, y, text, font, r, g, b);
				local shown = Player[playerid][ID].Shown;
				Draw[ID] = {X=x, Y=y, Text=text, Font=font, Red=r, Green=g, Blue=b, Class = class, Shown = shown};
			else	
				print("Es wurde versucht die Funktion: UpdatePlayerDraw mit einem falschem Font-Format zu öffnen! -> .TGA benötigt erhalten:", font);
			end
		else
			print("Fehler bei dem Player-Draw:", ID, x , y , text , font , r , g , b);
		end
	end
end
UpdatePlayerDraw = _UpdatePlayerDraw;

OldDestroyPlayerDraw = DestroyPlayerDraw;
function _DestroyPlayerDraw(playerid, ID)
	if playerid and ID then
		if type(ID)== "number" then
			OldDestroyPlayerDraw(playerid, ID);
			Player[playerid][k]=ID;
		elseif type(ID)=="string" then
			local class = ID;
			for k in pairs(Player[playerid]) do
				if Player[playerid][k].Class == class then
					OldDestroyPlayerDraw(playerid, k);
					Player[playerid][k]=nil;
				end
			end
		end
	end
end
DestroyPlayerDraw = _DestroyPlayerDraw;

function GetPlayerDrawInfo(playerid, ID)
	return Player[playerid][ID];
end

OldShowPlayerDraw = ShowPlayerDraw;
function _ShowPlayerDraw(playerid, ID)
	if playerid and ID then
		if type(ID)=="number" then
			OldShowPlayerDraw(playerid, ID);
			Player[playerid][ID].Shown = true;
		elseif type(ID)=="string" then
			local class = ID;
			for k in pairs(Player[playerid]) do
				if Player[playerid][k].Class == class then
					OldShowPlayerDraw(playerid, k);
					Player[playerid][k].Shown = true;
				end
			end
		end
	end
end
ShowPlayerDraw = _ShowPlayerDraw;

OldHidePlayerDraw = HidePlayerDraw;
function _HidePlayerDraw(playerid, ID)
	if playerid and ID then
		if type(ID)=="number" then
			OldHidePlayerDraw(playerid, ID);
			Player[playerid][ID].Shown = false;
		elseif type(ID)=="string" then
			local class = ID;
			for k in pairs(Player[playerid]) do
				if Player[playerid][k].Class == class then
					OldHidePlayerDraw(playerid, k);
					Player[playerid][k].Shown = false;
				end
			end
		end
	end
end
HidePlayerDraw =_HidePlayerDraw;

OldDestroyAllPlayerDraws = DestroyAllPlayerDraws;
function _DestroyAllPlayerDraws(playerid)
	if playerid then
		OldDestroyAllPlayerDraws(playerid);
		Player[playerid]={};
	end
end
DestroyAllPlayerDraws = _DestroyAllPlayerDraws;

local function GetNextTextureID()
	for i = 0, GetMaxTextures() do
		if Texture[i] == nil then return i end
	end
	return -1;
end

OldCreateTexture=CreateTexture;
function _CreateTexture(x, y, width, height, tex, class)
	if x and y and width and height and tex then
		if string.upper(string.sub(font, -3)) == ".TGA" then
			local ID = OldCreateTexture(x, y, width, heigth, tex);
			if ID >= 0 then
				local tabID = GetNextTextureID();
				Texture[tabID] = {ID=ID, X=x, Y=y, Width=width, Height = height, Texture = tex, Class = Class, Shown={}};
				return tabID;
			else
				if table.getn(Texture)-1 >= GetMaxTextures() then
					print("Es muss mehr Texturen zu gewiesen werden!(MaxTextures)");
				else
					print("Es konnte keine Texture erstellt werden.");
				end
			end
		else
			print("Es wurde versucht die Funktion: CreateTexture mit einem falschem Texture-Format zu öffnen! -> .TGA benötigt erhalten:", font);
		end
	end
end
CreateTexture=_CreateTexture;

OldDestroyTexture = DestroyTexture;
function _DestroyTexture(tabID)
	if tabID then
		if type(tabID)=="number" then
			if Texture[tabID] then
				local ID = Texture[tabID];
				OldDestroyTexture(ID);
				Texture[tabID] = nil;
			end
		elseif type(tabID)=="string" then
			local class = tabID;
			for k in pairs(Texture) do
				if class == Texture[k].Class then
					local ID = Texture[k].ID;
					OldDestroyTexture(ID);
					Texture[tabID]=nil;
				end
			end
		end
	end
end
DestroyTexture =_DestroyTexture;

function DestroyAllTextures()
	for i=0, GetMaxTextures() do
		OldDestroyTexture(i);
	end
	Texture = {};
end

OldShowTexture = ShowTexture;
function _ShowTexture(playerid, tabID)
	if playerid and tabID then
		if type(tabID)=="number" then
			if Texture[tabID] then
				local ID = Texture[tabID].ID;
				OldShowTexture(playerid, ID);
				Texture[tabID].Shown[playerid] = true;
			end
		elseif type(tabID)=="string" then
			local class = tabID;
			for k in pairs(Texture) do
				if Texture[k].Class == class then
					local ID = Texture[k].ID;
					OldShowTexture(playerid, ID);
					Texture[tabID].Shown[playerid] = true;
				end
			end
		end
	end
end
ShowTexture = _ShowTexture;

OldHideTexture = HideTexture;
function _HideTexture(playerid, tabID)
	if playerid and tabID then
		if type(tabID)=="number" then
			if Texture[tabID] then
				local ID = Texture[tabID].ID;
				OldHideTexture(playerid, ID);
				Texture[tabID].Shown[playerid] = nil;
			end
		elseif type(tabID)=="string" then
			local class = tabID;
			for k in pairs(Texture) do
				if Texture[k].Class == class then
					local ID = Texture[k].ID;
					OldHideTexture(playerid, ID);
					Texture[tabID].Shown[playerid] = nil;
				end
			end
		end
	end
end
HideTexture = _HideTexture;

function GetTextureInfo(tabID)
	if Texture[tabID] then return Texture[tabID] end
end

function UpdateTexture(tabID, ...)
	if tabID then
		local x, y, width, height, tex, class;
		if type(arg[1]) == "table" then
			local info = GetTextureInfo(tabID);
			if arg[1].X then x = arg[1].X else x = info.X end
			if arg[1].Y then y = arg[1].Y else y = info.Y end
			if arg[1].Width then width = arg[1].Width else width = info.Width end
			if arg[1].Height then height = arg[1].Height else height = info.Height end
			if arg[1].Texture then tex = arg[1].Texture else tex = info.Texture end
			if arg[1].Class then class = arg[1].Class end
		else
			x = arg[1]; y = arg[2]; width = arg[3]; height = arg[4]; tex = arg[5]; class = arg[6];
		end
		if x and y and width and height and tex then
			if string.upper(string.sub(font, -3)) == ".TGA" then
				if table.getn(Texture) >= GetMaxTextures()-1 then
					print("Funktion UpdateTexture kann nicht ausgeführt werden, da zu wenig Texturen zu gewiesen wurden!(MaxTextures)");
				else
					OldDestroyTexture(Texture[tabID].ID);
					SetTimerEx("UpdateTexturePart2", 100, 0, tabID, x, y, width, height, tex, class);
				end
			else
				print("Es wurde versucht die Funktion: CreateTexture mit einem falschem Texture-Format zu öffnen! -> .TGA benötigt erhalten:", font);
			end
		end
	end
end

function UpdateTexturePart2(tabID, x, y, width, height, tex, class)
	local info = GetTextureInfo(tabID);
	local ID = OldCreateTexture(x, y, width, height, tex);
	if ID >= 0 then
		Texture[tabID] = {ID = ID, X=x, Y=y, Width=width,Height=height,Texture=tex, Class=class, Shown=info.Shown};
		for playerid in pairs(Texture[tabID].Shown) do
			OldShowTexture(playerid, ID);
		end
	else
		print("UpdateTexture Fehlgeschlagen!", tabID, x, y, width, height, tex, class);
	end
end