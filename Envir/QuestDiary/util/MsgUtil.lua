---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zhoujie.
--- DateTime: 2022/10/28 18:45
---
MsgUtil = {}

function MsgUtil.ownbycolor(actor, strmsg, color)
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'' .. color .. '\'>' .. strmsg ..'</font>","Type":9}')
end


return MsgUtil