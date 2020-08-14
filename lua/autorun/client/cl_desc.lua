local MDESC = {}

function MDESC.ButtonActivateDesc(ply, button)
		
	if input.GetKeyName(button) == 'F8' then

		Derma_StringRequest(
			
			"Описание персонажа", 
			
			"Введите описание вашего персонажа ниже: ",
			
			"",
			
			function(text) 

				if string.len(text) <= 200 then
				
					ply:SetNWString('Desc', text)
					ply:ChatPrint('Вы установили свое описание: ' .. ply:GetNWString('Desc', 'Описание персонажа отсутствует.'))

					net.Start('CharDescToPD')

						net.WriteString(text)

					net.SendToServer()

				else

					ply:ChatPrint('Слишком длинное описание! Макс. символов: 180.')
					ply:ChatPrint('Описание сейчас: ' .. ply:GetNWString('Desc', 'Описание персонажа отсутствует.'))

					return

				end
			
			end
		
		)
		
	end

end

hook.Add("PlayerButtonDown", "ButtonActivateDesc", MDESC.ButtonActivateDesc)