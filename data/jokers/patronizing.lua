SMODS.Joker {
    key = "patronizing",
    name = "Patronizing Joker",
    atlas = 'maggitsjokeratlas',
    pos = {
        x = 2,
        y = 0,
    },
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { Xchip = 5 }        
    },
    loc_txt = {set = 'Joker', key = 'j_buf_patronizing'},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.Xchip}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
				message = "X" .. card.ability.extra.Xchip .. " Chips",
				colour = G.C.CHIPS,
                buf_Xchip_mod = card.ability.extra.Xchip
            }
        end
		if context.first_hand_drawn and #G.hand.cards > 0 and not context.blueprint then
		G.E_MANAGER:add_event(Event({
		    func = function() 
				card:juice_up(0.8, 0.5)
				local any_forced = nil
				for k, v in ipairs(G.hand.cards) do
					if v.ability.forced_selection then
						any_forced = true
					end
				end
				if not any_forced then 
					G.hand:unhighlight_all()
					
					local numbers = {}
					for i = 1, #G.hand.cards do
						numbers[i] = i
					end
					
					for i = #numbers, 2, -1 do
						local j = math.random(1, i)
						numbers[i], numbers[j] = numbers[j], numbers[i]
					end
					
					for i = 6, #numbers do
						numbers[i] = nil
					end
					
					for i = 1, #numbers do
						local forced_card = G.hand.cards[numbers[i]]
						forced_card.ability.forced_selection = true
						G.hand:add_to_highlighted(forced_card)
					end
				end
				return true
			end}))
		end
		if (context.after or context.pre_discard) and #G.hand.cards > 0 and not context.blueprint then
			G.E_MANAGER:add_event(  -- Thanks WilsontheWolf for the help!
				Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						if G.STATE ~= G.STATES.SELECTING_HAND then
							return false
						end
						G.STATE = G.STATES.HAND_PLAYED
						G.STATE_COMPLETE = true
							G.E_MANAGER:add_event(Event({
								func = function() 
									local any_forced = nil
									for k, v in ipairs(G.hand.cards) do
										if v.ability.forced_selection then
											any_forced = true
										end
									end
									if not any_forced then 
										G.hand:unhighlight_all()
										
										local numbers = {}
										for i = 1, #G.hand.cards do
											numbers[i] = i
										end
										
										for i = #numbers, 2, -1 do
											local j = math.random(1, i)
											numbers[i], numbers[j] = numbers[j], numbers[i]
										end
										
										for i = 6, #numbers do
											numbers[i] = nil
										end
										
										for i = 1, #numbers do
											local forced_card = G.hand.cards[numbers[i]]
											forced_card.ability.forced_selection = true
											G.hand:add_to_highlighted(forced_card)
										end
									end
									return true
								end}))
						G.STATE = G.STATES.SELECTING_HAND
						card:juice_up(0.8, 0.5)
						return true
					end,
				}),
				"other"
			)
		end
    end
}
