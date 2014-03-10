OldOnFilterscriptExit = OnFilterscriptExit;
function _OnFilterscriptExit()
	CallHandler("OnFilterscriptExit");
end
OnFilterscriptExit = _OnFilterscriptExit;

OldOnGamemodeExit = OnGamemodeExit;
function _OnGamemodeExit()
	CallHandler("OnGamemodeExit");
end
OnGamemodeExit = _OnGamemodeExit;

OldOnPlayerChangeAcrobatic = OnPlayerChangeAcrobatic;
function _OnPlayerChangeAcrobatic(playerid, currAcrobatic, oldAcrobatic)
	CallHandler("OnPlayerChangeAcrobatic", playerid, currAcrobatic, oldAcrobatic);
end
OnPlayerChangeAcrobatic = _OnPlayerChangeAcrobatic;

OldOnPlayerChangeAdditionalVisual = OnPlayerChangeAdditionalVisual;
function _OnPlayerChangeAdditionalVisual(playerid, currBodyModel, currBodyTexture, currHeadModel, currHeadTexture, oldBodyModel, oldBodyTexture, oldHeadModel, oldHeadTexture)
	CallHandler("OnPlayerChangeAdditionalVisual", playerid, currBodyModel, currBodyTexture, currHeadModel, currHeadTexture, oldBodyModel, oldBodyTexture, oldHeadModel, oldHeadTexture);
end
OnPlayerChangeAdditionalVisual = _OnPlayerChangeAdditionalVisual;

OldOnPlayerChangeArmor = OnPlayerChangeArmor;
function _OnPlayerChangeArmor(playerid, currArmor, oldArmor)
 	CallHandler("OnPlayerChangeArmor", playerid, currArmor, oldArmor);
end
OnPlayerChangeArmor = _OnPlayerChangeArmor;

OldOnPlayerChangeClass=OnPlayerChangeClass;
function _OnPlayerChangeClass(playerid, classid)
 	CallHandler("OnPlayerChangeClass", playerid, classid);
end
OnPlayerChangeClass= _OnPlayerChangeClass;

OldOnPlayerChangeDexterity=OnPlayerChangeDexterity;
function _OnPlayerChangeDexterity(playerid, currDexterity, oldDexterity)
 	CallHandler("OnPlayerChangeDexterity", playerid, currDexterity, oldDexterity);
end
OnPlayerChangeDexterity=_OnPlayerChangeDexterity;

OldOnPlayerChangeExperience = OnPlayerChangeExperience;
function _OnPlayerChangeExperience(playerid, currExp, oldExp)
	CallHandler("OnPlayerChangeExperience", playerid, currExp, oldExp);
end
OnPlayerChangeExperience = _OnPlayerChangeExperience;

OldOnPlayerChangeExperienceNextLevel = OnPlayerChangeExperienceNextLevel;
function _OnPlayerChangeExperienceNextLevel(playerid, currExp, oldExp)
	CallHandler("OnPlayerChangeExperienceNextLevel", playerid, currExp, oldExp);
end
OnPlayerChangeExperienceNextLevel =_OnPlayerChangeExperienceNextLevel;

OldOnPlayerChangeFatness = OnPlayerChangeFatness;
function _OnPlayerChangeFatness(playerid, currFatness, oldFatness)
	CallHandler("OnPlayerChangeFatness",playerid, currFatness, oldFatness);
end
OnPlayerChangeFatness=_OnPlayerChangeFatness;

OldOnPlayerChangeGold=OnPlayerChangeGold;
function _OnPlayerChangeGold(playerid, currGold, oldGold)
 	CallHandler("OnPlayerChangeGold",playerid, currGold, oldGold);
end
OnPlayerChangeGold=_OnPlayerChangeGold;

OldOnPlayerChangeHealth = OnPlayerChangeHealth;
function _OnPlayerChangeHealth(playerid, currHealth, oldHealth)
	CallHandler("OnPlayerChangeHealth", playerid, currHealth, oldHealth);
