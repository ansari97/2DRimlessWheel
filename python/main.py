"""
This file contains the main code for defining the dynamics of a 2D rimless wheel moving down a slope
"""

# Dependencies
import math

# Define paramaters
slope_angle = 2 #degrees
slope_angle = math.radians(slope_angle) #angle in radians
m = 2   #mass in kg
I = 1   #moment of inertia about center of mass/center of wheel in kgm^2