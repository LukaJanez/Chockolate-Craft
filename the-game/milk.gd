extends Node2D
var draggable = false
var is_inside = false
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
			returning = false  
		if Input.is_action_pressed("click") and mouse_inside:
			global_position = get_global_mouse_position() #- offset
			Globals.is_dragging = true 
			returning = false 
		elif Input.is_action_just_released("click"):
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
				planted = true
			else:
				returning = true
				tween.tween_property(self, "global_position", initial_pos, 0.2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
		if draggable:
			pass
		else:
			Globals.is_dragging = false
	if planted:
		if not returning:
			Globals.is_dragging = false
			visible = false
			draggable = false
			add_to_group('in_use')

func _on_area_2d_mouse_entered():
	if not Globals.is_dragging:
		draggable = true
		$Sprite2D.scale = Vector2(0.09, 0.1)
		mouse_inside = true
		print('in')

func _on_area_2d_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		$Sprite2D.scale = Vector2(0.08, 0.09)
		mouse_inside = false
		print ('out')

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside = true
		body_ref = body
		
	if body.is_in_group("machine"): #change this
			is_inside = true    
			body_ref = body
			Globals.is_dragging = false
			Globals.milk_blender = true   #change this
			print(Globals.milk_blender)   #change this
			
	if body.is_in_group("pot"):     #change this
		
		is_inside = true
		body_ref = body
		Globals.milk_pot = true   #change this
		print(Globals.milk_pot)   #change this
	if body.is_in_group('freezer'):
		if planted:
			self.queue_free()
	
func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group("drop_area"):
		is_inside = false
	if body.is_in_group("pot"):
		Globals.milk_pot = false
		is_inside = false
		 #change this
		print('aaahhh')
	if body.is_in_group("machine"):
		Globals.milk_blender = false  #change this
		is_inside = false
		print('aaahhh')
