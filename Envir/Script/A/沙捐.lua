lib996:include("Script/serialize.lua")
local cfg_shajuan = {
    [1] = {
        name = "ɳ�Ǿ���",
        effectid = 30006
    }
}
function shachengjuanxian(actor)
    lib996:showformwithcontent(actor, "A/ɳ��", "")
end

function SyncResponse(actor)
    local sendList = {}
    lib996:showformwithcontent(actor, "", "ShaJuan.SyncResponse(" .. serialize(sendList) .. ")")
end
