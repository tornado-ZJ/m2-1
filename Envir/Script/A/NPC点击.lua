---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 19838.
--- DateTime: 2022/10/11 12:48
---


lib996:include("Script/serialize.lua")

function npcclick(actor, npcid)
    --һ����Ѫ
    if npcid == 1 then
        yijianmanxue(actor)
    elseif npcid == 2 then
        kuangbaozhili(actor)
    elseif npcid == 100 then
        ceshi(actor)
    end
end

GameEvent.add(EventCfg.onClicknpc, npcclick, "���npc")