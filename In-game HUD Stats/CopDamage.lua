local _on_damage_received_original = CopDamage._on_damage_received

function CopDamage:_on_damage_received(damage_info, ...)
    self:_hudstatsscreen_process_damage(damage_info.attacker_unit, damage_info.damage)
    return _on_damage_received_original(self, damage_info, ...)
end

-- Named to try and reduce chances of conflict
function CopDamage:_hudstatsscreen_process_damage(aggressor, damage)
    if alive(aggressor) and aggressor:base() then
        if aggressor == managers.player:player_unit() or aggressor:base()._thrower_unit == managers.player:player_unit() then
            HUDStatsScreen:add_damage(damage)
        end
    end
end
