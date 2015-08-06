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

#############
# Lesson 04 #
#############

ans504A = Revealable("""
###Answer A
1. (0.2425, -0.9701)
2. (-3/5, -4/5)
3. (0.208, -0.978)
4. (0.841, 0.541)
5. (-0.894, -0.448)

<code>
function normalize(v) 
    mag = sqrt((v[1])^2 + (v[2])^2) 
    v = v/mag 
    return(v) 
end
</code>
""", "Answer", false)

phase2 = [
Revealable("""<img src=\"files/5-4/p21.png\" width=150 />""", "", true), 
Revealable("""<img src=\"files/5-4/p22.png\" width=150 />""", "", true),
Revealable("""<img src=\"files/5-4/p23.png\" width=150 />""", "", true),
Revealable("""<img src=\"files/5-4/p24.png\" width=150 />""", "", true)
]

ans504B = Revealable("""
###Answer B
1. gradient [-1 2x<sub>2</sub>], at this point [-1, -0.4722], so steepest descent is &lt;1, 0.4722&gt;. Normalized &lt;.904, 0.427&gt;, multiplied by 0.5 gives &lt;.4521, 0.2135&gt;, then added to the original point = (1.508, -0.023).<br />
2. gradient [4x<sub>2</sub>  4x<sub>1</sub>], at this point [-12  4], so steepest descent is &lt;12, -4&gt;. Normalized &lt;0.949, -0.316&gt;, multiplied &lt;0.0949, -0.0316&gt;. Added to initial point gives (1.0949, -3.0316).
""", "Answer", false)

ans504C = Revealable("""
###Answer C
You might have noticed that your minimum f value pretty much always occurs at the maximum a value (on the constraint), which makes a lot of sense graphically: chances are very small now that the minimum f value will occur in the interior of the feasible region since we already passed through the interior in phase 1 and landed on a constraint. You can shortcut the \"minimizing f\" step as long as you are aware that it is a shortcut which, though rarely, risks returning a wrong answer in the event that there is an interior minimum quite close to the constraint boundary.

1. Objective function gradient [2x<sub>1</sub>  4x<sub>2</sub>], at this point = [3.016  -0.092], so steepest descent vector = &lt;-3.016, 0.92&gt;<br />
new point = (1.508 - 3.016a, -0.023 + 0.92a), max value of a = 0.16308, f minimized when a = 0.16308, new point = (1.016, 0.127)<br />
2. Objective function gradient [5  2x<sub>2</sub>], at this point [5  -6.0632], so steepest descent vector = &lt;-5, 6.0632&gt;<br />
  new point = (1.0949 - 5a, -3.0316 + 6.0632a), max value of a = 0.1496, f minimized when a = 0.1496, new point = 1.02, -2.941)<br />
3. Both points are quite close to the originals, but not identical.
""", "Answer", false)

ans504D = Revealable("""
###Answer D
Gradient [2x<sub>1</sub>  2x<sub>2</sub>], here [4.2  4] steepest descent &lt;-4.2, -4&gt;, new point = (2.1 - 4.2a, 2 - 4a)

g<sub>1</sub>(new) = 0 when a = 0.13253<br />
g<sub>2</sub>(new) = 0 when a = 0.10333

The second constraint will become active with max a = 0.10333.
""", "Answer", false)


pushingoff = [
Revealable("""<img src=\"files/5-4/corner1.png\" width=125 align=\"left\" style=\"padding:0 1em 0 0\" />We can do this by pretending the point lies on both constraints, finding both steepest descent vectors, and normalizing both vectors.""", "", true),
Revealable("""<img src=\"files/5-4/corner2.png\" width=125 align=\"left\" style=\"padding:0 1em 0 0\" />Then we can add the two vectors together...""", "", true),
Revealable("""<img src=\"files/5-4/corner3.png\" width=125 align=\"left\" style=\"padding:0 1em 0 0\" />...and if we normalize that vector we will have the vector we want.""", "", true)
]

ans504E = Revealable("""
###Answer E
1. g<sub>1</sub>: &lt;-0.5545, 0.832&gt;, g<sub>2</sub>: &lt;0.7399, -0.673&gt;
2. &lt;0.759, 0.651&gt;
3. new point = (1.666, 1.5867) + 0.1\\\*&lt;0.759, 0.651&gt; = (1.7419, 1.6518)
""", "Answer", false)

#############
# Lesson 05 #
#############

