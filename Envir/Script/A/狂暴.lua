lib996:include("Script/serialize.lua")
local cfg_kuangbao = {
    [1] = {
        name = "��֮��",
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
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>�����ظ������񱩣�</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB�㲻�㣡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>�����񱩳ɹ���</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>����ʧ��</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>ɱ���񱩣�����50RMB�㣡</font>","Type":9}',
        },
    },
    [2] = {
        name = "��֮��",
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
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>�����ظ������񱩣�</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB�㲻�㣡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>�����񱩳ɹ���</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>����ʧ��</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>ɱ���񱩣�����50RMB�㣡</font>","Type":9}',
        },
    },
    [3] = {
        name = "��֮��",
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
            yikaiqi = '{"Msg":"<font color=\'#ff0000\'>�����ظ������񱩣�</font>","Type":9}',
            rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB�㲻�㣡</font>","Type":9}',
            kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>�����񱩳ɹ���</font>","Type":9}',
            beishatishi = '{"Msg":"<font color=\'#ff0000\'>����ʧ��</font>","Type":9}',
            sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>ɱ���񱩣�����50RMB�㣡</font>","Type":9}',
        },
    },
}

function getcfg_kuangbaozhili()
    return cfg_kuangbao
end

function kuangbaozhili(actor)
    lib996:showformwithcontent(actor, "A/��", "")
end

function SyncResponse(actor)
    local sendList = {}
    lib996:showformwithcontent(actor, "", "KuangBao.SyncResponse(" .. serialize(sendList) .. ")")
end
