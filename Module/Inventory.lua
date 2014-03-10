--[[
Written by Devel
Module: Inventory 
Version: 0.1
]]


local Inventory = {};
local Player = {};

function InitInventoryVars(playerid)
	Inventory[playerid]={};
	Player[playerid] = {};
	Player[playerid].InventoryUpdate = {};
end
AddEvent(InitInventoryVars, "OnPlayerConnect");

local function IsItemInInventory(playerid, item)
	for k,v in pairs(Inventory[playerid]) do
		if Inventory[playerid][k].Item == string.upper(item) then return k end
	end
	return false
end

local function AddItem(playerid, item, amount)
	local ID = IsItemInInventory(playerid, item);
	if ID then
		Inventory[playerid][ID].Amount = Inventory[playerid][ID].Amount + amount;
	else
		if Inventory[playerid][0] == nil then
			table.insert(Inventory[playerid], 0,{Item = string.upper(item), Amount = amount, Equipped = false});
		else
			table.insert(Inventory[playerid], {Item = string.upper(item), Amount = amount, Equipped = false});
		end
	end
end

local function RemoveItem(playerid, item, amount)
	local ID = IsItemInInventory(playerid, item);
	if ID then
		Inventory[playerid][ID].Amount = Inventory[playerid][ID].Amount - amount;
		if Inventory[playerid][ID].Amount <= 0 then
			table.remove(Inventory[playerid], ID);
		end
	end
end

local function ChangeEquipment(playerid, curritem, oldItem)
	local ID = IsItemInInventory(playerid, curritem);
	if ID then
		Inventory[playerid][ID].Equipped = true;
	end
	ID = IsItemInInventory(playerid, oldItem);
	if ID then
		Inventory[playerid][ID].Equipped = false;
	end
end

function PlayerChangeEquipment(playerid, currItem, oldItem)
	ChangeEquipment(playerid, curritem, oldItem);
end
AddEvent(PlayerChangeEquipment, "OnPlayerChangeArmor");
AddEvent(PlayerChangeEquipment, "OnPlayerChangeMeleeWeapon");
AddEvent(PlayerChangeEquipment, "OnPlayerChangeRangedWeapon");

function PlayerGetItem(playerid, itemID, itemInstance, amount, x, y, z, worldName)
	if itemID >= 0 then
		AddItem(playerid, itemInstance, amount);
	end
end
AddEvent(PlayerGetNewItem, "OnPlayerTakeItem");

function PlayerLoseItem(playerid, itemid, item_instance, amount, x, y, z, worldName)
	if itemID >= 0 then
		RemoveItem(playerid, item_instance, amount);
	end
end
AddEvent(PlayerLoseItem, "OnPlayerDropItem");

function PlayerLoseItemByUsing(playerid, itemInstance, amount, hand)
	RemoveItem(playerid, itemInstance, amount);
end
AddEvent(PlayerLoseItemByUsing, "OnPlayerUseItem");

function ShowInventory(playerid)
	local Inv = GetInventory(playerid);
	for k,v in pairs(Inv) do
		print(k,Inv[k].Item, Inv[k].Amount, Inv[k].Equipped);
	end
end

function GetInventory(playerid)
	return Inventory[playerid];
end

function UpdateInventory(playerid, weaponmode)
	if (Player[playerid].Update == nil or Player[playerid].Update == false) and (weaponmode == nil or weaponmode == WEAPON_NONE)then
		Player[playerid].Update = true;
		for i=0, 24, 1 do
			GetPlayerItem(playerid, i);
		end
	end
end
AddEvent(UpdateInventory, "OnPlayerCloseInventory");
AddEvent(UpdateInventory, "OnPlayerWeaponMode");

function PlayerUpdateInventory(playerid, slot, item_instance, amount, equipped)
	if Player[playerid].UpdateInventory == true then
		item_instance =  string.upper(item_instance);
		if item_instance ~= "NULL" then
			local equip = false;
			if equipped == 1 then equip = true; end
			Player[playerid].InventoryUpdate[slot] = {Item=item_instance, Amount=amount, Equipped=equip};
			GetPlayerItem(playerid,slot+1);
			if (slot+1) % 25 == 0 then
				for i=slot+1, slot+25, 1 do
					GetPlayerItem(playerid, i);
				end
			end
		else
			Inventory[playerid] = Player[playerid].InventoryUpdate;
			Player[playerid].InventoryUpdate = {};
			Player[playerid].UpdateInventory = false;
		end
	end
end
AddEvent(PlayerUpdateInventory, "OnPlayerResponseItem");

function GivePlayerInventory(playerid, tab)
	if playerid and tab then
		ClearInventory(playerid);
		for k,v in pairs(tab) do
			if tab[k].Equipped == true then
				EquipItem(playerid, tab[k].Item);
				if tab[k].Amount > 1 then
					GiveItem(playerid, tab[k].Item, tab[k].Amount-1);
				end
			else
				GiveItem(playerid, tab[k].Item, tab[k].Amount);
			end
		end
		UpdatePlayerInventory(playerid);
	end
end

function OwnPlayerItem(playerid, item, amount)
	if amount == nil then amount = 0; end
	item = string.upper(item);
	local Inv = GetPlayerInventory(playerid);
	for k,v in pairs(Inv) do
		local item_code = string.upper(Inv[k].Item);
		if item_code == item then
			if Inv[k].Amount >= amount then return true end
		end
	end
	return false;
end

OldClearInventory = ClearInventory;
function _ClearInventory(playerid)
	Inventory[playerid] = {};
	OldClearInventory(playerid);
end
ClearInventory = _ClearInventory;

print("Modul: Inventory v0.1 loaded");
return true