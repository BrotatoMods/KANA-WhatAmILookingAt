extends "res://mods-unpacked/Darkly77-ContentLoader/content_loader.gd"

const KANA_WAILA_LOG = "KANA-WhatAmILookingAt"

onready var kana_waila_node = get_node("/root/ModLoader/KANA-WhatAmILookingAt")

func _ready():
	ModLoaderUtils.log_debug("Hooking - ready in content loader Oo", KANA_WAILA_LOG)


func load_data(mod_data_path, mod_name:String = "???"):
	# Call the original function
	.load_data(mod_data_path, mod_name)

	# I have to load the mod_data here again because I cant hook _install_data()
	# because the mod_name / mod_data_path info is missing there.
	
	var mod_data = load(mod_data_path)
	
	# all have a my_id property
	
	# TODO: If no mod_name is passed (mod_name = "???"), 
	# I can split the path an get the folder name.
	
	# items
	if mod_data.items:
		for item in mod_data.items:
			kana_waila_add_mod_info(item.my_id, mod_name)
	# weapons
	if mod_data.weapons:
		for weapon in mod_data.weapons:
			kana_waila_add_mod_info(weapon.my_id, mod_name)
	# characters
	if mod_data.characters:
		for character in mod_data.characters:
			kana_waila_add_mod_info(character.my_id, mod_name)
	# challanges
	if mod_data.challenges:
		for challange in mod_data.challenges:
			kana_waila_add_mod_info(challange.my_id, mod_name)
	# sets
	if mod_data.sets:
		for set in mod_data.sets:
			kana_waila_add_mod_info(set.my_id, mod_name)
	
	ModLoaderUtils.log_debug_json_print("Mod Info collelcted", kana_waila_node.kana_waila_mod_info, KANA_WAILA_LOG)


func kana_waila_add_mod_info(my_id, mod_name):
	kana_waila_node.kana_waila_mod_info[my_id] = mod_name
