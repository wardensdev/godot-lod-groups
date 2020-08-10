extends Camera3D


func _process(delta):
	if Input.is_action_pressed("forward"):
		translation.z += .2
	if Input.is_action_pressed("backward"):
		translation.z -= .2
