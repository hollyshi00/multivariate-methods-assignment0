# Multivariate Methods Assignment 0
This repository contains my setup verification for R, GitHub,
and AI-assisted coding.
Author: Holly SHI
Date: [March 25, 2026]

## Reflection:
I used both ChatGPT and Claude as AI-assisted coding tools for this assignment. 
ChatGPT initially suggested increasing the correlation in the covariance matrix 
from 0.5 to 0.8 and adding contour lines to the plot. The initial code worked 
after including the required package, but I was not fully satisfied with the implementation. 
I then used Claude to cross-check and refine the solution, which resulted in 
using geom_density_2d() to overlay contour lines directly on the scatter plot. 
The final code ran successfully without errors. I verified the output by confirming 
that the distribution became more elongated along the diagonal, consistent with a 
stronger positive correlation, and that the contour lines accurately represented 
regions of equal density. I also compared the updated plot with the original 
version to ensure that the intended changes were correctly reflected.