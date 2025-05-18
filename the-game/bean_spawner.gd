extends Node2D
var cocoa_beans = preload("res://cocoa_beans.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.cocoa_dead:
		var instance = cocoa_beans.instantiate()
		Globals.cocoa_dead = false
		print('spawned')
		get_parent().add_child(instance)
		instance.position = $".".position #- get_parent().position
