extends RigidBody2D

func interact():
	print("Hello")
	get_node("../Player").add_inv("Test")
	queue_free()
