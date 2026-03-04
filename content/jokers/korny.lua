SMODS.Joker {
    key = "korny",
    name = "Korny Joker",
    atlas = 'buf_jokers',
	pos = { x = 2, y = 0 },
	pools = {Music = true},
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
	no_pool_flag = 'korny_dead',
	config = {
		extra = {
			chips_small = 60,
			chips_big = 100, --> Fallback
			chips_boss = 180,
			chance = 8,
			semby_mod = 4 -- Shimmerberry
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
			card.ability.extra.chips_small,
			card.ability.extra.chips_big,
			card.ability.extra.chips_boss
			--> Chance is "Unknown"
		} }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
			if G.GAME.blind.boss then
				return { chips = card.ability.extra.chips_boss }
			elseif G.GAME.blind:get_type() == 'Small' then
				return { chips = card.ability.extra.chips_small }
			else -- 'Big', Fallback
				return { chips = card.ability.extra.chips_big }
			end
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			local ded_check = card.ability.extra.chance
			if Buffoonery.compat.semby then
				if not G.GAME.blind.boss then
					-- If Shimmerberry is installed: Less likely to die outside of Boss Blinds
					ded_check = ded_check + card.ability.extra.semby_mod
				end
				ded_check = math.floor(ded_check + 0.5) --> Tmtrainer rounding
			end
			if SMODS.pseudorandom_probability(card, 'buf_korny', 1, ded_check) then
				--> This is a buff; The original code had two randoms getting checked, which made the Joker die very quickly
				--> The original code also allowed for Safe-Scumming by using a normal "math.random()" call.
				--> (If you want it to die quicker, lower the "card.ability.extra.chance" by 2 or even 4.)
				G.GAME.pool_flags.korny_dead = true
				expire_card(card) --> functions/expire.lua
                return {
                    message = localize("buf_korny_dd"),
                    colour = G.C.RED
                }
			else
                return {
                    message = localize("buf_korny_ok"),
                    colour = G.C.GREEN
                }
			end
		end
    end
}
