extends Control


@export var slides: Array[PackedScene]
var current_slide = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		current_slide += 1
		load_slide(current_slide)
	if Input.is_action_just_pressed("ui_left"):
		current_slide -= 1
		load_slide(current_slide)


func load_slide(index):
	current_slide = index%slides.size()
	#prints(index, current_slide)
	var disowned_kids = get_children()
	for kid in disowned_kids:
		kid.queue_free()
	var new_slide = slides[current_slide].instantiate()
	add_child(new_slide)
