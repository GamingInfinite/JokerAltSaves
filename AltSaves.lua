if not AltSaves then
    AltSaves = {}
end
local mod_path = "" .. SMODS.current_mod.path
AltSaves.path = mod_path
AltSaves_config = SMODS.current_mod.config

local files = NFS.getDirectoryItems(mod_path .. "lib")
for _, file in ipairs(files) do
    print("Loading AltSaves...")
    local f, err = SMODS.load_file("lib/" .. file)
    if err then
        error(err)
    end
    f()
end

local prefix_test = NFS.read("Mods/JokerAltSaves/AltSaves.txt")
print(prefix_test)

AltSaves.config_tab = function()
    jas_nodes = {
		{
			n = G.UIT.R,
			config = { align = "cm" },
			nodes = {
				{
					n = G.UIT.O,
					config = {
						object = DynaText({
							string = "Enter Alt Prefix (Requires Restart)",
							colours = { G.C.WHITE },
							shadow = true,
							scale = 0.4,
						}),
					},
				},
			},
		},
	}
	left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05 }, nodes = {} }
	config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { left_settings, right_settings } }
	jas_nodes[#jas_nodes + 1] = config

	--Add warning notifications later for family mode
	jas_nodes[#jas_nodes + 1] = create_text_input({
        w = 4,
        max_length = 25,
        prompt_text = "Alt Prefix",
        ref_table = AltSaves_config,
        ref_value = "prefix",
        extended_corpus = true,
        keyboard_offset = 1,
		callback = function (val)
			NFS.write(mod_path .. "AltSaves.txt", AltSaves_config.prefix)
		end
    })

	return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			minh = 6,
			r = 0.1,
			minw = 10,
			align = "cm",
			padding = 0.2,
			colour = G.C.BLACK,
		},
		nodes = jas_nodes,
	}
end

SMODS.current_mod.config_tab = AltSaves.config_tab
