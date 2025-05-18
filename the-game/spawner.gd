extends Node2D
var shugar = preload("res://shugar.tscn")
var beans = preload("res://cocoa_beans.tscn")
var milk = preload("res://milk.tscn")
var dough = preload("res://dough.tscn")
var butter = preload("res://butter.tscn")


func _on_main_ready() -> void:
	#beans
		var instance_beans = beans.instantiate()
		print('spawned')
		get_parent().add_child(instance_beans)
		instance_beans.position = $beans_spawn.position #- get_parent().position
	#shugar
		var instance_shugar = shugar.instantiate()
		Globals.shugar_dead = false
		print('spawned')
		get_parent().add_child(instance_shugar)
		instance_shugar.position = $shugar_spawn.position #- get_parent().po
	#milk
		var instance_milk = milk.instantiate()
		Globals.milk_dead = false
		print('spawned')
		get_parent().add_child(instance_milk)
		instance_milk.position = $milk_spawn.position #- get_parent().po
	#dough
		var instance_dough = dough.instantiate()
		Globals.dough_dead = false
		print('spawned')
		get_parent().add_child(instance_dough)
		instance_dough.position = $dough_spawn.position #- get_parent().po
	#butter
		var instance_butter = butter.instantiate()
		Globals.butter_dead = false
		print('spawned')
		get_parent().add_child(instance_butter)
		instance_butter.position = $butter_spawn.position #- get_parent().po

func _physics_process(_delta):
	if Globals.cocoa_dead:
		var instance = beans.instantiate()
		Globals.cocoa_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $beans_spawn.position #- get_parent().po
		
	if Globals.shugar_dead:
		var instance = shugar.instantiate()
		Globals.shugar_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $shugar_spawn.position #- get_parent().po
		
	if Globals.milk_dead:
		var instance = milk.instantiate()
		Globals.milk_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $milk_spawn.position #- get_parent().po
		
	if Globals.butter_dead:
		var instance = butter.instantiate()
		Globals.butter_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $butter_spawn.position #- get_parent().po
		
	if Globals.dough_dead:
		var instance = dough.instantiate()
		Globals.dough_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $dough_spawn.position #- get_parent().po
