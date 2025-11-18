extends StaticBody2D
var id = 100
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var timer : Timer = $Timer



var playerInside = false
var turned_on = false
var food_is_ready = false
var timer_duration = 10



func _ready() -> void:
	animation.play("off")

func _process(_delta: float) -> void:
	if playerInside:
		#Está ligado
		if turned_on:
			# Ligado com comida pronta
			if food_is_ready:
				Global.adicionarMarmitaQuente()
				food_is_ready  = false
				turned_on = false
				animation.play("off")
			#Ligado com comida ainda esquentando
			else:
				return
		#Está desligado. Não faz nada -> A lógica de esquentar só vai na função areaEntered
		else:
			return
	#Jogador não tá na área
	else:
		return


func esquentar_comida():
	turned_on = true
	animation.play("on")
	Global.perderMarmitaFria()
	timer.start(10)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("player entrou na área do micro-ondas")
		playerInside = true
		if turned_on == false:
			if Global.marmita_gelada_count > 0:
				esquentar_comida()


func _on_timer_timeout() -> void:
	food_is_ready = true
	animation.play("ready")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerInside = false
