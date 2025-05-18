extends Button

var hot_chock = preload("res://hot_chock.tscn")
#var milkshake = preload("res://milkshake.tscn")
#var group_name = "in_use"

func _on_pressed(group_name = 'in_use'):
	print('entered')
	if Globals.creme_pot and Globals.milk_pot:
		inst()
	for node in get_tree().get_nodes_in_group(group_name):
		if is_instance_valid(node):
			print('dead')
			node.queue_free()
			Globals.shugar_dead = true
			Globals.cocoa_dead = true
			Globals.milk_dead = true
			Globals.dough_dead = true
			Globals.butter_dead = true

func inst():
	var instance = hot_chock.instantiate()
	get_parent().add_child(instance)
	instance.position = $spawnpoint.position# - #get_parent().global_position
	Globals.milk_dead = true
	
		
