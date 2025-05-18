extends Button

var chocko_creme = preload("res://cohocko_creme.tscn")
var milkshake = preload("res://milkshake.tscn")
var group_name = "in_use"

func _on_pressed(_group_name = 'in_use'):
	print('entered')
	choco_cream()
	
func choco_cream():
	if Globals.shugar_blender and Globals.cocoa_blender:
		inst()
		print('ok')
		for node in get_tree().get_nodes_in_group(group_name):
			if is_instance_valid(node):
				print('dead')
				node.queue_free()
				Globals.shugar_dead = true
				Globals.cocoa_dead = true
				Globals.milk_dead = true
				Globals.dough_dead = true
				Globals.butter_dead = true
				Globals.shugar_blender = false
				Globals.cocoa_blender = false
				Globals.milk_blender = false
	print('ok')
	if Globals.shugar_blender and Globals.cocoa_blender and Globals.milk_blender:
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
				Globals.shugar_blender = false
				Globals.cocoa_blender = false
				Globals.milk_blender = false
	#	print("Error: chocko_creme is not assigned!")
func inst():
	#var spawnpoint = get_node("/root/main/start_machine_button/start_button")
	if Globals.milk_blender:
		var instance = milkshake.instantiate()
		get_parent().add_child(instance)
		instance.position = $spawnpoint.position# - #get_parent().global_position
		print("Instance set to position:", instance.position)
	else:
		var instance = chocko_creme.instantiate()
		get_parent().add_child(instance)
		instance.position = $spawnpoint.position# - get_parent().global_position
		print("creme spawned")
#func _on_area_entered(_area: Area2D):
	#print("Area entered!")
	#choco_cream()
