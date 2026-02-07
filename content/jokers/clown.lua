SMODS.Joker {
	key = "clown",
	name = "Clown",
	atlas = "buf_jokers",
	pos = { x = 6, y = 2 },
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
			chips = 15, --> Starts with 15 Chips
			chip_mod = 15
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
			card.ability.extra.chip_mod,
			card.ability.extra.chips
		} }
	end,
    add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			--Warn: Semi-Stable Code (Referencing Unchecked Ability-Paths)
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == 'j_buf_clown'
				and not (G.jokers.cards[i].ability.extra.expire or card.ability.extra.expire)
				and G.jokers.cards[i] ~= card --> Safety-Check
				then -- Spawn a "Clowncar":
					-- Mark Destruction (twice)
					card.ability.extra.expire = true
					G.jokers.cards[i].ability.extra.expire = true
					-- Spawn a Clowncar:
					local clowncar = SMODS.add_card({key = 'j_buf_van'})
					clowncar.ability.extra.chips = G.jokers.cards[i].ability.extra.chips + card.ability.extra.chips
					-- Destroy (once):
					expire_card(G.jokers.cards[i]) --> functions/expire.lua
				elseif G.jokers.cards[i].config.center.key == 'j_buf_van' then --> Buff all "Clowncars":
					-- Mark Destruction
					card.ability.extra.expire = true
					-- Buff "Clowncar" and add an Additional 15 Chips, Effectively Pre-Adding the Buff
					G.jokers.cards[i].ability.extra.clowns = G.jokers.cards[i].ability.extra.clowns + 1
					G.jokers.cards[i].ability.extra.chips = G.jokers.cards[i].ability.extra.chips + G.jokers.cards[i].ability.extra.chip_mod
					-- Talkitoo: Electric Boogalo
					SMODS.calculate_effect({
						message = localize('buf_hopin'),
						colour = G.C.BUF_SPC
					}, G.jokers.cards[i])
				end
			end
			-- Destroy Self (if needed)
			if card.ability.extra.expire then
				expire_card(card) --> functions/expire.lua
			end
		end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
        	return {
        		chips = card.ability.extra.chips
        	}
        end
		if context.card_added and context.card.ability.set == "Joker" and not card.ability.extra.expire then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS
			}
		end
	end
}
