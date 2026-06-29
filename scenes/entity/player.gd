extends CharacterBody2D

@export var jump_height:= -300
@export var gravity:=1000
@export var speed:=150
@export var direction_x: float 

signal shoot(pos:Vector2, dir:Vector2)

const gun_directions = {
	Vector2i(1,0): 0,
	Vector2i(1,1): 1,
	Vector2i(0,1): 2,
	Vector2i(-1,1): 3,
	Vector2i(-1,0): 4,
 	Vector2i(-1,-1): 5,
	Vector2i(0,-1): 6,
	Vector2i(1,-1): 7,
}

func get_input():
	direction_x= Input.get_axis("left","right")
	if Input.is_action_just_pressed("jump"):
		velocity.y =jump_height

func Apply_gravity(delta):
	velocity.y +=gravity * delta

func Shooting():
	if Input.is_action_just_pressed("shoot") and $relodetime.time_left==0 :
		shoot.emit(position,get_local_mouse_position().normalized())
		$relodetime.start()
		
		var tween= get_tree().create_tween()
		tween.tween_property($crosshair, "scale",Vector2(0.1,0.1),0.2)
		tween.tween_property($crosshair, "scale",Vector2(0.3,0.3),0.3)
		
	


func _physics_process(delta: float) -> void:
	Shooting()
	get_input()
	velocity.x= direction_x * speed
	Apply_gravity(delta)
	animation()
	update_marker()
	move_and_slide()

func update_marker():
	var marker_offset= 60
	$crosshair.position=get_local_mouse_position().normalized() *  marker_offset

func animation(): 	 	
	
	$legs.flip_h =direction_x<0
	$AnimationPlayer.current_animation= 'run' if direction_x else 'idle'
	if is_on_floor() ==false:
		$AnimationPlayer.play("jump")
	var raw_dir = get_local_mouse_position().normalized()
	var adjusted_dir = Vector2i(round(raw_dir.x),round(raw_dir.y))
	$torso.frame =gun_directions[adjusted_dir]
