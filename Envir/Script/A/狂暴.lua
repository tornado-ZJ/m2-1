lib996:include("Script/serialize.lua")
local cfg_kuangbao = {
    [1] = {
        name = "狂暴之王",
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
        name = "狂暴之尊",
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
        name = "狂暴之神",
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
        yikaiqi = '{"Msg":"<font color=\'#ff0000\'>请勿重复开启狂暴！</font>","Type":9}',
        rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB点不足！</font>","Type":9}',
        kaiqichenggong = '{"Msg":"<font color=\'#ff0000\'>开启狂暴成功！</font>","Type":9}',
        beishatishi = '{"Msg":"<font color=\'#ff0000\'>狂暴消失！</font>","Type":9}',
        sharenjiangli = '{"Msg":"<font color=\'#ff0000\'>杀死狂暴，奖励50RMB点！</font>","Type":9}',
    },
}




function getcfg_kuangbaozhili()
    return cfg_kuangbao
end

function kuangbaozhili(actor)
    lib996:showformwithcontent(actor, "A/狂暴", "")
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

---开启狂暴
---@param cur_chenghao 当前狂暴等级
function kaiqikuangbao(actor, cur_chenghao)
    --[[
        狂暴思路
        1.前端向后端发送请求，获取狂暴开启数据
        2.后端将数据发送给前端，前端显示界面
        3.前端点击开启狂暴，判断是否允许开启(狂暴有三层)，允许就向后端发送开启请求
            3-1.
        4.后端检测开启条件 ①是否越级开启 ②是否已开启 ③货币是否充足
        5.扣除货币，给称号，播放特效，刷新属性
        6.登录播放特效
        7.击杀带有狂暴给奖励，被杀者去除特效，称号
    ]]
    cur_chenghao = tonumber(cur_chenghao)
    --检测当前狂暴称号等级
    local chenghao = 0
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(actor, v.name) then
            chenghao = i
            break
        end
    end
    --当前称号等级和前端传过来的等级不一致，数据错误
    if chenghao ~= cur_chenghao then
        MsgUtil.ownbycolor(actor, "信息错误，请重试", ConstCfg.color.red)
        return
    end
    --狂暴等级满级
    if chenghao >= #cfg_kuangbao then
         MsgUtil.ownbycolor(actor, "狂暴已满", ConstCfg.color.white)
        return
    end
    --钱不足
    if not QsQcheckMoneyNum(actor, cfg_kuangbao[chenghao + 1].cost[1], cfg_kuangbao[chenghao + 1].cost[2]) then
        MsgUtil.ownbycolor(actor, "RMB点不足", ConstCfg.color.red)
        return
    end

    --5.扣除货币，清楚称号，给称号，播放特效，刷新属性
    lib996:changemoney(actor,cfg_kuangbao[chenghao + 1].cost[1],"-",cfg_kuangbao[chenghao + 1].cost[2],"",true)
    if chenghao > 0 then
        lib996:deprivetitle(actor, cfg_kuangbao[chenghao].name)
        lib996:clearplayeffect(actor, cfg_kuangbao[chenghao].effectid)
    end
    lib996:confertitle(actor, cfg_kuangbao[chenghao + 1].name)
    lib996:playeffect(actor, cfg_kuangbao[chenghao + 1].effectid, 0,0,0,0,0)
    MsgUtil.ownbycolor(actor, "开启".. cfg_kuangbao[chenghao + 1].name .. "成功！", ConstCfg.color.white)
    SyncResponse(actor)
end

function jinruditu(actor, index)
    index = tonumber(index)
    print(cfg_kuangbao[index].name)
    if not lib996:checktitle(actor, cfg_kuangbao[index].name) then
        MsgUtil.ownbycolor(actor, "未开启" .. cfg_kuangbao[index].name .. "，开启后可进入", ConstCfg.color.white)
        return
    end
    lib996:map(actor, cfg_kuangbao[index].mapid)
    MsgUtil.ownbycolor(actor, "进入" .. cfg_kuangbao[index].name .. "地图成功", ConstCfg.color.yellow)
end

GameEvent.add(EventCfg.onLogin, function(actor)
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(actor, v.name) then
            lib996:playeffect(actor, v.effectid, 0,0,0,0,0)
            break
        end
    end
end, "狂暴特效")
GameEvent.add(EventCfg.onkillplay, function(actor, play)
    for i, v in ipairs(cfg_kuangbao) do
        if lib996:checktitle(play, v.name) then
        --    被击杀的人有狂暴
            --1称号降级
            --2特效降级
            --3actor奖励
            if i == 1 then
                Player.swapTitle(play, {name = v.name, effectid = v.effectid}, {})
                MsgUtil.ownbycolor(play, "被击杀，" .. v.name .. "消失", ConstCfg.color.red)
            else
                Player.swapTitle(play, {name = v.name, effectid = v.effectid},
                        {name = cfg_kuangbao[i - 1].name, effectid = cfg_kuangbao[i - 1].effectid})
                MsgUtil.ownbycolor(play, "被击杀，狂暴降级为".. cfg_kuangbao[i - 1].name, ConstCfg.color.red)
            end
            MsgUtil.ownbycolor(actor, "击杀" .. v.name .."，奖励25RMB点", ConstCfg.color.white)
            lib996:changemoney(actor, v.diaoluo[1], "+", v.diaoluo[2], "", true)
        end
    end
end, "击杀狂暴")