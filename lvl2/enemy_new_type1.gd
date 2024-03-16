extends RigidBody2D

@export var start_x: int = 200
var player_chase = false
var player = null
var speed = 200
var chase_direction = Vector2(-1, 0)  
var previous_direction = Vector2(1, 0) 

var health = 100
var player_inattack_zone = false 
var can_take_damage = true

func _ready():
	pass

func _physics_process(delta):
	if player_chase and player != null:
		if player.position.x > position.x:
			chase_direction = Vector2(1, 0)
		else:
			chase_direction = Vector2(-1, 0)
	  
		if player == null:
			position += previous_direction * speed * delta
		else:
			position += chase_direction * speed * delta





func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_chase = true
		#player_inattack_zone = true


func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player = null
		player_chase = false
		previous_direction = chase_direction
		#player_inattack_zone = false

	
