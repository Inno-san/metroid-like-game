extends Area2D

var bullet_diriction: Vector2
var offset= 20
var bullet_speed=20


#setup the bullet when being made in level
func setup(pos:Vector2,dir:Vector2):
	position= pos + dir * offset
	bullet_diriction = dir
	var tween =get_tree().create_tween()
	tween.tween_property($bulletshape,"scale",Vector2(1,1),0.2)


#make the bullet move
func _physics_process(delta: float) -> void:
	
	position += bullet_diriction * offset * delta * bullet_speed