ans505A = Revealable("""
###Answer A
'Helpful to graph the feasible region' is more on the order of necessary. I'm using fooplot and graphing the points as I go along to check my work. Julia has lots of graphing packages if you want to do it all in the notebook.<br /><br />
Answers will vary depending on how much you push off in phase 2 and how many iterations you run.<br /><br />
From (1, 3): steepest descent = &lt;4, -6&gt; is feasible (dot product with constraint gradient = -32)<br />
new point = (1 + 4a, 3 - 6a), will impact g<sub>3</sub> at maximum a value of a = 0.3804<br />
minimizing f results in a = 0.3804. **Make sure you minimize `f(a)` in phase 1!**<br />
new point = (2.5214, 0.7177) on g<sub>3</sub>.<br /><br />
From here, I used a couple of programs shown below (absent much documentation &mdash; sorry), in loops like `point = move(point)`, `point = edge(g, point)` to bump out and then move back to the edge. I didn't minimize `f` each time (shortcut! Oh no!). <br /><br />
Progression of points:
        edge                interior
        (1, 3)              n/a (phase 1)
        (2.5215, .7177)     (2.47696, 0.807233)
        (2.53167, .722799)  (2.48687, 0.812206)
        (2.54054, .727259)  (2.49553, 0.816555)
        (2.54828, 0.73117)  etc...
<br /><br />
From here I put it into a for loop (`for n in 1:\_\_\_ / point = move(point) / point = edge(point) / println(point) / end`<br /><br />
and watched it go until I got an answer:
(2.601, 0.758)<br /><br />
<code>
using Calculus

gradg = gradient(x->g(x[1], x[2]))
gradf = gradient(x->f(x[1], x[2]))

function normalize(v)
    mag = sqrt((v[1])^2 + (v[2])^2)
    v = v/mag
    return(v)
end

function move(point)
    point = point + 0.1 \\\* normalize(-gradg(point))
    return(point)
end

function Newton(f::Function, x0, iter) # f::Function` makes Julia throw an error if you try to pass in anything else, like an integer; x0 is the seed point, if multiple zeroes Newton will find the closest to x0; iter is up to you but Newton works nicely around 6-7.
    n = 0
    while n < iter
        y0 = f(x0)  # y value for the seed point
        m0 = derivative(f)(x0)
        x1 = x0 - y0/m0  # find the x-value where the tangent line crosses the x-axis
        x0 = x1  # ...and make that the seed point for the next iteration
        n = n + 1
    end
    return(x0)
end

function edge(g, point)
    v = -gradf(point)
    finda(a) = g(point[1] + v[1]\\\*a, point[2] + v[2]\\\*a)
    a = Newton(finda, 0, 5)
    point = [point[1] + v[1]\\\*a, point[2] + v[2]\\\*a]
    return(point)
end
</code>
""", "Answer", false)

ans505B = Revealable("""
###Answer B
This one is more involved because it will near a corner.<br /><br />
From (1,3) steepest descent is &lt;-2, -1&gt;, which is feasible with dot product -8. This will head towards g<sub>1</sub>. 
However, although the limiting `a` is 0.75, the minimizing `a` is 0.625, which gives an interior point at (-0.25, 2.375).<br /><br />
From (-0.25, 2.375) steepest descent is &lt;0.5, -1&gt; which heads towards g<sub>3</sub>. This time the limiting `a` = 2.153304 ends up being the minimizing `a`, forming a new point at (0.826652, 0.2217).<br /><br />
Points, in order:<br /><br />

        edge                interior
        (1,3)               (-.25, 2.375) minimized f in interior here, phase 1 repeat
        (.826652, 0.2217)   (.811464, .320535)
        (.598406, 0.189255) (.585399, .288406)
        (.447277, .170433)  (.338229, .158025)
        ...

<br /><br />
(-.029729, 0.12245) At this point it gets really near the corner of g<sub>3</sub> and g<sub>1</sub>, so I found the next interior point which is still within the feasible region: (-.0381862, .222092) and checked that against both constraints. Indeed, the max `a` value goes with constraint g<sub>1</sub>, with an edge point of (-.0307, .1236). After some checking against the graph I greatly reduced my push-off value and got to a new point (back on g<sub>3</sub>):<br /><br />
(-.03013, .1224). At this point there isn't much improvement over the previous point, so this is close to the answer.
""", "Answer", false)

#############
# Lesson 06 #
#############

ans506A = Revealable("""
###Answer A
1. P(x) = max(0, x - 12)<sup>2</sup>
2. P(x) = max(0, x<sup>2</sup> - 200)<sup>2</sup>
3. P(x) = max(0, 2x - 9)<sup>2</sup>
4. P(x) = max(0, 9 - e<sup>2x+1</sup>)<sup>2</sup>
5. P(x) = (4x<sup>2</sup> + 2<sup>x</sup> - 12)<sup>2</sup>
""", "Answer", false)

ans506B = Revealable("""
###Answer B
Here's mine:

<code>
using Calculus
function stepmin(f, x)
    int = 0.1
    if f'(x) > 0
        int = -.1
    end
    while f(x + int) < f(x)  # stops when function increases
        x = x + int
    end
    int = int/10000  # adjusts the interval smaller but in same direction
    while f(x + int) < f(x)
        x = x + int
    end
    x  # instead of `return(x)`; does the same thing in Julia
end
</code>
""", "Answer", false)

ans506C = Revealable("""
###Answer C
Answers should converge on x = 5.
""", "Answer", false)

