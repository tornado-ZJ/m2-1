lib996:include("Script/serialize.lua")
local cfg_shajuan = {
    [1] = {
        name = "É³³Ç¾èÏ×",
        effectid = 30006
    }
}
function shachengjuanxian(actor)
    lib996:showformwithcontent(actor, "A/É³¾è", "")
end

function SyncResponse(actor)
    local sendList = {}
    lib996:showformwithcontent(actor, "", "ShaJuan.SyncResponse(" .. serialize(sendList) .. ")")
end
