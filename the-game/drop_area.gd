extends StaticBody2D


func _process(_delta):
	if Globals.is_dragging:
		visible = true
	else:
		visible = false

		
