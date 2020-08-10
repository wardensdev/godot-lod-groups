extends Camera3D


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		translation.z += .2
	if Input.is_action_pressed("ui_down"):
		translation.z -= .2
