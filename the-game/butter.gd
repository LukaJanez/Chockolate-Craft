extends Node2D
var draggable = false
var is_inside_oven = false
var body_ref: StaticBody2D
var offset: Vector2
var initial_pos: Vector2
var mouse_inside = false
@export var dead = false
var planted = false
var returning = false

func _process(_delta):
	if draggable:
		if Input.is_action_just_pressed("click") and mouse_inside:
			initial_pos = global_position
			offset = get_global_mouse_position() #- global_position
			Globals.is_dragging = true
			returning = false  # Replace with actual autoloaded global script
		if Input.is_action_pressed("click") and mouse_inside:
			global_position = get_global_mouse_position() #- offset
			Globals.is_dragging = true 
			returning = false # Replace with actual autoloaded global script
		elif Input.is_action_just_released("click"):
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_oven:
				planted = true
				tween.tween_property(self, "global_position", body_ref.global_position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
			else:
				returning = true
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		if draggable:
			pass
		else:
			Globals.is_dragging = false
	if planted and not returning:
		visible = false
		draggable = false
		Globals.is_dragging = false
		Globals.butter_oven = true  #change
		add_to_group("in_use")

func _on_area_2d_mouse_entered():
	if not Globals.is_dragging:
		draggable = true
		$Sprite2D.scale = Vector2(0.09, 0.1) #change
		mouse_inside = true
		print('in')

func _on_area_2d_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		$Sprite2D.scale = Vector2(0.08, 0.09) #change
		mouse_inside = false
		print ('out')

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("oven"):
		is_inside_oven = true    #change
		body_ref = body
	if planted:
		visible = false
		draggable = false
		Globals.is_dragging = false
		Globals.butter_oven = true  #change
		add_to_group("in_use")
	if body.is_in_group('freezer'):
		if planted:
			self.queue_free()
func _on_area_2d_body_exited(body: StaticBody2D):
	
	if body.is_in_group("oven"):
		Globals.butter_oven = false  
		is_inside_oven = false
		if planted:
			Globals.butter_dead = true#change this
			print('aaahhh')
		
