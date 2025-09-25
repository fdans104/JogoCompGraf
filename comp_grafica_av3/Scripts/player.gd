extends CharacterBody2D

const SPEED = 300.0
var ultima = ""
var pmg = 100
var hunger = 0
var health = 5

@onready var timerHunger = $TimerHunger
@onready var label_pmg = $Camera2D/HUD/Panel/PMG
@onready var label_fome = $Camera2D/HUD/Panel/Fome
@onready var label_saude = $"Camera2D/HUD/Panel/Saúde"

func _ready() -> void:
	ultima = "down"
	

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		velocity.y = -1
		ultima = "up"
	elif Input.is_action_pressed("down"):
		velocity.y = 1
		ultima = "down"
	
	if Input.is_action_pressed("left"):
		velocity.x = -1
		ultima = "left"
	elif Input.is_action_pressed("right"):
		velocity.x = 1
		ultima = "right"
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * SPEED
		move_and_slide()
		position += velocity * delta
	else:
		move_and_slide()
	
	# ----- ANIMAÇÕES -----
	if velocity != Vector2.ZERO:
		match ultima:
			"up":
				$AnimatedSprite2D.play("walk_up")
			"down":
				$AnimatedSprite2D.play("walk_down")
			"left":
				$AnimatedSprite2D.play("walk_left")
			"right":
				$AnimatedSprite2D.play("walk_right")
	else:
		match ultima:
			"up":
				$AnimatedSprite2D.play("idle")
			"down":
				$AnimatedSprite2D.play("idle2")
			"left":
				$AnimatedSprite2D.play("idle3")
			"right":
				$AnimatedSprite2D.play("idle4")


func _on_timer_hunger_timeout() -> void:
	hunger += 1
	if hunger > 5:
		loseHealth(1)
		hunger = 5
	label_fome.text = "Fome: " + str(hunger)
	timerHunger.start(3)

func loseHealth(points) -> void:
	health -= points
	label_saude.text = "Saúde: " + str(health)
	if health <= 0:
		print("Game Over!")
