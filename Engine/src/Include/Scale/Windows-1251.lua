function GetTextBytesRU(text)
	local t = {};
	if text then
		for i=1, #text do
			table.insert(t, string.byte(string.sub(text, i, i)));
		end
	end
	return t;
end