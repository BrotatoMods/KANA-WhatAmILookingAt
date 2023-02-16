extends Node

const KANA_WAILA_LOG = "KANA-WhatAmILookingAt"

# Save the my_id of each thing with a reference to the mod_name
# {
#	item_street_stall: damiBenro-Junker
# }

# Then I can just look this up for example in the shop and add text
var kana_waila_mod_info := {}

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", KANA_WAILA_LOG)
	modLoader.install_script_extension("res://mods-unpacked/KANA-WhatAmILookingAt/extensions/mods-unpacked/Darkly77-ContentLoader/content_loader.gd")
	modLoader.install_script_extension("res://mods-unpacked/KANA-WhatAmILookingAt/extensions/ui/menus/shop/item_description.gd")

func _ready():
	ModLoaderUtils.log_info("Ready", KANA_WAILA_LOG)
	_kana_waila_extend_item_panel_ui()


func _kana_waila_extend_item_panel_ui():
	# Customize item_description scene
	var item_description = load("res://ui/menus/shop/item_description.tscn").instance()
	var mod_info_label = load("res://mods-unpacked/KANA-WhatAmILookingAt/custom_scenes/mod_info.tscn").instance()
	
	# Add mod info label
	var header = item_description.get_node('HBoxContainer')
	
	item_description.add_child_below_node(header, mod_info_label, true)

	mod_info_label.set_owner(item_description)
	
	ModLoader.save_scene(item_description, "res://ui/menus/shop/item_description.tscn")
