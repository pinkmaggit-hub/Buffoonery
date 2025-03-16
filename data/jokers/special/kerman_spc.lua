SMODS.Joker {
    key = "kerman_spc",
    name = "Jebediah Reborn",
    atlas = 'kermanatlas',
    pos = {
        x = 0,
        y = 1,
    },
    rarity = 'buf_spc',
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
	in_pool = false,
    config = {
        extra = { mult = 0, gain = 8, check = false, supergain = 1.5},
    },
	sprite = {
		['Default'] = 0,
		['Mercury'] = 1,
		['Venus'] = 2,
		['Earth'] =3,
		['Mars'] = 4,
		['Jupiter'] = 5,
		['Saturn'] = 6,
		['Uranus'] = 7,
		['Neptune'] = 8,
		['Pluto'] = 9,
	},
    loc_txt = {set = 'Joker', key = 'j_buf_kerman'},
    loc_vars = function(card, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
        return {
            vars = {card.ability.extra.mult, card.ability.extra.gain}
        }
    end,
	
	add_to_deck = function(self, card, context)
		card.config.center.pos.x = card.config.center.sprite['Default'] -- Set to default sprite when added to deck, just in case
		card.ability.extra.mult = G.GAME.pool_flags.kermans_mult or 0 -- Uses the mult value Jeb had before
		G.GAME.pool_flags.kerman_is_krakened = true -- Prevents spawning again if another black hole is used
	end,
	
    calculate = function(card, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.using_consumeable and not context.blueprint then
			if context.consumeable.ability.set == 'Planet' then      
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
				G.E_MANAGER:add_event(Event({
					func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
						card:juice_up(1, 0.5)
						card.config.center.pos.x = card.config.center.sprite[context.consumeable.ability.name] or card.config.center.sprite['Default']
					return true end}))
					SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.MULT}, card)
					return true
					end}))
				return
			elseif context.consumeable.ability.name == 'Black Hole' then
				if not card.ability.extra.check then -- prevents the super upgrade from happening when this joker is first added
					card.ability.extra.check = true
				else
					card.ability.extra.mult = card.ability.extra.mult * card.ability.extra.supergain
					G.E_MANAGER:add_event(Event({
						func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
							card:juice_up(1, 0.5)
							card.config.center.pos.x = card.config.center.sprite['Default']
						return true end}))
						SMODS.calculate_effect({message = localize('buf_supergrade'), colour = G.C.DARK_EDITION}, card)
						return true
						end}))
					return
				end
			end
		end
    end,
	
		-- HIDE JOKER IN COLLECTION (THANKS, EREMEL) --
	inject = function(self)
		if not Buffoonery.config.show_spc then
			SMODS.Joker.super.inject(self)
			G.P_CENTER_POOLS.Joker[#G.P_CENTER_POOLS.Joker] = nil
		else
			SMODS.Joker.super.inject(self)
		end
	end
}