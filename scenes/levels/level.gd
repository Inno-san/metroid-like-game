extends Node2D
var bullet_secen = preload("res://scenes/entity/bullet.tscn")

func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:
	var bullet = bullet_secen.instantiate() as Area2D
	$bullets.add_child(bullet)
	bullet.setup(pos, dir)
