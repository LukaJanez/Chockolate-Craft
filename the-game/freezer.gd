extends StaticBody2D
var chockolate = preload("res://chockolate.tscn")

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	if Globals.creme_freezer:
		var instance = chockolate.instantiate()
		get_parent().add_child(instance)
		instance.position = $StaticBody2D/spawnpoint.global_position 
		print("Instance set to position:", instance.position)
		Globals.creme_dead = true
