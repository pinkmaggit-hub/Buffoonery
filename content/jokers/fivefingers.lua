SMODS.Joker {
    key = "fivefingers",
    name = "Five Fingers",
	atlas = "buf_jokers",
	pos = { x = 1, y = 0 },
	pools = {Music = true},
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
	config = {
		extra = {
			--limit = 5,
			xmult = 2.5
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
			card.ability.extra.xmult
		} }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
			if #context.scoring_hand == 5 and math.fmod(#G.jokers.cards, 5) == 0 then
				return { xmult = card.ability.extra.xmult }
			end
        end
    end
}
