import numpy as np
import matplotlib.pyplot as plt 

def draw(N):
	"""
	N draws
	At each draw, increase +1 the ball with respective
	color that's drawn.
	Statistical fixed point -> converges to stable distribution
	path dependence
	"""
	b = 1
	w = 1
	t = b + w
	ratios = []
	for _ in range(N):
		draw_ball = np.random.choice(["b", "w"], p = np.array([b/t, w/t]))
		if draw_ball == "b":
			b += 1
		else:
			w += 1
		t += 1
		ratios.append(b/t)
	return ratios

if __name__ == "__main__":
	N = 1000
	runs = 5
	for _ in range(runs):
		ratios = draw(N)
		plt.plot(range(N), ratios)
		plt.xlabel("Number of draws")
		plt.ylabel("b ratio")
	#plt.show()
	plt.savefig("polya_urn.png")