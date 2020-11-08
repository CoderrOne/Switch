# Switch
Lua duplication of switch statements

## How to use
```lua
local Switch = require(Path.To.Module)

Switch({"Baz", "Bar"}, {
	["Bar"] = function()
		return "Bar"
	end,
	["Baz"] = function()
		return "Baz"
	end,
	["Default"] = function()
		return "Default"
	end
})

Switch("Bar" , {
	["Bar"] = function()
		return "Foo"
	end
})

```
