return function()
	local switch = require(script.Parent)
	
	describe("New Switch", function()
		it("Should switch with the expression given", function()
			local statement = switch("Bar" , {
				["Bar"] = function()
					return "Foo"
				end
			})
			
			expect(statement).to.equal("Foo")
		end)
		
		it("Should be called upon again", function()
			local statement = switch(nil , {
				["Bar"] = function()
					return "Foo"
				end
			})
			
			expect(statement("Bar")).to.equal("Foo")
		end)
		
		it("Should return metatable if expression is not valid and there is no default case", function()
			local statement = switch("Baz" , {
				["Bar"] = function()
					return "Foo"
				end
			})
			
			expect(type(statement)).to.equal(table)
		end)
	end)
	
	describe("Array expression", function()
		it("Should check if expressions are the same and do function or default", function()
			local statement = switch({"Baz", "Bar"}, {
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
	
			expect(statement).to.equal("Default")
		end)
		
		it("Should do the expression function if same", function()
			local statement = switch({"Foo", "Foo"}, {
				["Foo"] = function()
					return "Foo"
				end,
				["Default"] = function()
					return "Default"
				end
			})
			
			expect(statement).to.equal("Foo")
		end)
	end)
end