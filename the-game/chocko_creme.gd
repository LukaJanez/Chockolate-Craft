extends Node2D
var draggable = false
var is_inside = false
var body_ref: StaticBody2D
var offset: Vector2
var initial_pos: Vector2
var mouse_inside = false
@export var dead = false
var planted = false
var freeze = false

func _process(_delta):
	if Globals.creme_dead:
		queue_free()
		Globals.creme_dead = false
	if draggable:
		if Input.is_action_just_pressed("click") and mouse_inside:
			initial_pos = global_position
			offset = get_global_mouse_position() - global_position
			Globals.is_dragging = true  # Replace with actual autoloaded global script
		if Input.is_action_pressed("click") and mouse_inside:
			global_position = get_global_mouse_position() - offset
			Globals.is_dragging = true  # Replace with actual autoloaded global script
		elif Input.is_action_just_released("click"):
			planted = true
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside:
				tween.tween_property(self, "global_position", body_ref.position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		if draggable:
			pass
		else:
			Globals.is_dragging = false
	if planted:
		draggable = false
		visible = false
		add_to_group("in_use")
		if freeze:
			Globals.creme_freezer = true
		

func _on_area_2d_mouse_entered():
	if not Globals.is_dragging:
		draggable = true
		$Sprite2D.scale = Vector2(0.066, 0.065)
		mouse_inside = true
		print('in')

func _on_area_2d_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		$Sprite2D.scale = Vector2(0.055, 0.056)
		mouse_inside = false
		print ('out')

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside = true
		body_ref = body
	if body.is_in_group("pot"):
		is_inside = true
		body_ref = body
		Globals.creme_pot = true
	if body.is_in_group("freezer"):
		is_inside = true
		body_ref = body
		freeze = true
	if body.is_in_group("oven"):
		is_inside = true
		body_ref = body
		Globals.creme_oven = true
func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside = false
	if body.is_in_group("freezer"):
		Globals.creme_freezer = false
		print('aaahhh')
	if body.is_in_group("oven"):
		Globals.creme_oven = false
		is_inside = false
	if body.is_in_group('pot'):
		Globals.creme_pot = false
		is_inside = false
