extends Node2D
var one = preload('res://Milkshake.jpg')
var two = preload('res://hot_chock.jpg')
var three = preload('res://crosant.jpg')
var four = preload('res://chockolate.jpg')
var five = preload("res://brownie.webp")
var random_num : float
#var sprite = $sprite
#var sprite : Sprite2D = null

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void: 
	randomizer()
	solder()
func randomizer():
	if Globals.sold:
		print(Globals.coin_count, 'coins')
		randomize()
		random_num = randi() %5 +1
		print(random_num)
		Globals.sold = false
		
func solder():
		if random_num == 1 :
			$sprite.texture = one
			#$sprite.position = position
			$sprite.scale = Vector2(0.05, 0.05)
			if Globals.milkshake_sold:
				Globals.coin_count += 2
				Globals.milkshake_sold = false
				Globals.sold = true
				
				
		if random_num == 2:
			$sprite.texture = two
			#$sprite.position = position
			$sprite.scale = Vector2(0.05, 0.05)
			if Globals.hotchock_sold:
				Globals.coin_count += 2
				print('done')
				Globals.hotchock_sold = false
				Globals.sold = true
				
		if random_num == 3 :
			$sprite.texture = three
			#$sprite.position = position
			$sprite.scale = Vector2(0.5, 0.5)
			if Globals.crosant_sold:
				Globals.coin_count +=4
				print('done')
				Globals.crosant_sold = false
				Globals.sold = true
				
		if random_num == 4 :
			$sprite.texture = four
			#$sprite.position = position
			$sprite.scale = Vector2(0.15, 0.15)
			if Globals.chockolate_sold:
				Globals.coin_count += 3
				Globals.chockolate_sold = false
				Globals.sold = true
				
		if random_num == 5 :
			$sprite.texture = five
			#$sprite.position = position
			$sprite.scale = Vector2(0.05, 0.05)
			if Globals.brownie_sold:
				Globals.coin_count += 4
				Globals.brownie_sold = false
				Globals.sold = true