end
OnPlayerChangeHealth = _OnPlayerChangeHealth;

OldOnPlayerChangeInstance = OnPlayerChangeInstance;
function _OnPlayerChangeInstance(playerid, currInstance, oldInstance)
	CallHandler("OnPlayerChangeInstance", playerid, currInstance, oldInstance);
end
OnPlayerChangeInstance =_OnPlayerChangeInstance;

OldOnPlayerChangeLearnPoints = OnPlayerChangeLearnPoints;
function _OnPlayerChangeLearnPoints(playerid, currLP, oldLP)
	CallHandler("OnPlayerChangeLearnPoints", playerid, currLP, oldLP);
end
OnPlayerChangeLearnPoints = _OnPlayerChangeLearnPoints;

OldOnPlayerChangeLevel = OnPlayerChangeLevel;
function _OnPlayerChangeLevel(playerid, currLevel, oldLevel)
	CallHandler("OnPlayerChangeLevel", playerid, currLevel, oldLevel);
end
OnPlayerChangeLevel = _OnPlayerChangeLevel;

OldOnPlayerChangeMana = OnPlayerChangeMana;
function _OnPlayerChangeMana(playerid, currMana, oldMana)
 	CallHandler("OnPlayerChangeMana", playerid, currMana, oldMana);
end
OnPlayerChangeMana = _OnPlayerChangeMana;

OldOnPlayerChangeMagicLevel = OnPlayerChangeMagicLevel;
function _OnPlayerChangeMagicLevel(playerid, currLevel, oldLevel)
	CallHandler("OnPlayerChangeMagicLevel", playerid, currLevel, oldLevel);
end
OnPlayerChangeMagicLevel = _OnPlayerChangeMagicLevel;

OldOnPlayerChangeMaxHealth = OnPlayerChangeMaxHealth
function _OnPlayerChangeMaxHealth(playerid, currMaxHealth, oldMaxHealth)
 	CallHandler("OnPlayerChangeMaxHealth",playerid, currMaxHealth, oldMaxHealth);
end
OnPlayerChangeMaxHealth =_OnPlayerChangeMaxHealth;

OldOnPlayerChangeMaxMana = OnPlayerChangeMaxMana;
function _OnPlayerChangeMaxMana(playerid, currMaxMana, oldMaxMana)
 	CallHandler("OnPlayerChangeMaxMana", playerid, currMaxMana, oldMaxMana);
end
OnPlayerChangeMaxMana = _OnPlayerChangeMaxMana;

OldOnPlayerChangeMeleeWeapon = OnPlayerChangeMeleeWeapon;
function _OnPlayerChangeMeleeWeapon(playerid, currMelee, oldMelee)
 	CallHandler("OnPlayerChangeMeleeWeapon", playerid, currMelee, oldMelee);
end
OnPlayerChangeMeleeWeapon = _OnPlayerChangeMeleeWeapon;

OldOnPlayerChangeRangedWeapon = OnPlayerChangeRangedWeapon;
function _OnPlayerChangeRangedWeapon(playerid, currRanged, oldRanged)
	CallHandler("OnPlayerChangeRangedWeapon",playerid, currRanged, oldRanged);
end
OnPlayerChangeRangedWeapon = _OnPlayerChangeRangedWeapon;

OldOnPlayerChangeScience = OnPlayerChangeScience;
function _OnPlayerChangeScience(playerid, scienceID, currScienceValue, oldScienceValue)
 	CallHandler("OnPlayerChangeScience",playerid, scienceID, currScienceValue, oldScienceValue);
end
OnPlayerChangeScience = _OnPlayerChangeScience;

OldOnPlayerChangeSkillWeapon = OnPlayerChangeSkillWeapon;
function _OnPlayerChangeSkillWeapon(playerid, skillID, currSkillAmount, oldSkillAmount)
 	CallHandler("OnPlayerChangeSkillWeapon", playerid, skillID, currSkillAmount, oldSkillAmount);
