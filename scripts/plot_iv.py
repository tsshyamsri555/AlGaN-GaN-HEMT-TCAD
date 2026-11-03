import numpy as np
d = np.loadtxt("outputs/0/result.dat", comments='#')
v = d[:, 0]
i = np.max(np.abs(d[:, 1:]), axis=1) * 1e6
print("Max ID (uA/um):", np.max(i))
print("Ron (Ohm*um):", (v[1] - v[0]) / (i[1] - i[0]) * 1e6)
