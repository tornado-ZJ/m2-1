---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 19838.
--- DateTime: 2022/10/11 12:48
---

lib996:include("Script/serialize.lua")

function npcclick_B(actor, npcid)
    --print("npcid",npcid)
    if npcid == 50 then
    end
end

GameEvent.add(EventCfg.onClicknpc, npcclick_B, "????npc_B")