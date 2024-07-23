
extends Node

# Activation functions for neural networks
func sigmoid(x):
    return 1 / (1 + exp(-x))

func sigmoid_derivative(x):
    return x * (1 - x)
