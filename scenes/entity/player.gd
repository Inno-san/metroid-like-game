extends CharacterBody2D

@export var jump_height:= -300
@export var gravity:=1000
@export var speed:=150
@export var direction_x: float 

func get_input():
	direction_x= Input.get_axis("left","right")
	if Input.is_action_just_pressed("jump"):
		velocity.y =jump_height

func Apply_gravity(delta):
	velocity.y +=gravity * delta

func Shooting():
	if Input.is_action_just_pressed("shoot") and $relodetime.time_left==0 :
		print ("big booty latina")
		$relodetime.start()
	


func _physics_process(delta: float) -> void:
	Shooting()
	get_input()
	velocity.x= direction_x * speed
	Apply_gravity(delta)
	move_and_slide()
