lib996:include("Script/serialize.lua")
local cfg_kuangbao = {
    [1] = {
        name = "¿ñ±©Ö®Íõ",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 100,
        },
        effectid = 30000,
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        msg = {
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>ÇëÎðÖØ¸´¿ªÆô¿ñ±©£¡</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMBµã²»×ã£¡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>¿ªÆô¿ñ±©³É¹¦£¡</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>¿ñ±©ÏûÊ§£¡</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>É±ËÀ¿ñ±©£¬½±Àø50RMBµã£¡</font>","Type":9}',
        },
    },
    [2] = {
        name = "¿ñ±©Ö®×ð",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 100,
        },
        effectid = 30000,
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        msg = {
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>ÇëÎðÖØ¸´¿ªÆô¿ñ±©£¡</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMBµã²»×ã£¡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>¿ªÆô¿ñ±©³É¹¦£¡</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>¿ñ±©ÏûÊ§£¡</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>É±ËÀ¿ñ±©£¬½±Àø50RMBµã£¡</font>","Type":9}',
        },
    },
    [3] = {
        name = "¿ñ±©Ö®Éñ",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 100,
        },
        effectid = 30000,
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        msg = {
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>ÇëÎðÖØ¸´¿ªÆô¿ñ±©£¡</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMBµã²»×ã£¡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>¿ªÆô¿ñ±©³É¹¦£¡</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>¿ñ±©ÏûÊ§£¡</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>É±ËÀ¿ñ±©£¬½±Àø50RMBµã£¡</font>","Type":9}',
        },
    },
}

function getcfg_kuangbaozhili()
    return cfg_kuangbao
end

function kuangbaozhili(actor)
    lib996:showformwithcontent(actor, "A/¿ñ±©", "")
end

function SyncResponse(actor)
    local sendList = {}
    lib996:showformwithcontent(actor, "", "KuangBao.SyncResponse(" .. serialize(sendList) .. ")")
end
