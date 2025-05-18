extends Node2D

func _on_button_pressed():
	free_all_nodes_in_group1('in_use')
	free_all_nodes_in_group2('product')

func free_all_nodes_in_group1(group_name = 'in_use'):
	for node in get_tree().get_nodes_in_group(group_name):
		if is_instance_valid(node):
			print('dead')
			node.queue_free()
			Globals.shugar_dead = true
			Globals.cocoa_dead = true
			Globals.milk_dead = true
			Globals.dough_dead = true
			Globals.butter_dead = true
			#Globals.shugar_dead = true
			
func free_all_nodes_in_group2(group_name = 'product'):
	for node in get_tree().get_nodes_in_group(group_name):
		if is_instance_valid(node):
			print('dead')
			node.queue_free()
