OldOnServerStart = OnServerStart;
function _OnServerStart()
	CallHandler("OnServerStart");
end
OnServerStart = _OnServerStart;