extends RigidBody2D
	
func interact():
	print("Bonjour")
	get_node("/root/TestLevel/DialogBox").start_dialogue("test")
	
