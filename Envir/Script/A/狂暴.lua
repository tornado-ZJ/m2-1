lib996:include("Script/serialize.lua")
local cfg_kuangbao = {
    [1] = {
        name = "��֮��",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        effectid = 30000,
        mapid = "24a",
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 25,
        },
    },
    [2] = {
        name = "��֮��",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        mapid = "24b",
        effectid = 30001,
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 25,
        }
    },
    [3] = {
        name = "��֮��",
        cost = {
            [1] = ConstCfg.money.rmb,
            [2] = 50,
        },
        mapid = "24c",
        effectid = 30002,
        diaoluo = {
            [1] = ConstCfg.money.rmb,
            [2] = 25,
        }
    },
    msg = {
        yikaiqi = '{"Msg":"<font color=\'#ff0000\'>�����ظ������񱩣�</font>","Type":9}',
        rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB�㲻�㣡</font>","Type":9}',
        kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>�����񱩳ɹ���</font>","Type":9}',
        beishatishi = '{"Msg":"<font color=\'#ff0000\'>����ʧ��</font>","Type":9}',
        sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>ɱ���񱩣�����50RMB�㣡</font>","Type":9}',
    },
}




function getcfg_kuangbaozhili()
    return cfg_kuangbao
end

function kuangbaozhili(actor)
    lib996:showformwithcontent(actor, "A/��", "")
end

function SyncResponse(actor)
    local chenghao = 0
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(actor, v.name) then
            chenghao = i
            break
        end
    end
    local sendList = {}
    table.insert(sendList, chenghao)
    lib996:showformwithcontent(actor, "", "KuangBao.SyncResponse(" .. serialize(sendList) .. ")")
end

---������
---@param cur_chenghao ��ǰ�񱩵ȼ�
function kaiqikuangbao(actor, cur_chenghao)
    --[[
        ��˼·
        1.ǰ�����˷������󣬻�ȡ�񱩿�������
        2.��˽����ݷ��͸�ǰ�ˣ�ǰ����ʾ����
        3.ǰ�˵�������񱩣��ж��Ƿ�������(��������)����������˷��Ϳ�������
            3-1.
        4.��˼�⿪������ ���Ƿ�Խ������ ���Ƿ��ѿ��� �ۻ����Ƿ����
        5.�۳����ң����ƺţ�������Ч��ˢ������
        6.��¼������Ч
        7.��ɱ���п񱩸���������ɱ��ȥ����Ч���ƺ�
    ]]
    cur_chenghao = tonumber(cur_chenghao)
    --��⵱ǰ�񱩳ƺŵȼ�
    local chenghao = 0
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(actor, v.name) then
            chenghao = i
            break
        end
    end
    --��ǰ�ƺŵȼ���ǰ�˴������ĵȼ���һ�£����ݴ���
    if chenghao ~= cur_chenghao then
        MsgUtil.ownbycolor(actor, "��Ϣ����������", ConstCfg.color.red)
        return
    end
    --�񱩵ȼ�����
    if chenghao >= #cfg_kuangbao then
         MsgUtil.ownbycolor(actor, "������", ConstCfg.color.white)
        return
    end
    --Ǯ����
    if not QsQcheckMoneyNum(actor, cfg_kuangbao[chenghao + 1].cost[1], cfg_kuangbao[chenghao + 1].cost[2]) then
        MsgUtil.ownbycolor(actor, "RMB�㲻��", ConstCfg.color.red)
        return
    end

    --5.�۳����ң�����ƺţ����ƺţ�������Ч��ˢ������
    lib996:changemoney(actor,cfg_kuangbao[chenghao + 1].cost[1],"-",cfg_kuangbao[chenghao + 1].cost[2],"",true)
    if chenghao > 0 then
        lib996:deprivetitle(actor, cfg_kuangbao[chenghao].name)
        lib996:clearplayeffect(actor, cfg_kuangbao[chenghao].effectid)
    end
    lib996:confertitle(actor, cfg_kuangbao[chenghao + 1].name)
    lib996:playeffect(actor, cfg_kuangbao[chenghao + 1].effectid, 0,0,0,0,0)
    MsgUtil.ownbycolor(actor, "����".. cfg_kuangbao[chenghao + 1].name .. "�ɹ���", ConstCfg.color.white)
    SyncResponse(actor)
end

function jinruditu(actor, index)
    index = tonumber(index)
    print(cfg_kuangbao[index].name)
    if not lib996:checktitle(actor, cfg_kuangbao[index].name) then
        MsgUtil.ownbycolor(actor, "δ����" .. cfg_kuangbao[index].name .. "��������ɽ���", ConstCfg.color.white)
        return
    end
    lib996:map(actor, cfg_kuangbao[index].mapid)
    MsgUtil.ownbycolor(actor, "����" .. cfg_kuangbao[index].name .. "��ͼ�ɹ�", ConstCfg.color.yellow)
end

GameEvent.add(EventCfg.onLogin, function(actor)
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(actor, v.name) then
            lib996:playeffect(actor, v.effectid, 0,0,0,0,0)
            break
        end
    end
end, "����Ч")
GameEvent.add(EventCfg.onkillplay, function(actor, play)
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(play, v.name) then
        --    ����ɱ�����п�
            --1�ƺŽ���
            --2��Ч����
            --3actor����
            if i == 1 then
                Player.swapTitle(play, {name = v.name, effectid = v.effectid}, {})
                MsgUtil.ownbycolor(play, "����ɱ��" .. v.name .. "��ʧ", ConstCfg.color.red)
            else
                Player.swapTitle(play, {name = v.name, effectid = v.effectid},
                        {name = cfg_kuangbao[i - 1].name, effectid = cfg_kuangbao[i - 1].effectid})
                MsgUtil.ownbycolor(play, "����ɱ���񱩽���Ϊ".. cfg_kuangbao[i - 1].name, ConstCfg.color.red)
            end
            MsgUtil.ownbycolor(actor, "��ɱ" .. v.name .."������25RMB��", ConstCfg.color.white)
            lib996:changemoney(actor, v.diaoluo[1], "+", v.diaoluo[2], "", true)
        end
    end
end, "��ɱ��")