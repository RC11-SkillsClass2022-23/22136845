extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = 'res://SOMStall2/'
	var image_paths = list_files_in_directory(dir)
	
	for ip in range(len(image_paths)):
		var imPath = dir + image_paths[ip]
		var image = preload("res://image.tscn").instantiate()
		add_child(image)
		image.initialise(imPath)
		
		var dim = max(image.width, image.height)
		var sf = 250.0/dim
		image.apply_scale(Vector2(sf, sf))
		
		var x = (ip%5) * 300 + 300
		var y = int(ip/5) * 300 + 300
		
		image.transform.origin = Vector2(x,y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func list_files_in_directory(path):
	var files = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".jpg"):
				files.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
		return files
		
