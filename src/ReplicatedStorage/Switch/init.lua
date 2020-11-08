local function switch(Expression, Cases : table, Parameters : table)
	local typeof = require(script.TypeOf)
	
	local Metatable = setmetatable({
		__call = function(...)
			if Cases[...] then
				return Cases[...](unpack(Parameters))
			end
		end
	}, Cases)
	
	if typeof(Expression) == "array" then
		for i in 1, #Expression do
			local Origin = Cases[Expression[i]]
			
			if type(Origin) == "function" then
				return Origin(Parameters)
			else
				return Cases["Default"]()
			end
		end
	else
		if Cases[Expression] then
			return Cases[Expression](Parameters)
		else
			if Cases["Deafault"] then
				return Cases["Default"]()
			else
				return Metatable
			end
		end
	end
end

return switch