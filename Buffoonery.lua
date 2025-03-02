-- defs --
Buffoonery = SMODS.current_mod

-- ATLASES --
buf = {}
SMODS.Atlas {
	key = 'buf_jokers',
	path = "jokers.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_special',
	path = "special.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "buf_consumables",
	path = "consumables.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_enhancements',
	path = "enhancements.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_decks',
	path = "decks.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_sleeves',
	path = "sleeves.png",
	px = 73,
	py = 95
}
SMODS.Atlas {
	key = 'rouletteatlas',
	path = "roulette.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'kermanatlas',
	path = "kerman.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'sayatlas',
	path = "sayajimbo.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "modicon",
	path = "buf_icon.png",
	px = 34,
	py = 34
}
SMODS.Atlas {
	key = 'buf_stakes', 
	path = 'stakes.png', 
	px = 29, 
	py = 29
}
SMODS.Atlas {
	key = 'buf_stickers', 
	path = 'stickers.png', 
	px = 71, 
	py = 95
}

-- COMPAT SECTION --
buf.compat = {
	sleeves = (SMODS.Mods['CardSleeves'] or {}).can_load,
	unstable = (SMODS.Mods['UnStable'] or {}).can_load,
	talisman = (SMODS.Mods['Talisman'] or {}).can_load,
}

if not buf.compat.talisman then
	NFS.load(Buffoonery.path .. 'notalisman.lua')()
end

-- FUNCTIONS --
local VanillaHighlight = CardArea.add_to_highlighted -- Fix Bunco incompat with Patronizing Joker

function expire_card(_card, msg, color) -- function to remove card with the Cavendish animation and display a message
	G.E_MANAGER:add_event(Event({
		func = function()
			if msg then SMODS.calculate_effect({message = msg, colour = color}, _card) end
			play_sound('tarot1')
			_card.T.r = -0.2
			_card:juice_up(0.3, 0.4)
			_card.states.drag.is = true
			_card.children.center.pinch.x = true
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
				func = function()
						G.jokers:remove_card(_card)
						_card:remove()
						_card = nil
					return true; 
				end})) 
			return true
		end
	}))
end

function buf_add_to_highlighted(card, silent) -- Fix Bunco incompatibility. Bunco modifies CadArea.add_to_highlighted and breaks Patronizing Joker, so I made a separate function.
    VanillaHighlight(G.hand, card, silent)
end

-- CONFIG --
Buffoonery.config_tab = function()
	return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
			{ n=G.UIT.R, config = {align = 'cm'}, nodes={
				create_toggle({label = localize('buf_cf_show_spc'), ref_table = Buffoonery.config, info = localize('buf_cf_req_restart'), ref_value = 'show_spc', active_colour = Buffoonery.badge_colour, right = true}),
				create_toggle({label = localize('buf_cf_show_info'), ref_table = Buffoonery.config, info = localize('buf_cf_info_info'), ref_value = 'show_info', active_colour = Buffoonery.badge_colour, right = true}),
				create_toggle({label = localize('buf_cf_memcard_perf'), ref_table = Buffoonery.config, info = localize('buf_cf_perf_info'), ref_value = 'memcard_perf', active_colour = Buffoonery.badge_colour, right = true}),
			},
			},
	}}
end

-- RARITY --
SMODS.Rarity{
	key = "spc",
	loc_txt = {
		name = localize('k_buf_spc')
	},
	badge_colour = HEX('ee8f8d'),
	pools = {["Joker"] = false},
	get_weight = function(self, weight, object_type)
		return weight
	end,
}

SMODS.Stake{ -- Prismatic Stake
    key = 'prismatic',
    applied_stakes = {'gold'},
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		function buf_get_new_boss()
			G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {
			}
			if G.GAME.perscribed_bosses and G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then 
				local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante] 
				G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
				G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
				return ret_boss
			end
			if G.FORCE_BOSS then return G.FORCE_BOSS end
			
			local eligible_bosses = {}
			for k, v in pairs(G.P_BLINDS) do
				if not v.boss then

				elseif not v.boss.showdown and (v.boss.min <= math.max(1, G.GAME.round_resets.ante) and ((math.max(1, G.GAME.round_resets.ante))%4 ~= 0 or G.GAME.round_resets.ante < 2)) then
					eligible_bosses[k] = true
				elseif v.boss.showdown and (G.GAME.round_resets.ante)%4 == 0 and G.GAME.round_resets.ante >= 2 then
					eligible_bosses[k] = true
				end
			end
			for k, v in pairs(G.GAME.banned_keys) do
				if eligible_bosses[k] then eligible_bosses[k] = nil end
			end

			local min_use = 100
			for k, v in pairs(G.GAME.bosses_used) do
				if eligible_bosses[k] then
					eligible_bosses[k] = v
					if eligible_bosses[k] <= min_use then 
						min_use = eligible_bosses[k]
					end
				end
			end
			for k, v in pairs(eligible_bosses) do
				if eligible_bosses[k] then
					if eligible_bosses[k] > min_use then 
						eligible_bosses[k] = nil
					end
				end
			end
			local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
			G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1
			
			return boss
		end
		
		get_new_boss = buf_get_new_boss
    end,

    colour = HEX('5e5b54'),
	shader = 'shine',
    pos = {x = 0, y = 0},
    sticker_pos = {x = 0, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}

