SMODS.Joker {
    key = "rerollin",
    name = "Rerollin'",
	atlas = "buf_jokers",
	pos = { x = 0, y = 0 },
	pools = {Music = true},
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
	config = {
		extra = {
			money = 20,
			roll = {
				count = 0,
				need = 5
			}
		}
	},
	pools = {
		["Numetal"] = true
    },
	loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			-- Credits for original artwork author [Snakey] (Adapted by PinkMaggit for Balatro)
			info_queue[#info_queue+1] = { set = 'Other', key = 'snakey_info' }
			info_queue[#info_queue+1] = {set = 'Other', key = 'nu_metal_info'}
		end
		return { vars = {
			card.ability.extra.money,
			math.max((card.ability.extra.roll.need - card.ability.extra.roll.count) or 5, 0)
		} }
	end,
    calculate = function(self, card, context)
		if not context.blueprint then
			if context.reroll_shop and card.ability.extra.roll.count < card.ability.extra.roll.need then
				card.ability.extra.roll.count = card.ability.extra.roll.count + 1
				if card.ability.extra.roll.count >= card.ability.extra.roll.need then
					ease_dollars(card.ability.extra.money)
					return {
						message = localize('buf_rerollin'),
						colour = G.C.MONEY
					}
				else
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.2,
						func = function()
							card:juice_up(0.1)
							play_sound('card1', 1.15, 0.3)
							return true 
						end
					}))
				end
			end
			if context.ending_shop then
				if card.ability.extra.roll.count ~= 0 then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.2,
						func = function()
							card:juice_up(0.1)
							play_sound('tarot2', 1.15, 0.3)
							return true 
						end
					}))
				end
				card.ability.extra.roll.count = 0
			end
		end
	end
}
