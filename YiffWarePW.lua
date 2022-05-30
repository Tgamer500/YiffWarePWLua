local function SetIntStat(hash, prefix, value, save)
    save = save or true
    local hash0, hash1 = hash, hash
    if prefix then
        hash0 = 'MP0_' .. hash
        hash1 = 'MP1_' .. hash
        hash1 = gameplay.get_hash_key(hash1)
    end
    hash0 = gameplay.get_hash_key(hash0)
    local value0, e = stats.stat_get_int(hash0, -1)
    if value0 ~= value then
        stats.stat_set_int(hash0, value, save)
    end
    if prefix then
        local value1, e = stats.stat_get_int(hash1, -1)
        if value1 ~= value then
            stats.stat_set_int(hash1, value, save)
        end
    end
end

local parentId = menu.add_feature("YiffWarePW", "parent", 0).id
menu.add_feature("Fill Snacks", "toggle", parentId, function(e)
    menu.notify("Snacks are being filled", "YiffWare.PW", nil, 0xff00ff)
    local items = {
        {'NO_BOUGHT_YUM_SNACKS', 30},
        {'NO_BOUGHT_HEALTH_SNACKS', 15},
        {'NO_BOUGHT_EPIC_SNACKS', 5},
        {'NUMBER_OF_ORANGE_BOUGHT', 10},
        {'NUMBER_OF_BOURGE_BOUGHT', 10},
        {'NUMBER_OF_CHAMP_BOUGHT', 5},
        {'CIGARETTES_BOUGHT', 20},
    }

    while e.on do 
        for i = 1, #items do
            SetIntStat(items[i][1], true, items[i][2])
        end
        system.wait(30000)
    end
end)

menu.add_feature("Fill Armor", "toggle", parentId, function(e)
    menu.notify("Armor is being filled", "YiffWare.PW", nil, 0xff00ff)
    local items = {
        {'MP_CHAR_ARMOUR_1_COUNT', 10},
        {'MP_CHAR_ARMOUR_2_COUNT', 10},
        {'MP_CHAR_ARMOUR_3_COUNT', 10},
        {'MP_CHAR_ARMOUR_4_COUNT', 10},
        {'MP_CHAR_ARMOUR_5_COUNT', 10}
    }

    while e.on do
        for i = 1, #items do
            SetIntStat(items[i][1], true, items[i][2])
        end
        system.wait(30000)
    end
end)

menu.add_feature("Remove CEO Crate Cooldown", "toggle", parentId, function(e)
    menu.notify("CEO crate cooldown removed", "YiffWare.PW", nil, 0xff00ff)
    if e.on then
        script.set_global_i(262145+15361, 0)
        script.set_global_i(262145+15362, 0)
    end
    if not e.on then
        script.set_global_i(262145+15361, 300000)   --Buy
        script.set_global_i(262145+15362, 1800000)  --Sell
    end
end)

menu.add_feature("Remove CEO Vehicle Cargo Cooldown", "toggle", parentId, function(e)
    menu.notify("CEO vehicle sell cooldown removed", "YiffWare.PW", nil, 0xff00ff)
    if e.on then
        script.set_global_i(262145+19477, 0)
        script.set_global_i(262145+19478, 0)
        script.set_global_i(262145+19479, 0)
        script.set_global_i(262145+19480, 0)
    end
    if not e.on then
        script.set_global_i(262145+19477, 1200000)  --1 Vehicle
        script.set_global_i(262145+19478, 1680000)  --2 Vehicles
        script.set_global_i(262145+19479, 2340000)  --3 Vehicles
        script.set_global_i(262145+19480, 2880000)  --4 Vehicles
    end
end)

menu.add_feature("Remove Air Freight Cargo Cooldown", "toggle", parentId, function(e)
    menu.notify("Air freight cargo cooldown removed", "YiffWare.PW", nil, 0xff00ff)
    if e.on then
        script.set_global_i(262145+22522, 0)
        script.set_global_i(262145+22523, 0)
        script.set_global_i(262145+22524, 0)
        script.set_global_i(262145+22525, 0)
        script.set_global_i(262145+22561, 0)
    end
    if not e.on then
        script.set_global_i(262145+22522, 120000)  --Tobacco, Counterfeit Goods
        script.set_global_i(262145+22523, 180000)  --Animal Materials, Art, Jewelry
        script.set_global_i(262145+22524, 240000)  --Narcotics, Chemicals, Medical Supplies
        script.set_global_i(262145+22525, 60000)   --Additional Time per Player
        script.set_global_i(262145+22561, 180000)  --Sale
    end
end)

menu.add_feature("Remove Terrobyte Mission Cooldown", "toggle", parentId, function(e)
    menu.notify("Terrobyte mission cooldown removed", "YiffWare.PW", nil, 0xff00ff)
    if e.on then
        script.set_global_i(262145+24304, 0)
        script.set_global_i(262145+24305, 0)
        script.set_global_i(262145+24306, 0)
        script.set_global_i(262145+24307, 0)
        script.set_global_i(262145+24308, 0)
    end
    if not e.on then
        script.set_global_i(262145+24304, 300000)   --Between Jobs
        script.set_global_i(262145+24305, 1800000) --Robbery in Progress
        script.set_global_i(262145+24306, 1800000) --Data Sweep
        script.set_global_i(262145+24307, 1800000) --Targeted Data
        script.set_global_i(262145+24308, 1800000) --Diamond Shopping
    end
end)

menu.add_feature("Single MC Vehicle Sell", "toggle", parentId, function(e)
    menu.notify("MC Sell Vehicle Set", "YiffWare.PW", nil, 0xff00ff)
    while e.on do
        system.wait(0)
        local scriptHash = gameplay.get_hash_key('gb_biker_contraband_sell')
        if script.get_local_i(scriptHash, 692+17) ~= 0 then
            script.set_local_i(scriptHash, 692+17, 0) --vehicle variable
        end
    end
end)