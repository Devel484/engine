local Timer = {};

--### GetNextTimerID
--### Geht die Tabelle "Timer" durch un sucht die erste leere Tabellenzelle, das wird die nächste TimerID sein, wenn nicht wird -1 zurück gebeben.
--### return: ID / -1 

local function GetNextTimerID()
	for i=0, GetMaxTimers(), 1 do
		if Timer[i]==nil then return i end
	end
	return -1;
end


--### KillTimer
--### Überarbeitet die Funktion und löscht bei ausführung die Tabellenzelle mit der ID.
OldKillTimer = KillTimer;
function _KillTimer(ID)
	if ID then
		OldKillTimer(ID);
		Timer[ID]=nil;
	end
end
KillTimer=_KillTimer;

--### SetTimerEx
--### Überarbeitet die Vorhandene Funktion.
--### Parameter:
--### func = Function = string Name der Funktion
--### tim = Time = die Zeit die in MS.
--### rep = Repeat = 1/0;
--### ... = Alle restlichen Parameter die übergeben werden sollen.
--### Die Funktion ruft nach ablauf der Zeit die Funktion "TimerEnds" auf erst in dieser Funktion wird die zu aufrufende Funktion erwähnt.
OldSetTimerEx = SetTimerEx;
function _SetTimerEx(func, tim, rep, ...)
	if func and tim and rep then
		if type(func)=="string" and type(_G[func])=="function" then
			local ID = GetNextTimerID();
			if ID >= 0 then
				local timerid = OldSetTimerEx("TimerEnds", tim, rep, ID);
				if timerid == ID then
					Timer[ID]={};
					Timer[ID].Function = _G[func];
					Timer[ID].Repeat = rep;
					Timer[ID].Parameter = arg;
					return ID;
				else
					print("ERROR: Funktion hat eine Falsche TimerID vorhergesagt!", ID, timerid);
				end
			end
		end
	end
end
SetTimerEx=_SetTimerEx;

--### SetTimer
--### Ruft die Funktion SetTimerEx auf.
OldSetTimer=SetTimer;
function _SetTimer(func, tim, rep, ...)
	SetTimerEx(func, tim, rep, ...);
end
SetTimer=_SetTimer;

--### TimerEnds
--### Letzte schritt vom Timer, hier wird die zu aufrufende Funktion erwähnt.
--### Parameter:
--### ID = Die ID des Timers.
--### Sollten mehr als 10 Parameter angeben werden so werden alle Parameter in einer Tabelle weitergeben -> Das heißt die funktion wird nur mit einem Parameter aufgerufen(table) ansonsten werden bis zu 10 Parameter weitergeben.
function TimerEnds(ID)
	if Timer[ID] then
		if table.getn(Timer[ID].Parameter) > 10 then
			Timer[ID].Function(Timer[ID].Paramter);
		else
			local a = Timer[ID].Parameter;
			Timer[ID].Function(a[1], a[2], a[3], a[4],a[5], a[6],a[7], a[8],a[9], a[10]);
		end
		if Timer[ID].Repeat == 0 then Timer[ID] = nil end
	end
end

