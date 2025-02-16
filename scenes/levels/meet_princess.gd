extends Area2D

func _on_body_entered(body: Node2D) -> void:
	%SecretBackground2.visible = false
	%Princess.visible = true
