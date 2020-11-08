return function(...)
	local abc = {...}
	
	local tbl = {}
	
	for _, input in pairs(abc) do
		local h = type(input)
		if h == "number" then
			if input % 1 ~=0 then
				h = "float"
			else
				h = "integer"
			end
		elseif h == "table" then
			local inp = input
			local b = {}
			for i, v in pairs(inp) do
				table.insert(b,i)
			end
			if type(b[1]) == "number" then
				h = "array"
			else
				if #b <= 0 then
					h = "array"
				else
					h = "dictionary"
				end
			end
		end
		table.insert(tbl,h)
	end
	return table.unpack(tbl)
end