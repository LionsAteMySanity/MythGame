extends RigidBody2D
	
var t = Timer.new()


func interact():
	print("Bonjour")
	get_node("../DialogBox").start_dialogue("test")
	
	
	