SMODS.Stake{ -- Platinum Stake
    key = 'platinum',
    applied_stakes = {'buf_prismatic'},
    above_stake = 'buf_prismatic',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		G.GAME.win_ante = 12
    end,

    colour = HEX('5e5b54'),
	shader = 'shine',
    pos = {x = 1, y = 0},
    sticker_pos = {x = 1, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}

-- JOKERS --
-- common
NFS.load(Buffoonery.path .. 'data/jokers/afan.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/afan_spc.lua')() -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/cashout.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/clays.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/fivefingers.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/gfondue.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/camarosa.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/kerman.lua')()  -- (Jebediah Kerman, a.k.a. Jeb)
NFS.load(Buffoonery.path .. 'data/jokers/special/kerman_spc.lua')() -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/korny.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/laidback.lua')()
-- uncommon
NFS.load(Buffoonery.path .. 'data/jokers/denial.lua')() -- (Arstotzkan Denial)
NFS.load(Buffoonery.path .. 'data/jokers/clown.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/van.lua')() -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/argument.lua')() -- (Pertinent Argument)
NFS.load(Buffoonery.path .. 'data/jokers/porcelainj.lua')() 
NFS.load(Buffoonery.path .. 'data/jokers/rerollin.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/roulette.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/sayajimbo.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/whitepony.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/blackstallion.lua')()  -- [SPECIAL]
-- rare
NFS.load(Buffoonery.path .. 'data/jokers/abyssalp.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/abyssalecho.lua')() -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/dorkshire.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/dorkshire_g.lua')()  -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/lemmesolo.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/memcard.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/memcard_dx.lua')()   -- [SPECIAL]
NFS.load(Buffoonery.path .. 'data/jokers/patronizing.lua')()
-- legendary
NFS.load(Buffoonery.path .. 'data/jokers/maggit.lua')()

