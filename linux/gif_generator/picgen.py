import matplotlib.pyplot as plt
import numpy as np


my_dpi=96

print(hex(int(2**24*np.random.rand()))[2::])

size=100
for i in range(100):
    r=np.random.rand(size, size)
    # plt.figure(figsize=(size/my_dpi, size/my_dpi), dpi=my_dpi)
    plt.imshow(r)
    plt.savefig(f"./pics/fig_{i:03d}.png")
    # plt.show()