end
OnPlayerChangeSkillWeapon = _OnPlayerChangeSkillWeapon;

OldOnPlayerChangeMaxStrength = OnPlayerChangeMaxStrength;
function _OnPlayerChangeMaxStrength(playerid, currStrength, oldStrength)
	CallHandler("OnPlayerChangeMaxStrength", playerid, currStrength, oldStrength);
end
OnPlayerChangeMaxStrength = _OnPlayerChangeMaxStrength;

OldOnPlayerChangeWalk = OnPlayerChangeWalk;
function _OnPlayerChangeWalk(playerid, currWalk, oldWalk)
	CallHandler("OnPlayerChangeWalk", playerid, currWalk, oldWalk);
end
OnPlayerChangeWalk = _OnPlayerChangeWalk;

OldOnPlayerChangeWorld = OnPlayerChangeWorld
function _OnPlayerChangeWorld(playerid, world)
	CallHandler("OnPlayerChangeWorld", playerid, world);
end
OnPlayerChangeWorld = _OnPlayerChangeWorld;

OldOnPlayerCloseInventory = OnPlayerCloseInventory;
function _OnPlayerCloseInventory(playerid)
	CallHandler("OnPlayerCloseInventory", playerid);
end
OnPlayerCloseInventory = _OnPlayerCloseInventory;

OldOnPlayerCommandText = OnPlayerCommandText;
function _OnPlayerCommandText(playerid, cmdtext)
	CallHandler("OnPlayerCommandText", playerid, cmdtext);
end
OnPlayerCommandText = _OnPlayerCommandText;

OldOnPlayerConnect = OnPlayerConnect;
function _OnPlayerConnect(playerid)
 	CallHandler("OnPlayerConnect", playerid);
end
OnPlayerConnect = _OnPlayerConnect;

OldOnPlayerDeath = OnPlayerDeath;
function _OnPlayerDeath(playerid, p_classid, killerid, k_classid)
	CallHandler("OnPlayerDeath", playerid, p_classid, killerid, k_classid);
end
OnPlayerDeath = _OnPlayerDeath;

OldOnPlayerDisconnect = OnPlayerDisconnect;
function _OnPlayerDisconnect(playerid, reason)
 	CallHandler("OnPlayerDisconnect", playerid, reason);
end
OnPlayerDisconnect = _OnPlayerDisconnect;

OldOnPlayerDropItem = OnPlayerDropItem;
function _OnPlayerDropItem(playerid, itemid, item_instance, amount, x, y, z, worldName)
	CallHandler("OnPlayerDropItem", playerid, itemid, item_instance, amount, x, y, z, worldName);
end
OnPlayerDropItem = _OnPlayerDropItem;

OldOnPlayerEnterWorld = OnPlayerEnterWorld;
function _OnPlayerEnterWorld(playerid, world)
 	CallHandler("OnPlayerEnterWorld", playerid, world);
end
OnPlayerEnterWorld=_OnPlayerEnterWorld;

OldOnPlayerFocus = OnPlayerFocus;
function _OnPlayerFocus(playerid, focusid)
	CallHandler("OnPlayerFocus", playerid, focusid);
end
OnPlayerFocus = _OnPlayerFocus;

OldOnPlayerHasItem = OnPlayerHasItem;
function _OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
 	CallHandler("OnPlayerHasItem", playerid, item_instance, amount, equipped, checkid);
end
OnPlayerHasItem = _OnPlayerHasItem;

OldOnPlayerHit = OnPlayerHit;
function _OnPlayerHit(playerid, killerid)
 	CallHandler("OnPlayerHit", playerid, killerid);
end
OnPlayerHit = _OnPlayerHit;

OldOnPlayerKey = OnPlayerKey;
function _OnPlayerKey(playerid, keyDown, keyUp)
 	CallHandler("OnPlayerKey", playerid, keyDown, keyUp);
