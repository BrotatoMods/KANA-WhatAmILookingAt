extends "res://ui/menus/shop/item_description.gd"

onready var mod_info_label = get_node('ModInfo/ModName')
onready var kana_waila = get_node("/root/ModLoader/KANA-WhatAmILookingAt")


func _ready():
	# Add more spacing
	add_constant_override('separation', 30)

	
func set_item(item_data:ItemParentData):
	# Call original function
	.set_item(item_data)
	
	# Update mod info label
	if kana_waila.kana_waila_mod_info.has(item_data.my_id):
		mod_info_label.text = kana_waila.kana_waila_mod_info[item_data.my_id]
	else:
		mod_info_label.text = 'vanilla'
