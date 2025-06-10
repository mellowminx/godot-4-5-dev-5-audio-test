extends TextureButton

@export_enum("bubble","click1","click2","dig","pluck","pop") var audio_type = "bubble"

var audio = [
	preload("res://audio_bubble.ogg"),
	preload("res://audio_click_1.ogg"),
	preload("res://audio_click_2.ogg"),
	preload("res://audio_dig.ogg"),
	preload("res://audio_pluck.ogg"),
	preload("res://audio_pop.ogg"),
]

var selected_audio = audio[0]

func _ready() -> void:
	
	match audio_type:
		"bubble":
			selected_audio = audio[0]
			modulate = Color("6ac1dc")
		"click1":
			selected_audio = audio[1]
			modulate = Color("96acde")
		"click2":
			selected_audio = audio[2]
			modulate = Color("ada3dc")
		"dig":
			selected_audio = audio[3]
			modulate = Color("bda2db")
		"pluck":
			selected_audio = audio[4]
			modulate = Color("c9a2db")
		"pop":
			selected_audio = audio[5]
			modulate = Color("dba2ba")
	
	$audio.stream = selected_audio
	
	var tween = get_tree().create_tween().set_loops()
	var wait_time = randf_range(2,4)
	tween.tween_interval(wait_time)
	tween.tween_callback(press_button)

func _on_toggled(toggled_on: bool) -> void:
	$audio.play()

func press_button():
	if button_pressed:
		toggled.emit(false)
		button_pressed = false
	else:
		toggled.emit(true)
		button_pressed = true
