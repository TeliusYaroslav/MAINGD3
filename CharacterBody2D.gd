extends CharacterBody2D

const SPEED = 20

@onready var actionable_finder: Area2D = $Direction/ActionableFinder
var velocityy = Vector2.ZERO
var animated_player 
func _ready():
	var player = $AnimatedSprite2D
	

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x -= SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.stop()		
	if Input.is_action_pressed("up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("down"):
		velocity.y += SPEED
	velocity = velocity.normalized() * SPEED
	move_and_collide(velocity)
	var isleft = velocity.x < 0
 	
func _unhandled_input(_event:InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
		





