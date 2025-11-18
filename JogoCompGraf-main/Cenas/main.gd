extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var posicao_zero = $CC.position
	print(posicao_zero)
	for filho in get_children():
		if filho is StaticBody2D and filho.id != 1:
			print(filho.id)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("FUI LEIGO")
