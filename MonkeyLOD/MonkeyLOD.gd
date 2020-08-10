extends Node3D


var visiblemesh

var lod0_dist = 4
var lod1_dist = 6
var lod2_dist = 8


func _process(delta):
	
	# Calculate the vector between the Monkey and the Camera. Then take the absolute value of its length to get the distance.
	
	var cam_pos = get_parent().get_node("Camera3D").translation
	
	var between_vector = cam_pos - translation
	
	var distance = abs(between_vector.length())
	
	# Show/Hide MeshInstances based on the distance. `var visiblemesh` is just to make sure we only update the Label once, when the mesh changes.
	
	if distance < lod0_dist && distance >= 0:
		
		get_node("LOD0").visible = true
		get_node("LOD1").visible = false
		get_node("LOD2").visible = false
		get_node("LOD3").visible = false
		
		if visiblemesh != 0:
			visiblemesh = 0
			get_parent().get_node("Label").text = "Vertex Count(LOD0): " + str(get_node("LOD0").mesh.surface_get_array_len(0))
		
	elif distance < lod1_dist && distance >= lod0_dist:
		
		get_node("LOD0").visible = false
		get_node("LOD1").visible = true
		get_node("LOD2").visible = false
		get_node("LOD3").visible = false
		
		if visiblemesh != 1:
			visiblemesh = 1
			get_parent().get_node("Label").text = "Vertex Count(LOD1): " + str(get_node("LOD1").mesh.surface_get_array_len(0))

	elif distance < lod2_dist && distance >= lod1_dist:
		
		get_node("LOD0").visible = false
		get_node("LOD1").visible = false
		get_node("LOD2").visible = true
		get_node("LOD3").visible = false
		
		if visiblemesh != 2:
			visiblemesh = 2
			get_parent().get_node("Label").text = "Vertex Count(LOD2): " + str(get_node("LOD2").mesh.surface_get_array_len(0))
			
	elif distance >= lod2_dist:
		
		get_node("LOD0").visible = false
		get_node("LOD1").visible = false
		get_node("LOD2").visible = false
		get_node("LOD3").visible = true
		
		if visiblemesh != 3:
			visiblemesh = 3
			get_parent().get_node("Label").text = "Vertex Count(LOD3): " + str(get_node("LOD3").mesh.surface_get_array_len(0))