end
OnPlayerKey = _OnPlayerKey;

OldOnPlayerMD5File=OnPlayerMD5File;
function _OnPlayerMD5File(playerid, pathFile, hash)
 	CallHandler("OnPlayerMD5File", playerid, pathFile, hash);
end
OnPlayerMD5File=_OnPlayerMD5File;

OldOnPlayerOpenInventory = OnPlayerOpenInventory;
function _OnPlayerOpenInventory(playerid)
	CallHandler("OnPlayerOpenInventory", playerid);
end
OnPlayerOpenInventory = _OnPlayerOpenInventory;

OldOnPlayerResponseItem = OnPlayerResponseItem;
function _OnPlayerResponseItem(playerid, slot, item_instance, amount, equipped)
 	CallHandler("OnPlayerResponseItem", playerid, slot, item_instance, amount, equipped);
end
OnPlayerResponseItem = _OnPlayerResponseItem;

OldOnPlayerSelectClass = OnPlayerSelectClass;
function _OnPlayerSelectClass(playerid, classid)
 	CallHandler("OnPlayerSelectClass", playerid, classid);
end
OnPlayerSelectClass = _OnPlayerSelectClass;

OldOnPlayerSpawn = OnPlayerSpawn;
function _OnPlayerSpawn(playerid, classid)
	CallHandler("OnPlayerSpawn", playerid, classid);
end
OnPlayerSpawn = _OnPlayerSpawn;

OldOnPlayerSpellCast = OnPlayerSpellCast;
function _OnPlayerSpellCast(playerid, spellInstance)
	CallHandler("OnPlayerSpellCast", playerid, spellInstance);
end
OnPlayerSpellCast = _OnPlayerSpellCast;

OldOnPlayerSpellSetup = OnPlayerSpellSetup;
function _OnPlayerSpellSetup(playerid, spellInstance)
 	CallHandler("OnPlayerSpellSetup", playerid, spellInstance);
end
OnPlayerSpellSetup = _OnPlayerSpellSetup;

OldOnPlayerStandUp = OnPlayerStandUp;
function _OnPlayerStandUp(playerid)
 	CallHandler("OnPlayerStandUp", playerid);
end
OnPlayerStandUp = _OnPlayerStandUp;

OldOnPlayerTakeItem = OnPlayerTakeItem;
function _OnPlayerTakeItem(playerid, itemID, itemInstance, amount, x, y, z, worldName)
 	CallHandler("OnPlayerTakeItem", playerid, itemID, itemInstance, amount, x, y, z, worldName);
end
OnPlayerTakeItem = _OnPlayerTakeItem;

OldOnPlayerText = OnPlayerText;
function _OnPlayerText(playerid, text)
 	CallHandler("OnPlayerText", playerid, text);
end
OnPlayerText =_OnPlayerText;

OldOnPlayerUnconscious = OnPlayerUnconscious;
function _OnPlayerUnconscious(playerid, p_classid, killerid, k_classid)
	CallHandler("OnPlayerUnconscious", playerid, p_classid, killerid, k_classid);
end
OnPlayerUnconscious = _OnPlayerUnconscious;

OldOnPlayerUpdate = OnPlayerUpdate;
function _OnPlayerUpdate(playerid)
 	CallHandler("OnPlayerUpdate", playerid);
end
OnPlayerUpdate = _OnPlayerUpdate;

OldOnPlayerUseItem = OnPlayerUseItem;
function _OnPlayerUseItem(playerid, itemInstance, amount, hand)
 	CallHandler("OnPlayerUseItem", playerid, itemInstance, amount, hand);
end
OnPlayerUseItem = _OnPlayerUseItem;

OldOnPlayerWeaponMode = OnPlayerWeaponMode;
function _OnPlayerWeaponMode(playerid, weaponmode)
	CallHandler("OnPlayerWeaponMode", playerid, weaponmode);
end
OnPlayerWeaponMode = _OnPlayerWeaponMode;