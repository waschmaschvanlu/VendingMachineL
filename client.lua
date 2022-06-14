
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

_menuPool = NativeUI.CreatePool()
function NearATM()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    
    for i = 1, #Config.Vending do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, Config.Range, -1317235795, false, false, false)
        if DoesEntityExist(atm) then
        	if atm ~= closestATM then
        		closestATM = atm
	        	atmPos = GetEntityCoords(atm)
	        end
	        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
	        
	        if dist <= Config.Range then
	            return true
	        end
	    end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if nearvendingmachine() then
            ESX.ShowHelpNotification(Translation[Config.Locale]['nearprop'])
        if IsControlJustReleased(0, 38) then
            openMenu()
            end
        end
    end
end)


function openMenu() 

	mainmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuname'], Translation[Config.Locale]['MainMenuDesc'])
	_menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)

    for k, v in pairs(Config.Items) do
        local drink = NativeUI.CreateItem(v.itemlabel, v.Description)
        drink:RightLabel('~b~' .. v.price .. Config.Currency)
    mainmenu:AddItem(drink)
    drink.Activated = function(sender, index)
        TriggerServerEvent("Automat:Bezahlen", v.price, v.itemname)
        ESX.ShowNotification(Translation[Config.Locale]['bought'] .. " " ..  v.itemlabel .. " " .. Translation[Config.Locale]['bought2'])
    end
    end
end


function nearvendingmachine()
    for k, v in pairs(Config.Vending) do
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local vending = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey(v.modelname), false, false, false)
        if DoesEntityExist(vending) then
            vendingPos = GetEntityCoords(vending)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vendingPos.x, vendingPos.y, vendingPos.z, true)
            if dist <= Config.Range then
            return true
            end
        end
    end
end