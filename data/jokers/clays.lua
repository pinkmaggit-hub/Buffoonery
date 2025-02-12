SMODS.Joker {
    key = "clays",
    name = "Clay Shooting",
    atlas = 'buf_jokers',
    pos = {
        x = 5,
        y = 1,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        extra = { gold = 8, aim = 0, success = false, once = 0, add_check = true },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_clays'},
    loc_vars = function(self, info_queue, card)
		if card.ability.extra.once == 1 then
            return {
				key = self.key .. '_alt', 
				vars = {card.ability.extra.gold, card.ability.extra.aim}
			}
		else
			return {
				vars = {card.ability.extra.gold, card.ability.extra.aim}
			}
		end 
    end,
	
	add_to_deck = function(self, card, context)
		if card.ability.extra.once == 0 then
			card.ability.extra.once = 1 
			card.ability.extra.aim = math.random(1, G.GAME.current_round.hands_left)
			SMODS.calculate_effect({message = localize('k_reset'), colour = G.C.FILTER}, card)  -- resets when added to deck
		end
		
	end,
	
    calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced then
			if card.ability.extra.add_check then  -- skips first reset after added to deck
				card.ability.extra.add_check = false  -- useful for when the card is added by other means than the shop, eg. Riff-Raff.
			else
				card.ability.extra.success = false
				card.ability.extra.aim = math.random(1, G.GAME.current_round.hands_left)
				return {
					message = localize('k_reset'),
					colour = G.C.FILTER,
				}
			end
		end
		if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card then
			if card.ability.extra.aim == G.GAME.current_round.hands_played then
				card.ability.extra.success = true
				card.ability.extra.add_check = false  -- prevents skipping next reset if added mid-round
				return {
					message = localize('buf_hit'),
					colour = G.C.GREEN,
				}
			else
				return {
					message = localize('buf_miss'),
					colour = G.C.RED,
				}
			end
        end
    end,
	
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.success then
			return (card.ability.extra.gold)
		end
	end
}
