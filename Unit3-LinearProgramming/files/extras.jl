using Revealables

#############
# Lesson 01 #
#############

slope301 = Revealable("""
###Finding the Slope
To find the slope, the easiest way is to set f = 0 and solve for x<sub>2</sub> / x<sub>1</sub>. 

Maybe you'd rather just plug in the corner points. But sometimes you have an objective function that is a curve and not a line. In that case, the optimal value of the objective function will occur on a boundary line but not necessarily at a corner point. To solve, you would graph the curve of the objective function and drag it in the direction of increasing `f` (kind of like making a contour map) and find the last place the objective function contacts the feasible region. That will be the location of the maximum.
""", "Why find the slope?", false)

#############
# Lesson 02 #
#############

dims302 = Revealable("""
The first two are \"square,\" the first 2x2 and the second 3x3. The third matrix is 3x2, the fourth one a \"row\" matrix at 1x3, and the fifth one a \"column\" matrix at 3x1.
""", "What are the dimensions of the matrices above?", false)

#############
# Lesson 03 #
#############

rre303 = Revealable("""
It's clear why this is the idea form when you translate the matrix back into a system of equations:

    x1 = a
    x2 = b

That's the solution to the system!
""", "Why is this the ideal form?", false)