SMODS.Back{
    key = 'jstation',
    unlocked = true,
    discovered = true,
    atlas = 'maggitsmiscatlas',
    pos = {
        x = 0,
        y = 0,
    },
    config = {},

    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
			G.hand:change_size(1)
            local card = nil
			if not buf.compat.sleeves or G.GAME.selected_sleeve ~= 'sleeve_buf_jstation' then
				play_sound('timpani')
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_memcard', 'jst')
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				card:set_edition()
				G.GAME.joker_buffer = 0
			end
        return true end }))
    end,
}