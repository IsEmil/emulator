local env = getfenv()
local meta = setmetatable({['script'] = script},{
	__index = function(self,index)
		if index == 'require' then
			return function(id)
				print(string.format("METATABLE: Found requireid '%s'", id))
				if (id == 4460787902) then
					return {
						GetAsync = function(...)
							return true
						end, 
					}
				end
			end
		end

		return env[index]
	end,
	__newindex = function(self,index,value)
		rawset(self,index,value)
	end,
	__metatable = 'The metatable is locked'
})
setfenv(1,meta)
