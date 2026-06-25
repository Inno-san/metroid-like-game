extends Area2D

var bullet_diriction: Vector2
var offset= 20

func setup(pos:Vector2,dir:Vector2):
	position= pos + dir * offset
	bullet_diriction = dir
	
func _physics_process(delta: float) -> void:
	position += bullet_diriction * offset * delta
