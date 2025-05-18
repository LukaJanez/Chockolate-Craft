extends Node2D
var draggable = false
var is_inside_drop_area = false
var body_ref: StaticBody2D 
var offset: Vector2
var initial_pos: Vector2
var mouse_inside = false
var dead = false
var planted = false


func _process(_delta):
	if dead:
		self.queue_free()
	if draggable:
		if Input.is_action_just_pressed("click") and mouse_inside:
			initial_pos = global_position
			offset = get_global_mouse_position() - global_position
			Globals.is_dragging = true  # Replace with actual autoloaded global script
		if Input.is_action_pressed("click") and mouse_inside:
			global_position = get_global_mouse_position() - offset
			Globals.is_dragging = true  # Replace with actual autoloaded global script
		elif Input.is_action_just_released("click"):
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_drop_area:
				planted = true
				tween.tween_property(self, "global_position", body_ref.global_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		if draggable:
			pass
		else:
			Globals.is_dragging = false
	if planted:
		Globals.hotchock_sold = true
		draggable = false
		visible = false
		print('sold')
		
		planted = false
		dead = true
		#if not Globals.hotchock_sold:
		#	print('dead')
		#	self.queue_free()
		
func _on_area_2d_mouse_entered():

	if not Globals.is_dragging:
		draggable = true
		$Sprite2D.scale = Vector2(0.066, 0.065)
		mouse_inside = true
		print('in')

func _on_area_2d_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		$Sprite2D.scale = Vector2(0.056, 0.055)
		mouse_inside = false
		print ('out')

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside_drop_area = true
		body_ref = body
	
func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside_drop_area = false
	
