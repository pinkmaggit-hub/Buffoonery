SMODS.Joker {
	key = "whitepony",
	name = "White Pony",
	atlas = "buf_jokers",
	pos = { x = 1, y = 2 },
	pools = {Music = true},
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
	cost = 6,
	config = {
		extra = {
			mult = 3,
			mult_mod = 2.0
		}
	},
	pools = {
		["Numetal"] = true
    },
	loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'nu_metal_info'}
		end
		return { vars = {
			card.ability.extra.mult,
			card.ability.extra.mult_mod
		} }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = card.ability.extra.mult }
        end
		if context.end_of_round and context.main_eval and context.game_over == false
		and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult * card.ability.extra.mult_mod
            return {
                message = localize('buf_doubled'),
                colour = G.C.MULT
            }
        end
    end
}
