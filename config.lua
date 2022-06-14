Config = {}
Config.Vending = { -- https://gtahash.ru/?s=vend
	{modelname = "prop_vend_soda_01"}
}

Config.Range = 3

Config.Locale = "de"

Translation = {
    ['de'] = {
       ['nearprop'] = 'Drücke ~INPUT_CONTEXT~ um den Getränkeautomat zu öffnen',
       ['MainMenuname'] = "Getränke Automat!",
       ['MainMenuDesc'] = "Kälter als deine Ex-Freundin! <3",
       ['bought'] = "Du hast eine Dose..",
       ['bought2'] = "Gekauft!"
    },
    ['en'] = {
        ['nearprop'] = 'Press ~INPUT_CONTEXT~ to Open the Vending-Machine',
        ['MainMenuname'] = "Vending Machine!",
        ['MainMenuDesc'] = " Get your Cold beer here! <3",
        ['bought'] = "You bought a can of",
        ['bought2'] = "!"
    } 
}

Config.Currency = "$"
Config.Items = {
 {itemname = "cola", itemlabel = "Cola!", price = 20, Description = "So Süß wie du <3"}
}