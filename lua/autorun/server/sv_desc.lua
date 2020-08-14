util.AddNetworkString('CharDescToPD')

hook.Add('PlayerInitialSpawn', 'SetPD', function(ply)

	timer.Simple(0.1, function()
	
		if ply:GetPData('Desc') == nil then

			ply:SetPData('Desc', 'Описание персонажа отсутствует.')
			ply:SetNWString('Desc', ply:GetPData('Desc'))

		else

			ply:SetPData('Desc', ply:GetPData('Desc'))
			ply:SetNWString('Desc', ply:GetPData('Desc'))

		end

	end)

end)

net.Receive('CharDescToPD', function(len, ply)

	local desc = net.ReadString()

	ply:SetPData('Desc', desc)
	ply:SetNWString('Desc', ply:GetPData('Desc'))

end)