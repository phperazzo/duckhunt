extends Node2D

var patosnatela
var pato = preload("res://pato.tscn")
var flyaway = 0
var capturado = 0

func _ready():
	$gerapato.start()
	
func _process(delta):
	$Alvo.position.x = get_local_mouse_position().x
	$Alvo.position.y = get_local_mouse_position().y

func nasce():
	var novop = pato.instantiate()
	add_child(novop)
	novop.position.x = randf_range(50,700)
	novop.position.y = 700
	
	
func _on_gerapato_timeout() -> void:
	patosnatela = randi_range(1,6)
	for n in range(patosnatela):
		nasce()


func _on_espera_timeout() -> void:
	$gerapato.start()


func _on_topo_body_entered(body: Node2D) -> void:
	flyaway = 1
	patosnatela -=1


func _on_chao_body_entered(body: Node2D) -> void:
	capturado += 1
	patosnatela -=1
