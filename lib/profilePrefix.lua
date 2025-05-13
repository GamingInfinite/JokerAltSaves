function G.UIDEF.profile_select()
	G.focused_profile = G.focused_profile or G.SETTINGS.profile or (AltSaves.profile_prefix .. "1")

	local t = create_UIBox_generic_options({
		padding = 0,
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0, draw_layer = 1, minw = 4 },
				nodes = {
					create_tabs({
						tabs = {
							{
								label = AltSaves.profile_prefix .. "1",
								chosen = G.focused_profile == (AltSaves.profile_prefix .. "1"),
								tab_definition_function = G.UIDEF.profile_option,
								tab_definition_function_args = AltSaves.profile_prefix .. "1",
							},
							{
								label = AltSaves.profile_prefix .. "2",
								chosen = G.focused_profile == (AltSaves.profile_prefix .. "2"),
								tab_definition_function = G.UIDEF.profile_option,
								tab_definition_function_args = AltSaves.profile_prefix .. "2",
							},
							{
								label = AltSaves.profile_prefix .. "3",
								chosen = G.focused_profile == (AltSaves.profile_prefix .. "3"),
								tab_definition_function = G.UIDEF.profile_option,
								tab_definition_function_args = AltSaves.profile_prefix .. "3",
							},
						},
						snap_to_nav = true,
					}),
				},
			},
		},
	})
	return t
end