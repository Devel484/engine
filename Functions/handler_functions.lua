local Handler = {};
local defaulcalls = {
    "OnFilterscriptExit",
    "OnGamemodeExit",
    "OnPlayerChangeAcrobatic",
    "OnPlayerChangeAdditionalVisual",
    "OnPlayerChangeArmor",
    "OnPlayerChangeClass",
    "OnPlayerChangeDexterity",
    "OnPlayerChangeFatness",
    "OnPlayerChangeGold",
    "OnPlayerChangeHealth",
    "OnPlayerChangeInstance",
    "OnPlayerChangeMana",
    "OnPlayerChangeMaxHealth",
    "OnPlayerChangeMaxMana",
    "OnPlayerChangeMeleeWeapon",
    "OnPlayerChangeRangedWeapon",
    "OnPlayerChangeScience",
    "OnPlayerChangeSkillWeapon",
    "OnPlayerChangeStrength",
    "OnPlayerChangeWalk",
    "OnPlayerChangeWorld",
    "OnPlayerCloseInventory",
    "OnPlayerCommandText",
    "OnPlayerConnect",
    "OnPlayerDeath",
    "OnPlayerDisconnect",
    "OnPlayerDropItem",
    "OnPlayerEnterWorld",
    "OnPlayerFocus",
    "OnPlayerHasItem",
    "OnPlayerHit",
    "OnPlayerKey",
    "OnPlayerMD5File",
    "OnPlayerOpenInventory",
    "OnPlayerResponseItem",
    "OnPlayerSelectClass",
    "OnPlayerSpawn",
    "OnPlayerSpellCast",
    "OnPlayerSpellSetup",
    "OnPlayerStandUp",
    "OnPlayerTakeItem",
    "OnPlayerText",
    "OnPlayerUnconscious",
    "OnPlayerUpdate",
    "OnPlayerUseItem",
    "OnPlayerWeaponMode",
	"OnPlayerChangeExperience",
	"OnPlayerChangeExperienceNextLevel",
	"OnPlayerChangeLearnPoints",
	"OnPlayerChangeLevel",
	"OnPlayerChangeMagicLevel",
};


--### AddEvent
--### Parameter:
--### func = Funktion die aufgerufen werden soll.
--### callback = Unter Welchem Callback die Funktion aufgerufen werden soll.
--### arg[1] = prio = Priorität 
--### # Priorität 0 = wird ans ende der Tabelle eingefügt(Tabellen größe +1);
--### # Priorität 1,2, .... ist die Position an die das Event eingefügt wird, 
--### # existiert ein Event mit der Priorität schon wird sie durch die Funktion table.insert einfach eins nach "hinten" geschoben.
--### arg[2] = otherevent = true/false = Ob andere Events auch aufgerufen werden sollen, oder ob abgebrochen werden soll.
function AddEvent(func, callback,...)
	if func and type(func)=="function" and callback and type(callback)=="string" and Handler[string.upper(callback)] then
		local prio, otherevent = 0, true;
		if arg[1] then	prio = arg[1] end
		if arg[2] then 	otherevent = arg[2] end
		if prio == 0 then prio = table.getn(Handler[string.upper(callback)]) + 1; end
		table.insert(Handler[string.upper(callback)], prio, {Function=func, Priority=prio, OtherEvents=otherevent});
	end
end

--### CallHandler
--### Parameter:
--### callback = Das Callback das aufgerufen wurde.
--### ... = Die Parameter(maximal 10 stück)
--### Spart Viele Zeilen im Script ;)
function CallHandler(callback, ...)
	if  Handler[string.upper(callback)] then
		for k in pairs(Handler[string.upper(callback)]) do
			Handler[string.upper(callback)][k].Function(arg[1], arg[2],arg[3], arg[4],arg[5], arg[6],arg[7], arg[8],arg[9], arg[10]);
			if Handler[string.upper(callback)][k].OtherEvents == false then break end
		end
	end
	local OldFunction = _G[table.concat({"Old", callback})];
	if type(OldFunction)=="function" then OldFunction(arg[1], arg[2],arg[3], arg[4],arg[5], arg[6],arg[7], arg[8],arg[9], arg[10]); end
end

--### DeleteAllEvents
--### Parameter:
--### callback = Unter welchem Callback alle Events gelöscht werden sollen.
--### Tabelle wird einfach zurück gesetzt(table = {})
function DeleteAllEvents(callback)
	if callback and type(callback)=="string" and Handler[string.upper(callback)] then 
		Handler[string.upper(callback)] = {};
	end
end

--### DeleteEvents
--### Parameter:
--### func = Welche Funktion gelöscht werden soll.
--### callback = Unter welchem Callback das Event gelöscht werden sollen.
--### Tabellezelle wird einfach  entfernt mit table.remove, damit "rutschen" alle anderen Events um ein nach vorne die sich nach diesem Event befinden.
function DeleteEvent(func, callback)
	if func and type(func)=="function" and callback and type(callback)=="string" and Handler[string.upper(callback)] then
		for k in pairs(Handler[string.upper(callback)]) do
			if Handler[string.upper(callback)][k].Function == func then table.remove(Handler[string.upper(callback)], k) end
		end
	end
end

--### GetEvents
--### Parameter:
--### callback = Welches Callback abgefragt werden soll.
--### return = den Tabelleninhalt
--### Diese Funktion ist für Anwendungen auserhalb dieses Scriptes gedacht, da Tabelle "Handler"  Lokal ist.
function GetEvents(callback)
	if callback and type(callback)=="string" and Handler[string.upper(callback)] then return Handler[string.upper(callback)] end
end

--### RegisterAllHandler
--### Damit kann man alle Callbacks Registieren.
--### Bisher nur die Standart Callbacks.
--### OnFilterscriptInit / OnGamemodeInit fehlen, da dieses Callback nicht abgefangen werden kann.
--### Kann aber anderst gelöst werden: Einfach nach dem Laden der Engine aufrufen lassen.
function RegisterAllHandler()
	--First the default Callbacks:
	for k,v in pairs(defaulcalls) do
		Handler[string.upper(v)]={};
	end
end

--### IsHandlerActive
--### Parameter:
--### callback = Welches Callback abgefragt werden soll.
--### return = true / false
--### Diese Funktion ist für Anwendungen auserhalb dieses Scriptes gedacht, da Tabelle "Handler"  Lokal ist.
function IsHandlerActive(callback)
	if Handler[string.upper(callback)] then return true end return false
end

--### RegisterHandler
--### Parameter:
--### callback = Welches Callback registiert werden soll.
--### Nur im Script auch abgefragte Callback können benutzt werden. Siehe Beispiel
function RegisterHandler(callback)
	if callback and type(callback)=="string" then
		Handler[string.upper(callback)]={};
	end
end

--### UnregisterAllHandler
--### Löscht alle Inhalte in der Tabelle.
function UnregisterAllHandler()
	Handler = {};
end

--### UnregisterHandler
--### Parameter:
--### callback = Welches Callback unregistiert werden soll.
--### Löscht den Tabellen Inhalte in der Hanlder-Tabelle.
function UnregisterHandler(callback)
	if callback and type(callback)=="string" and Handler[string.upper(callback)] then
		Handler[string.upper(callback)]=nil;
	end
end
