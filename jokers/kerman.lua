SMODS.Sound({key = 'explosion', path = 'explosion.ogg'})

SMODS.Joker {
    key = "kerman",
    name = "Jebediah Kerman",
    atlas = 'maggitsjokeratlas',
    pos = {
        x = 3,
        y = 1,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
	no_pool_flag = 'kerman_went_boom',
    config = {
        extra = { mult = 0, gain = 10, odds = 5 },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_kerman'},
    loc_vars = function(card, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.gain, card.ability.extra.odds, (G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(card, card, context)
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then      
			if pseudorandom("kerman") < G.GAME.probabilities.normal/card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
                    func = function()
						card_eval_status_text(card, 'extra', nil, nil, nil, {message = "B O O M !"})  -- This card is supposed to EMBODY THE FULL KERBAL EXPERIENCE
                        play_sound('buf_explosion')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true; end})) 
                        return true
                    end
                }))
				G.GAME.pool_flags.kerman_went_boom = true
			else
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
				G.E_MANAGER:add_event(Event({
					func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_mult',vars={card.ability.extra.gain}}, colour = G.C.MULT}); return true
					end}))
				return
			end
        end
    end
}

--DONE