-- CONSUMABLES
function conversionTarot(hand, newcenter) -- For tarots that change enhancements. Directly stolen from Kirbio's UnStable mod (with his permission, ofc. thanks, Kirbio!)
	for i=1, #hand do
		local percent = 1.15 - (i-0.999)/(#hand-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('card1', percent);hand[i]:juice_up(0.3, 0.3);return true end }))
	end
	delay(0.2)
	
	for i=1, #hand do
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
				hand[i]:set_ability(G.P_CENTERS[newcenter])
				return true end }))
	end
	
	for i=1, #hand do
		local percent = 0.85 + (i-0.999)/(#hand-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('tarot2', percent, 0.6);hand[i]:juice_up(0.3, 0.3);return true end }))
	end
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	delay(0.5)
end

NFS.load(Buffoonery.path .. 'data/consumables/nobility.lua')()

-- DECKS --
NFS.load(Buffoonery.path .. 'data/decks/jstation.lua')()
NFS.load(Buffoonery.path .. 'data/decks/galloping.lua')()
NFS.load(Buffoonery.path .. 'data/decks/porcelain.lua')()

-- ENHANCEMENTS --
NFS.load(Buffoonery.path .. 'data/enhancements/porcelain.lua')()
NFS.load(Buffoonery.path .. 'data/enhancements/porcelain_g.lua')()

-- SLEEVES --
if buf.compat.sleeves then
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_jstation.lua')()
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_galloping.lua')()
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_porcelain.lua')()
end

-- SOUNDS --
SMODS.Sound({key = 'phase', path = 'phase.ogg'})
SMODS.Sound({key = 'explosion', path = 'explosion.ogg'})
SMODS.Sound({key = 'roul1', path = 'roul1.ogg'})
SMODS.Sound({key = 'roul2', path = 'roul2.ogg'})
SMODS.Sound({key = 'emult', path = 'emult.wav'})  -- Sound effect by HexaCryonic

-- CHANGELOG MOVED TO SEPARATE .md FILE ------
-- fixed clown upgrading by 20 the forst time
-- fixed clown's scaling bugging out or being lost when starting a new run
-- fixed patronizing joker not selecting cards during Cerulean Bell bossfight
-- abyssal prism no longer strips upgrades
-- Banish replaced with Exile
-- Added Van
-- Added Abyssal Echo
-- Added Kerman Reborn
-- Added Supportive Joker
-- Added Bitter Fan
-- Added Let Me Solo Her
-- Added Sayajimbo

-- TODO: Jeb art: earth, jupiter, saturn, uranus, neptune
	-- 1 more Special Jokers
    -- special jokies discover reqs
	-- supportive jk condition
	-- special spectral
	-- plat stake
	-- translation
-- curr spc: Kerman, Dork, WP, Memcard, Patronizing, Afan, clown, prism (8/9)

SMODS.Joker {
    key = "interpreter",
    name = "Interpreter",
    atlas = 'buf_jokers',
    pos = {
        x = 5,
        y = 0,
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { check = true, mult_amount = 0, mult_joker = nil },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_interpreter'},
    calculate = function(self, card, context)  -- BEWARE: JANKY ASS CODE BELOW
		local origCalcIndiv = SMODS.calculate_individual_effect
		local function moddedCalcIndiv(effect, scored_card, key, amount, from_edition)  -- Hooked this func to get the amount of mult provided by the scoring joker
			origCalcIndiv(effect, scored_card, key, amount, from_edition)
			if scored_card == card.ability.extra.mult_joker then  -- prevents playing cards from interfering, eg. Mult cards
				if (key == 'mult' or key == 'h_mult' or key == 'mult_mod') and amount then
					if from_edition then  -- if the scored joker has an edition that adds mult, add the amount to calculation
						card.ability.extra.mult_amount = amount * 5
					elseif card.ability.extra.check and card.ability.extra.mult_amount ~= nil then
						card.ability.extra.mult_amount = (card.ability.extra.mult_amount) + amount * 5
						card.ability.extra.check = false
					end
				end
			end
		end
	
        if context.before and not card.getting_sliced then  -- switch to modified scoring func before scoring
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then card.ability.extra.mult_joker = G.jokers.cards[i-1] end
			end
			if not context.blueprint then
				SMODS.calculate_individual_effect = moddedCalcIndiv
			end
		end
		
		if context.joker_main and not card.getting_sliced then
			return {
				chips = card.ability.extra.mult_amount
			}
        end
		
		if context.after and not context.blueprint then  -- go back to original func at EoR
			SMODS.calculate_individual_effect = origCalcIndiv
			card.ability.extra.check = true
			card.ability.extra.mult_amount = 0
			card.ability.extra.mult_joker = nil
		end
    end,
}

local function buf_scry(value)
	for i = 1, value do
		local _card = G.deck.cards[#G.deck.cards-(i-1)]
		local underscore_pos = string.find(SMODS.Suits[_card.base.suit].key, "_")  -- Checks for mod prefixes in suit keys and removes them from printed string
		if underscore_pos then
			card.ability.extra.tsuit[i] = localize('buf_'..string.sub(SMODS.Suits[_card.base.suit].key, underscore_pos + 1))
		else
			card.ability.extra.tsuit[i] =  localize('buf_'..SMODS.Suits[_card.base.suit].key)  -- [UPDATE] Now uses SMODS functionality to improve mod compatibility
		end
		local key = SMODS.Ranks[_card.base.value].key
		local tkey = localize('buf_'..key)
		card.ability.extra.trank[i] =  ((tkey ~= 'ERROR' and tkey) or key) .. localize('buf_of')
		local underscore_pos2 = string.find(card.ability.extra.trank[i], "_")
		if underscore_pos2 then
			local langkey = 'buf_'..string.sub(((tkey ~= 'ERROR' and tkey) or key), underscore_pos2 + 1)
			card.ability.extra.trank[i] = localize(langkey) .. localize('buf_of')
		end
	end
end

SMODS.Joker {
    key = "supportive",
    name = "Supportive Joker",
    atlas = 'buf_special',
    pos = {
        x = 5,
        y = 0,
    },
    rarity = "buf_spc",
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
	in_pool = false,
    config = {
        extra = { xchips = 4, trank = {}, tsuit = {}, scry = false },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_supportive'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
		if card.ability.extra.scry == true then
			return {
				key = self.key .. '_alt',
				vars = {card.ability.extra.trank[1], card.ability.extra.trank[2], card.ability.extra.trank[3], card.ability.extra.tsuit[1], card.ability.extra.tsuit[2], card.ability.extra.tsuit[3], card.ability.extra.xchips}
			}
		else
			return { vars = { card.ability.extra.xchips } }
		end
    end,
	update = function(self, card, dt)
		if G.deck then
			for i = 1, 3 do
				local _card = G.deck.cards[#G.deck.cards-(i-1)]
				local underscore_pos = string.find(SMODS.Suits[_card.base.suit].key, "_")  -- Checks for mod prefixes in suit keys and removes them from printed string
				if underscore_pos then
					card.ability.extra.tsuit[i] = localize('buf_'..string.sub(SMODS.Suits[_card.base.suit].key, underscore_pos + 1))
				else
					card.ability.extra.tsuit[i] =  localize('buf_'..SMODS.Suits[_card.base.suit].key)  -- [UPDATE] Now uses SMODS functionality to improve mod compatibility
				end
				local key = SMODS.Ranks[_card.base.value].key
				local tkey = localize('buf_'..key)
				card.ability.extra.trank[i] =  ((tkey ~= 'ERROR' and tkey) or key) .. localize('buf_of')
				local underscore_pos2 = string.find(card.ability.extra.trank[i], "_")
				if underscore_pos2 then
					local langkey = 'buf_'..string.sub(((tkey ~= 'ERROR' and tkey) or key), underscore_pos2 + 1)
					card.ability.extra.trank[i] = localize(langkey) .. localize('buf_of')
				end
			end
		end
	end,
	add_to_deck = function(self, card, context)
		if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED then
			card.ability.extra.scry = true
		end
	end,
    calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.extra.scry = true
		end
        if context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
        end
		if context.end_of_round then
			card.ability.extra.scry = false
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