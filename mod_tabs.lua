Buffoonery.config_tab = function()
	return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
			{ n=G.UIT.R, config = {align = 'cm'}, nodes={
				create_toggle({label = localize('buf_cf_show_spc'), ref_table = Buffoonery.config, info = localize('buf_cf_req_restart'), ref_value = 'show_spc', active_colour = Buffoonery.badge_colour, right = true}),
				create_toggle({label = localize('buf_cf_show_info'), ref_table = Buffoonery.config, info = localize('buf_cf_info_info'), ref_value = 'show_info', active_colour = Buffoonery.badge_colour, right = true}),
			},
			},
	}}
end

SMODS.current_mod.extra_tabs = function()
  local credits_tab = {
    n = G.UIT.ROOT,
    config = { align = 'tm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {{
      n = G.UIT.R,
      nodes = {
        {
          n = G.UIT.C,
          config = { padding = 0.2 },
          nodes = {
            {
              n = G.UIT.R,
			  config = { align = 'cr', minh = 0.5 },
              nodes = {
                { n = G.UIT.T, config = { text = localize('buf_cr_artcode'), colour = G.C.BLUE, scale = 0.65 } },
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cr', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'PinkMaggit', colour = G.C.WHITE, scale = 0.4 } }
              }
            },
			{
              n = G.UIT.R,
			  config = { align = 'cr', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = localize('buf_cr_localization'), colour = G.C.BLUE, scale = 0.65 } },
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cr', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'BurAndBY + Nulle0 (RU)', colour = G.C.WHITE, scale = 0.4 } }
              }
            },
			{
              n = G.UIT.R,
              config = { align = 'cr', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'Ethylene (ZH-CN)', colour = G.C.WHITE, scale = 0.4 } }
              }
            },
			{
              n = G.UIT.R,
              config = { align = 'cr', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = 'PinkMaggit (PT-BR)', colour = G.C.WHITE, scale = 0.4 } }
              }
            },
          }
        },
		{
          n = G.UIT.C,
          config = { padding = 0.2 },
          nodes = {
            {
              n = G.UIT.R,
			  config = { align = 'cl', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = localize('buf_cr_sfx'), colour = G.C.RED, scale = 0.65 } }
              }
            },
            {
              n = G.UIT.R,
              config = { align = 'cl', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = "HexaCryonic (XChips, EMult, EChips)", colour = G.C.WHITE, scale = 0.4 } }
              }
            },
			{
              n = G.UIT.R,
			  config = { align = 'cl', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = localize('buf_cr_misc'), colour = G.C.RED, scale = 0.65 } }
              }
            },
			{
              n = G.UIT.R,
              config = { align = 'cl', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = "Snakey (Limp Bizkit/Korn Pixel Art)", colour = G.C.WHITE, scale = 0.4 } }
              }
            },
			{
              n = G.UIT.R,
              config = { align = 'cl', minh = 0.25 },
              nodes = {
                { n = G.UIT.T, config = { text = "Lykrast (Wiki)", colour = G.C.WHITE, scale = 0.4 } }
              }
            }
          }
        }
      }
    }}
  }

  return {
    {
      label = localize('b_credits'),
      tab_definition_function = function()
        return credits_tab
      end
    }
  }
end