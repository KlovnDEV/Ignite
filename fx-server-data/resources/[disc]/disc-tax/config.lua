Config = {}

Config.TaxTime = {
    h = 00,
    m = 01
}

Config.TaxMoney = false

--Increasing Order
Config.TaxBrackets = {
    default = {
        percent = 5
    },
    {
        low = 0,
        high = 200000,
        percent = 5
    },
    {
        low = 200000,
        high = 500000,
        percent = 10
    }
}