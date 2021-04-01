
--Roblox dev forum post: https://devforum.roblox.com/t/como-guardar-casi-cualquier-cosa-en-roblox-ezdata-v-5/1142390/5



local Rep = game:GetService("ReplicatedStorage") --Servicio replicated storage
local EZData = require(Rep:WaitForChild("EZData")) --Obtenemos el modulo
local Players = game:GetService("Players") --Servicio jugadores

Players.PlayerAdded:Connect(function(Plr) --Cuando entra el jugador
	EZData.SetData(Plr, "DataValue", "DataStoreKey", {"Money 0"}, false)
	--[[ Creamos un value el cual se llamara "DataValue" y se guardara en "DataStoreKey",
	y no se eliminara todo --]]
	
	wait(1)
	
	while true do --Bucle
		local MoneyVal = EZData.ReturnVal(Plr, "DataValue", 2, "Money")
		--[[ Pedimos que nos returne el valor de money que al principio sera 0, el 2 es por que
		el valor que queremos que returne esta en la pocision 2 --]]
		
		if tonumber(MoneyVal) <= 500 then --Lo convertimos en numero y vemos si es > 500
			EZData.IntIncrement(Plr, "DataValue", "Money", 10, 2) --Incrementa 10 en la pos 2
		end
		wait(5)
	end
end)

Players.PlayerRemoving:Connect(function(Plr)
	EZData.SaveData(Plr)
end)
