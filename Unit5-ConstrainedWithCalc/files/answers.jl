using Revealables

#############
# Lesson 01 #
#############

ans501A = Revealable("""
###Answer A
1. The feasible region has 5 corner points. On the left side it is bounded mainly by the parabola, though there is a crossing point with the 1/x near the top of the region. The upper left corner is the intersection of 1/x with 10-x; the entire upper bound is the line, and the right boundary is the parabola. The lower boundary is 1/x which crosses the parabola twice, close to x = 3. 
2. The maximum value will likely occur at the right corner (between the parabola and line).<br /><br />
The minimum value will probably occur at the corner closest to the origin, the middle of three crossing points of the parabola with 1/x.<br /><br />
Hopefully two lessons will be learned here: first, this is harder than it seems at first glance, and second, we're really just guessing.
""", "Answer", false)

ans501B = Revealable("""
###Answer B
Minimization occurs at g (0, 2) with a minimum of -6

Maximization occurs at c (4.726, 1.181) with a maximum of 41.12
""", "Answer", false)

ans501C = Revealable("""
###Answer C
1. -x<sub>2</sub> + e<sup>-x<sub>1</sub></sup> + 2 &le; 0
2. x<sub>1</sub><sup>2</sup> + x<sub>2</sub><sup>2</sup> - 24 &le; 0 
3. x<sub>1</sub><sup>2</sup> - 4x<sub>1</sub> + x<sub>2</sub> - 2 &le; 0
4. -x<sub>1</sub> &le; 0
5. -x<sub>2</sub> &le; 0

If you graph these all together, it's a four-sided region (the axes do not come into play) bounded left and right by the parabola, top by the circle and bottom by the exponential.
""", "Answer", false)

ans501D = Revealable("""
###Answer D
f(x) = 3x<sub>1</sub><sup>2</sup> - 2x<sub>1</sub>x<sub>2</sub>

g<sub>1</sub>(x) = x<sub>1</sub><sup>2</sup> + 5 - x<sub>2</sub> &le; 0

g<sub>2</sub>(x) = 12 - x<sub>1</sub><sup>2</sup> - x<sub>2</sub><sup>2</sup> &le; 0

g<sub>3</sub>(x) = -x<sub>1</sub> &le; 0

g<sub>4</sub>(x) = -x<sub>2</sub> &le; 0

h(x) = x<sub>2</sub><sup>2</sup> + 4x<sub>1</sub><sup>2</sup> - 18 = 0
""", "Answer", false)

ans501E = Revealable("""
###Answer E
(-1.977, -0.303) and (1.95369, 0.428)

(0.159, 0.608), (3.145, 2.689), and (-0.552, -2.513)
""", "Answer", false)

#############
# Lesson 02 #
#############

ans502A = Revealable("""
###Answer A

""", "Answer", false)

#############
# Lesson 03 #
#############

ans503A = Revealable("""
###Answer A
Answers will vary; examples are (-3, 0), (1, -9) and (-1, -9). The easiest thing, in this equation, is to set x<sub>2</sub> equal to whatever and solve for x<sub>1</sub>. You could also set x<sub>1</sub> equal to whatever, but then you'd have to square root, no big deal though.
""", "Answer", false)

ans503B = Revealable("""
###Answer B
1. Steepest descent vector &lt;-5, 6&gt;, constraint gradient [-12, 4], dot product is POSITIVE: steepest descent is not feasible.
2. Steepest descent vector &lt;-2, 20&gt;, constraint gradient [8, -1], dot product is NEGATIVE: steepest descent is feasible.
3. Steepest descent vector &lt;-18, 12sqrt(6)&gt;, constraint gradient [4, -2sqrt(6)], dot product is NEGATIVE: steepest descent is feasible.
""", "Answer", false)

ans503C = Revealable("""
###Answer C
1. This is the same scenario as practice problem B3. f(a) = (2-18a)\\\*(-sqrt(6) + 12sqrt(6)\\\*a)<sup>2</sup>
2. Steepest descent vector &lt;-8, -2&gt; is feasible (constraint gradient [0 8]). f(a) = (4 - 8a)<sup>2</sup> + 2(.5-2a)<sup>2</sup>
""", "Answer", false)

ans503D = Revealable("""
###Answer D
1. constraint g(a) = (-sqrt(6) + 12sqrt(6)\\\*a) - ln(2 - 18a + 3) = 0 at a = 0.11905
2. constraint g(a) = (.5 - 2a)^2 - (4 - 8a) +1 = 0 at a = 0.368034
3. a has a minimum value of 0.
""", "Answer", false)

ans503E = Revealable("""
###Answer E
1. New point is (.5, 0) &mdash; in the interior.
2. New point is (1.0557, -0.2361).
""", "Answer", false)

ans503F = Revealable("""
###Answer F
1. Gradient = 0, but the eigenvalues of the Hessian (0 and 0.5 &mdash; you might need some sreview here, I did!) are not both positive. The fact that one is 0 means that this is an indeterminate point. What happened is the objective function is similar to the 2D equation xy = 1, or y = 1/x, which is not differentiable at x = 0. The same problem occurs here.
<br /><br />
2. Gradient of f = [2x<sub>1</sub>  4x<sub>2</sub>], at the new point = [2.111, -0.944], steepest descent = &lt;-2.111, 0.944&gt;.<br /><br />
Constraint gradient  = [-1  2x<sub>2</sub>], at the new point = [-1, -0.472].<br /><br />
The dot product of the steepest descent vector and the constraint gradient is positive; therefore it is not feasible to continue moving in the direction of steepest descent.
""", "Answer", false)
