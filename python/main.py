"""
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
"""

# Dependencies
import math
import scipy as sp
import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# # Define paramaters
# Slope
slope_angle = 2  # degrees
slope_angle = math.radians(slope_angle)  # angle in radians

# Wheel
l = 0.015   # leg length in m
m = 2  # mass in kg
I = 1  # moment of inertia about center of mass/center of wheel in kgm^2
n = 8 # spokes

J = I/(2*m*l**2)

lam = 1/(2*J+1)

# initial conditions
init_ang = 0.1
init_vel = 0.2
init_con = np.array([init_ang, init_vel])

# print(len(init_con))

def dydt(t, y):
    dydt = np.array([y[0], lam**2*np.sin(y[1])])
    return dydt

solution = solve_ivp(dydt, [0, 10], init_con, max_step = 0.10)

y_sol = solution.y

print(y_sol)

plt.plot(solution.t, solution.y[0])
plt.show()




