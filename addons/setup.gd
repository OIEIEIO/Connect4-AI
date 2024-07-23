
extends EditorPlugin

func _enter_tree():
    add_custom_type("NeuralNetwork", "Node", preload("Scripts/Neural/Neural_Net.gd"), preload("NeuralNetwork.png"))
    add_custom_type("Minimax", "Node", preload("Scripts/Minimax/minimax.gd"), preload("NeuralNetwork.png"))
    add_custom_type("QLearning", "Node", preload("Scripts/QLearning/qlearning.gd"), preload("NeuralNetwork.png"))

func _exit_tree():
    remove_custom_type("NeuralNetwork")
    remove_custom_type("Minimax")
    remove_custom_type("QLearning")
