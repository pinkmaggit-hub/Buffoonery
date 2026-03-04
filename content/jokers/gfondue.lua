SMODS.Joker {
    key = "gfondue",
    name = "Gold Fondue",
    atlas = 'buf_jokers',
	pos = { x = 5, y = 0 },
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
	no_pool_flag = 'gfondue_licked',
	config = {
		extra = {
			money = 8,
			money_mod = 2
		}
	},
	pools = {
        ["Food"] = true
    },
	loc_vars = function(self, info_queue, card)
		return { vars = {
			card.ability.extra.money,
			card.ability.extra.money_mod
		} }
	end,
    calculate = function(self, card, context)
		if context.first_hand_drawn then
			local eval = function() return G.GAME.current_round.hands_played == 0 end
			juice_card_until(card, eval, true)
		end
		if G.GAME.current_round.hands_played == 0 then
			if context.before then
				return {
					dollars = card.ability.extra.money,
					card = card
				}
			end
			if context.after and not context.blueprint then
				card.ability.extra.money = card.ability.extra.money - card.ability.extra.money_mod
				if card.ability.extra.money <= 0 then
					G.GAME.pool_flags.gfondue_licked = true
					expire_card(card) --> functions/expire.lua
					return {
						message = localize('buf_gfondue_licked'),
						colour = G.C.FILTER
					}
				else
					return {
						message = "-"..localize('$')..card.ability.extra.money_mod,
						colour = G.C.MONEY
					}
				end
			end
		end
    end
}