ans506D = Revealable("""
###Answer D
Becomes 

Minimize T(x) = 0.8x<sup>2</sup> - 2<sup>x</sup> + max(0, x-4)<sup>2</sup>

Should be at the boundary, 4; any starting point above 6.5 or so will send it way up for r = 10.

I wrote a function:

<code>
function extpen(f, P, a)  # f: objective function, P: penalty function, a: initial value
    r = 10
    for n in 1:10
       T(x) = f(x) + r\\\*P(x)
       a = stepmin(T, a)  # change this to T, a, \_\_ for a GE constraint
       println(a)
       r = 10\\\*r
    end
end
</code>
""", "Answer", false)

ans506E = Revealable("""
###Answer E
Becomes

Minimize T(x) = (x-8)<sup>2</sup> + r\\\*max(0, 10-x)<sup>2</sup>

Should give 10.
""", "Answer", false)

#############
# Lesson 07 #
#############

ans507A = Revealable("""
###Answer A
Answers should approach 5. However, there is a good chance (depending how you wrote their program) that Julia will hang. This will happen if your initial step size is significantly larger than the current value of 1/r, which will send your program over the asymptote and then downwards forever and ever.

I had to modify my program so that the initial step size became a user input instead of standard at 0.1. Then I decreased the step size with increasing values of r. 
""", "Answer", false)

ans507B = Revealable("""
###Answer B
Becomes T(x) = (x - 12)<sup>2</sup> - 1/r(x-10)

Answers should approach 10.
<code>
function intpen(f, B, a)
    r = 1
    for n in 1:10
        T(x) = f(x) + (1/r)\\\*B(x)
        a = stepmin(T, a, 1/(10\\\*r))
        r = 10 \\\* r
        println(a)
    end
    return(a)
end
</code>
""", "Answer", false)

ans507C = Revealable("""
###Answer C
Becomes
minimize T(x) = 0.8x<sup>2</sup> - 2<sup>x</sup> - 1/r(x - 4)

You should get 0.707, which is a local minimum but not the global minimum (which occurs at the boundary, 4).

For initial point 2 you should get 3, then for initial point 3, you will get the correct answer of x = 4. 
In 1. the penalty is too large, which causes the minimum at 4 to be caught up in the asymptote and dragged upward to the point where it is no longer even a local minimum. In 2. the smaller penalty corrects the graph, which now shows 4 as the lowest solution in the feasible region, but the initial point 2 is too far away, sinking us into the local minimum at 0.707. The initial point 3 is close enough to find the true minimum.
""", "Answer", false)

ans507D = Revealable("""
###Answer D
Candidates are:
* (-7, -50.15)
* (11, 0.103)
* (-1.8504, -12.92)
* (4.931, -23.97)
* (10.007, -6.523)

Global minimum is at (-7, -50.15)
""", "Answer", false)

#############
# Lesson 08 #
#############

ans508A = Revealable("""
###Answer A
There's some gray area here if you want to argue. The main thing is to argue rationally. 
1. O
2. C
3. C
4. O
5. O
6. C
""", "Answer", false)

ans508B = Revealable("""
###Answer B
Note that this is a maximization problem, slightly different from the minimization example. The region is the standard quadrilateral at the origin, with corner points (0, 0) (0, 5.2), (6, 4) and (8, 0). The point (8, 0), which is 8 tours and no mailings, is optimal for the number of applications with 80 applications and 32 donors. The point (6, 4) is optimal for donors with 48 donors and 68 applicants. (0, 0) and (0, 5.2) aren't much good for anything. 
""", "Answer", false)

ans508C = Revealable("""
###Answer C
The criterion space looks like a trapezoid, with one corner way down at the origin, and the highlighted segment connecting (32, 80) with (48, 68) in the upper right. (Your f<sub>1</sub> and f<sub>2</sub> values may be switched, but the edge will still be upper right.)
""", "Answer", false)

ans508D = Revealable("""
###Answer D
The slope is -3/4, so the whole-number solutions are: (donors, cost)<br />
(32, 80) &mdash; the upper left corner point<br />
(36, 77)<br />
(40, 74)<br />
(44, 71)<br />
(48, 68)

Fractional solutions might drop -1.5/2, or -1/1.333, or some other equivalent to -3/4.
""", "Answer", false)

ans508E = Revealable("""
###Answer E
1. Yes: 40 donors, 74 applicants
2. No
3. No
4. No
5. Yes: 36 donors, 77 applicants
""", "Answer", false)

ans508F = Revealable("""
###Answer F
1. orange
2. purple
3. blue. Although red is on the Pareto curve, a small increase in f<sub>2</sub> gives big decrease in f<sub>1</sub>.
4. orange
5. blue
6. orange. Although red is on the Pareto curve, a small decrease in f<sub>1</sub> gives a big increase in f<sub>2</sub>.
""", "Answer", false)

#############
# Lesson 09 #
#############

ans509A = Revealable("""
###Answer A

""", "Answer", false)

