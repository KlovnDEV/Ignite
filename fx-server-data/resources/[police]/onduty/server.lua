print("")
print("=======================")
print("On Duty Script By Kvetz")
print("Special Thanks To Titch2000")
print("=======================")

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/onduty" then
	TriggerClientEvent("yt:policeLoadout", source)
    CancelEvent()
    end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end