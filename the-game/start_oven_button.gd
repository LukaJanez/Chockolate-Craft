extends Button

var brownie = preload("res://brownie.tscn")
var crosant = preload("res://crosant.tscn")
#var milkshake = preload("res://milkshake.tscn")
#var group_name = "in_use"

func _on_pressed(group_name = 'in_use'):
	print('entered')
	if Globals.butter_oven and Globals.creme_oven:
		if Globals.dough_oven:
			pass
		else:
			inst1()
	elif Globals.creme_oven and Globals.dough_oven:
		if Globals.butter_oven:
			pass
		else:
			inst2()
		
	for node in get_tree().get_nodes_in_group(group_name):
		if is_instance_valid(node):
			print('dead')
			node.queue_free()
			Globals.shugar_dead = true
			Globals.cocoa_dead = true
			Globals.milk_dead = true
			Globals.dough_dead = true
			Globals.butter_dead = true
	

func inst1():
	#var spawnpoint = get_node("/root/main/start_machine_button/start_button")
	
		var instance = brownie.instantiate()
		get_parent().add_child(instance)
		instance.position = $spawnpoint.position# - #get_parent().global_position
		

func inst2():
		var instance = crosant.instantiate()
		get_parent().add_child(instance)
		instance.position = $spawnpoint.position# - #get_parent().global_position
		
	
