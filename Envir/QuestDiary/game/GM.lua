

    --��ջ���
    function usercmd10001(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "=", 0, "", true)
        lib996:changemoney(actor, 5, "=", 0, "", true)
        lib996:changemoney(actor, 11, "=", 0, "", true)
        lib996:changemoney(actor, 12, "=", 0, "", true)
        lib996:changemoney(actor, 20, "=", 0, "", true)
        lib996:changemoney(actor, 23, "=", 0, "", true)
        lib996:changemoney(actor, 24, "=", 0, "", true)
        lib996:changemoney(actor, 25, "=", 0, "", true)
    end

    --rmb
    function usercmd10002(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 12, "+", 100000, "", true)
    end
    
    --��ֵ��
    function usercmd10003(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 11, "+", 1000000, "", true)
    end
    --��ֵ���
    function usercmd10004(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 20, "+", 100000, "", true)
    end
    
    --����
    function usercmd10005(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 23, "+", 1000, "", true)
    end
    --Ԫ��
    function usercmd10006(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "+", 100000000, "", true)
    end
    
    --����
    function usercmd10007(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 24, "+", 1000, "", true)
    end
    --�����и�
    function usercmd10008(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 25, "+", 100000000, "", true)
    end
    --������
    function usercmd11000(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 5, "+", 100000000, "", true)
    end

    --�����ս
    function usercmd10009(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_open(actor)
    end
    function usercmd10010(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_close(actor)
    end

    --���Ҷ�
    function usercmd10011(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_open(actor)
    end
    function usercmd10012(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_close(actor)
    end

    --�������
    function usercmd10100(actor, tasktype)
        if getgmlevel(actor) ~= 10 then return end
        local tasktype = tonumber(tasktype)
        if not tasktype then return end
        Task.rwwc(actor, tasktype)
    end
    --�������2
    function usercmd10101(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.finish(actor, taskid)
    end
    --������ȡ
    function usercmd10102(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.receive(actor, taskid)
    end
    --����ɾ��
    function usercmd10103(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.delete(actor, taskid)
    end

    function usercmd10013(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = zslevel + 1
        lib996:setbaseinfo(actor, 39, next_zslevel)  --ת������
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    end

    function usercmd10014(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = 0
        lib996:setbaseinfo(actor, 39, next_zslevel)  --ת������
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
    end

    --ȫ�����
    function usercmd10015(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local _mapID = lib996:getbaseinfo(actor, 3)
        local x,y = lib996:getbaseinfo(actor, 4),lib996:getbaseinfo(actor, 5)
        local object = lib996:getobjectinmap(_mapID,x,y,10,2)
        if #object > 0 then
            for i, mon in ipairs(object) do
                lib996:killmonbyobj(actor,mon,true,true,true)
            end
        end
    end

    --��ӵ���
    function usercmd10016(actor, itemName,itemNum)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local Name = tonumber(itemName)
        if type(Name) == "number" then
            itemName = lib996:getstditeminfo(Name,1)
        end
        itemNum = tonumber(itemNum) or 1
        lib996:giveitem(actor,itemName,itemNum)
    end

    --���������ȼ�+1
    function usercmd10017(actor)
        JiangHuMingWang.GmLevelAdd(actor)
    end
    --���������ȼ����
    function usercmd10018(actor)
        JiangHuMingWang.GmLevelClear(actor)
    end
    --������������
    function usercmd10019(actor)
        JiangHuMingWang.GmRw(actor)
    end

    --���Գ�ֵ
    function usercmd10020(actor,num,moneyid)
        num = tonumber(num)
        moneyid = tonumber(moneyid) or ConstCfg.money.lf
        if not num then return end
        recharge(actor, num, moneyid,moneyid)
    end

     --����ÿ��/������һ��
    function usercmd10104(actor)
        lib996:setint(0,actor, VarCfg.T_daily_date, 0)
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>gmִ�гɹ�,����ÿ��/������һ��</font>","Type":9}')
        local logindatas = {}
        GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
    end

    --�������л���������
    function usercmd10105(actor)
        lib996:addattacksabakall()
        lib996:release_print("gmִ�гɹ�")
    end
    --�����Ʒ
    function usercmd10106(actor)
        local tab_name = {}
        local tab_num = {}
        local item_tab = lib996:getbagitems(actor)   --��ȡ����������Ʒ����
        for i=1,#item_tab do
            local item = item_tab[i]
            local id = lib996:getiteminfo(actor, item, 2)  --��ȡ������Ʒid
            local name = lib996:getstditeminfo(id,1)          --��ȡ������Ʒname
            local item_mun = lib996:getiteminfo(actor, item, 5)  --��ȡ�ѵ�
            if item_mun == 0 then   --�ѵ�Ϊ0 Ϊ���ѵ� ����Ϊ1
                item_mun = 1
            end
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
        end
        for j=1,#tab_name do
            lib996:takeitem(actor,tab_name[j],tab_num[j])
        end
    end
    --��ѯ��������Ʒ
    function usercmd10107(actor)
        local tab_name = {}
        local tab_num = {}
        local tab_idx = {}
        local tab_id = {}
        local tab_item = {}
        
        local item_tab = lib996:getbagitems(actor)
        for i=1,#item_tab do
            local item = item_tab[i]
            local idx = lib996:getiteminfo(actor, item, 2)  --��ȡ������Ʒ���
            local id = lib996:getiteminfo(actor, item, 1)  --��ȡ������ƷΨһid
            local name = lib996:getstditeminfo(idx,1)          --��ȡ������Ʒname
            local item_mun = lib996:getiteminfo(actor, item, 5)  --��ȡ�ѵ�
            if item_mun == 0 then   --�ѵ�Ϊ0 Ϊ���ѵ� ����Ϊ1
                item_mun = 1
            end
            
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
            table.insert(tab_idx,idx)
            table.insert(tab_id,id)
            table.insert(tab_item,item)
        end
        for j=1,#tab_name do
            lib996:release_print(" ��ƷID:"..tab_idx[j].."������:"..tab_name[j].."������:"..tab_num[j].."������:"..tab_item[j].."��ΨһID:"..tab_id[j])
        end
    end
    --��ѯ����Զ������ @get ��������������
    function usercmd10108(actor,var)
        local value = getplayvar(actor,var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --��������Զ������ @set ������ ����ֵ��������
    function usercmd10109(actor,var,value)
        setplayvar(actor, "HUMAN",var,value,1)
    end
    --��ѯȫ���Զ������ @get ��������������
    function usercmd10110(actor,var)
        local value = getsysvarex(var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --����ȫ�ֶ������ @set ������ ����ֵ��������
    function usercmd10111(actor,var,value)
        setsysvarex(var,value, 1)
    end

    --ˢ��
    function usercmd10112(actor, monName,monmNum)
        monmNum = monmNum or 1
        local map = lib996:getbaseinfo(actor, 3)
        local x = lib996:getbaseinfo(actor, 4) + 2
        local y = lib996:getbaseinfo(actor, 5) + 2
        local r = 3

        itemNum = tonumber(itemNum) or 1
        lib996:genmon(map,x,y,monName,r,monmNum)
    end

    --GMbox����
    function usercmd10113(actor,gs,vartype, str1,str2,str3,str4)
        if str1 ~= "QSQ_var" then
            str1 = tonumber(str1)
        end
        if str4 == "nil" then
            str4 = nil
        end
        if vartype == "int" then
            str4 = tonumber(str4)
            if str4 == nil then
                str4 = 0
            end
        end
        if tonumber(gs) == 2 then   --��ȡ����
            if str1 == "QSQ_var" and str2 == "QSQ_var" then --1 ��2��Ϊ��ʱΪϵͳ����
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getsysint(str3)
                else
                    sysvar = lib996:getsysstr(str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("ϵͳ���� "..vartype,psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>ϵͳ����'..vartype.." "..psysvar..'</font>","Type":1}')

            end
            if str1 == 0 and str2 == "QSQ_var" then --�ж������� 2Ϊ��ʱ �����Լ�
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getint(str1,actor,str3)
                else
                    sysvar = lib996:getstr(str1,actor,str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("���˱��� "..vartype.."��",psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>���˱���'..vartype.." "..psysvar..'</font>","Type":1}')
            end
            if str1 ~= "QSQ_var" and str2 ~= "QSQ_var" then --�ж������� 2Ҳ��ָ������ʱ
                local sysvar = ""
                if vartype == "int" then
                    sysvar = lib996:getint(str1,str2,str3)
                else
                    sysvar = lib996:getstr(str1,str2,str3)
                end
                local psysvar = lib996:tbl2json(sysvar)
                lib996:release_print("ָ������ "..vartype.."��",psysvar)
                lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>ָ������'..vartype.." "..psysvar..'</font>","Type":1}')
            end
        else        --���ñ���
            if str1 == "QSQ_var" and str2 == "QSQ_var" then
                if vartype == "int" then
                    lib996:setsysint(str3,str4)
                else
                    lib996:setsysstr(str3,str4)
                end
                lib996:release_print("�޸�ϵͳ���� ���")
            end
            if str1 == 0 and str2 == "QSQ_var" then
                if vartype == "int" then
                    lib996:getint(str1,actor,str3,str4)
                else
                    lib996:getstr(str1,actor,str3,str4)
                end
                lib996:release_print("�޸ı��˱��� ���")
            end
            if str1 ~= "QSQ_var" and str2 ~= "QSQ_var" then
                if vartype == "int" then
                    lib996:getint(str1,str2,str3,str4)
                else
                    lib996:getstr(str1,str2,str3,str4)
                end
                lib996:release_print("�޸�ָ������ ���")
            end
        end
    end
