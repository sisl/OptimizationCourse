using Revealables

#############
# Lesson 01 #
#############

ans401A = Revealable("""
###Answer A
1. 31.75
2. 3
3. 22.5
4. 20.5
5. 20.05
6. 20.005
7. 20, of course!
""", "Answer", false)

ans401B = Revealable("""
###Answer B
1. 0.7201
2. 0.7215
3. 0.721673
4. 0.721686
5. 0.721688
6. Answers will vary depending on how many zeroes they type in (I didn't bother counting). Anyway it's not accurate. The moral of this story is that rounding error becomes really significant when you try to get too accurate. Mine converged just fine for a while as I added 0's, but then it started getting worse.
7. The actual derivative here is 5/(2*sqrt(5)), which is 0.7216878...
""", "Answer", false)

ans401C = Revealable("""
###Answer C
I chose to use the secant method. Either will work just fine.
<code>
function nderiv(f, n)  # function f, n is the x-value at which you want the slope
    h = 0.00000001  # arbitrary, but won't work if h is too small (or too large!)
    d = (f(n+h) - f(n-h)) / (2h)
    d = round(d, 5)  # arbitrary rounding to 5 digits to account for the error provided by h not being precisely zero. If you change h, change this.
      println(d)
end
</code>
""", "Answer", false)

#############
# Lesson 02 #
#############

proof402 = Revealable("""
###Proving the Shortcut
The proof, though complex, isn't really that bad if you use a couple of tricks. First, center the interval at 0 which will not change the value of the integral. Then, multiply the interval width by 2/(b-a), which will scale the endpoints to -1 and 1. We'll have to scale it back later by multiplying by (b-a)/2. So now, the three given points can be written (-1, L) (0, M) and (1, R). Building the quadratics and solving the system is fairly simple; you will get 1st coefficient = R &ndash; M &ndash; (R-L)/2, 2nd = (R-L)/2, 3rd = M.

Integrating from -1 to 1 is a little hairy with all the variables, but not that bad because things cancel; simplifying is fairly nice, and after multiplying by (b-a)/2 to unscale it to its original size, you will get the formula above. 
""", "Oh yeah? Prove it!", false)

ans402A = Revealable("""
###Answer A
1. 41.33 in both cases.
2. The three points will be (-1, 9), (2,30) and (5, 87). The integral of 2x<sup>2</sup> + 5x + 12 from -1 to 5 gives 216. Simpson's Rule yields 1 * (9 + 120 + 87) = 216.
3. Both answers are identical at -4.67.

""", "Answer", false)

ans402B = Revealable("""
###Answer B
1. Integral = 168; Simpson's = (-3, -9), (4, 12) and (11, 33) for 14 / 6 \\\* (-9 + 48 + 33) = 168.0. 
2. Integral = 37.333; Simpson's = (4, 2) (10, 3.1623) (16, 4) for 2 \\\* (2 + 12.6491 + 4) = 37.298. 
3. Integral = 1; Simpson's = (0, 1), (&pi;/4, .7071), (&pi;/2, 0) for &pi;/12 \\\* (1 + 2.8284 + 0) = 1.002
4. Integral = 145.6949; Simpson's = (1, 2.718) (3, 20.0855) (5, 148.4132) for 4 / 6 \\\* (2.718 + 80.3421 + 148.4132) = 154.3158.
""", "Answer", false)

ans402C = Revealable("""
###Answer C
Come up with your own definition of \"acceptable error.\" Sometimes the audience will dictate that, but sometimes it's just up to the designer (that's you!).

I found that interval width 4 (original) gave 154.315726...; width 2 gave 146.417113...; width 1 gave 145.7439987. I wasn't happy until around 0.05; 0.01 was extremely accurate. (At that point I wondered how accurate just doing a Riemann sum would be, but it was not as accurate.)

<code>
function simpson(f, a, b)
    m = (a + b) / 2 
    integral = (b - a) / 6 * (f(a) + 4*f(m) +f(b))  # calculate and return integral
end

b = 0
for k in (1:.01:4.99)
    b = b + simpson(f, k, k + .01)
end
println(b)
</code>
""", "Answer", false)

ans402D = Revealable("""
###Answer D
This is a bit tricky because you really do need a whole number of intervals, and they really should be evenly spaced (though this is actually not necessary), and the width could be anything. 

My solution is to divide `w` by 0.01 (which is my desired interval width), then round to the nearest whole number, then divide `w` again by that whole number to get the width of each interval. Rounding to a whole number can be accomplished using `round(k, 0)`.
""", "Answer", false)

ans402E = Revealable("""
###Answer E
<code>
function simpson(f, a, b)
    integral = 0  # seed initial value for sum later
    k = round((b-a)/.01, 0)  # determine how many intervals are required to get interval width of ~0.01
    step = (b-a)/k  # create the step value using width / number of intervals
    for n in a:step:(b-step)  # build sub-intervals with left endpt n and right endpt (n + step), width = step
        m = n + (step/2)  # midpoint 
        add = step / 6 * (f(n) + 4*f(m) + f(n+step))  # simpson's rule on subinterval
        integral = integral + add  # accumulate on integral here 
    end
    println(integral)
end

f(x) = e^x 
simpson(f, 1, 5)
</code>
""", "Answer", false)

#############
# Lesson 03 #
#############

ans403A = Revealable("""
###Answer A
My fractional answer was 67917414/24012432, which came out to:

        2.828427124749...

compared to

        2.828427124746...
""", "Answer", false)

ans403B = Revealable("""
###Answer B
This has no hope of being more accurate than Newton's Method by hand, because we're using numerical derivatives which are very limited in accuracy. But it will be a lot faster.

<code>
function Newt2(f, a)
    x = a
    h = 0.00000001  # arbitrary, but won't work if h is too small (or too large!)
    for n in 1:5
        d = (f(x+h) - f(x-h)) / (2h)  # using secant method for slope
        d = round(d, 5)  # arbitrary rounding to 5 digits to account for the error provided by h not being precisely zero. If you change h, change this.
        xnew = x - f(x)/d
        x = xnew 
        println(x)  # place here to show successive approximation, below to show only answer
    end
end

f(x) = x^2 - 8
Newt2(f, 3)
</code>
""", "Answer", false)

#############
# Lesson 04 #
#############

goodguy404 = Revealable("""
## Results of My Search
From the Google search it should be immediately obvious that John Myles White is on the side of the angels. Here are some examples of evidence, in increasing order of convincingness:
* Based on an image search only, he's white, or Asian, or something else. Not informative at all.
* He has a twitter account and facebook page. Uhm... not significant, though it looks like he might be a real person.
* He's published a book. Nice, but these days anyone can do that.
* He has his own website. Could be a plus, but not enough. His website is pretty much dedicated to Julia. That looks good.
* His GitHub page shows that he's a member of two Julia-related organizations and he contributes a lot of GitHub packages. That's promising. 
* He's done a bunch of interviews and presentations. Looks good.
""", "Who is John Myles White, anyway?", false)

ans404A = Revealable("""
###Answer A
For the derivative, Calculus using `f'` got:

        22.692712758264996

Calculus using `eval(differentiate(`

        22.692712758272776

My program

        22.692712420 with rounding off
        22.69271 with rounding on

Correct answer: the Calculus answer using `eval(differentiate(`



For the integral, Calculus got

        148.32762217938892

I got
        148.32762217983452

Correct answer:
        148.32762217938892... I lose!

You may be upset about the fact that you were made to write these programs when they were already written (and written better, at least in my case). I think the fact that someone already did write those programs is proof that it's a legitimate pursuit. It's important to know how it's done. People get paid to do this kind of work; someone had to write the program for graphing calculators after all. As soon as another language gets invented, someone will have to program derivatives for it, unless John Myles White gets there first, too.
""", "Answer", false)

sawtooth = [Revealable("""
<img src=\"files/4-4/st1.png\" width=100 align=\"left\" />
Step 1: Draw lines of slope m from the function at the midpoint and endpoints of the interval.
""", "Answer", true),

Revealable("""
<img src=\"files/4-4/st1.png\" width=100 align=\"left\" />
Step 2: Find the intersection points of the lines.
""", "Answer", true),

Revealable("""
<img src=\"files/4-4/st3.png\" width=100 align=\"left\" />
Step 3: Find the highest y-value among the intersection points.
""", "Answer", true),

Revealable("""
<img src=\"files/4-4/st4.png\" width=100 align=\"left\" />
Step 4: Draw lines of slope &plusmn;m from the function at the y-value corresponding to that x-value.
""", "Answer", true),

Revealable("""
<img src=\"files/4-4/st4.png\" width=100 align=\"left\" />
Step 5: Repeat steps 2 through 5 until you have a good enough answer.
""", "Answer", true)]


ans404B = Revealable("""
###Answer B
1. This derives to 15x<sup>2</sup> + 4x. The maximum will occur either at the endpoints or where the derivative of this equals zero (i.e., where the second derivative equals 0). The second derivative is 30x + 4, which equals 0 at -2/15. The slope (derivative) at each point is: (-2, 52); (-2/15, -2.67); (5, 395). Limiting slope is 395.

2. This derives to 12x^<sup>3</sup> - 4x, second derivative 36x<sup>2</sup> - 4. The second derivative is 0 at &plusmn;1/3, with slopes &plusmn;0.88. The endpoints have slopes of &plusmn;0.5, so the limiting slope is 0.88.
""", "Answer", false)

ans404C = Revealable("""
###Answer C
There ought to be a way to use symbolic differentiation too, but I could not figure out how to turn a variable storing a string into a string literal so I could pass it into the `differentiate` function in the Julia `Calculus` package.

If that sentence makes zero sense to you, don't worry. Here's a program that works using numerical differentiation:

<code>
using Calculus
function sawprep(f, a, b)
    check = {}  # list of points where second derivative switches value is currently empty
    int = (b-a)/20  # 20 is arbitrary, raise as needed. Divide interval into 20 test points
    test = [a b]
    test = float64(test)
    for n in a:int:(b-int)
        if sign(f''(n)) != sign(f''(n + int))
            push!(check, n)  # create list of left hand points where 2nd deriv changes value
        end
    end
    for n in 1:length(check)
        l = check[n]
        r = l + int
        while abs(r - l) > 0.001
             m = (f''(r) - f''(l))/(r-l)
             xint = l - f''(l)/m
             r = l
             l = xint
         end
         test = hcat(test, l)
     end
    println(\"x values for testing: \$test\")
    for n in 1:length(test)
        test[n] = abs(f'(test[n]))
    end
    println(maximum(test))
end
</code>
""", "Answer", false)

#############
# Lesson 05 #
#############

ans405A = Revealable("""
###Answer A
Decreasing from -&infin; to -1.366; increasing from -1.366 to 0.366; decreasing from 0.366 to 1; increasing from 1 to &infin;. Equals 0 at -1.366, 0.366 and 1.

I used my Newton program to find the zeroes, of course!
""", "Answer", false)

ans405B = Revealable("""
###Answer B
Depending on whether you used second derivatives = 0 to find where derivatives were maximized in the previous lesson, this might be super easy or super difficult.

<code>
using Calculus

function incdec(f, a, b)
    check = {}  # list of points where derivative switches value is currently empty
    int = (b-a)/100  # 100 is arbitrary, raise/lower as needed to divide the interval into test points
    for n in a:int:(b-int)
        if sign(f'(n)) != sign(f'(n + int))  # seeking points where the first derivative switches value
            push!(check, n)  # create list of left hand points where deriv changes value
        end
    end
    for n in 1:length(check)
        l = check[n]
        r = l + int
        while abs(r - l) > 0.00001  # use secants to zoom in on this interval's zero
             m = (f'(r) - f'(l))/(r-l)
             xint = l - f'(l)/m
             r = l
             l = xint
             check[n] = xint  # replace each number in check with the accurate value
         end
    end
    if length(check) == 0
        if f'(a) > 0
            println(\"f(x) is always increasing on this interval\")
        elseif f'(a) < 0
            println(\"f(x) is always decreasing on this interval\")
        end
    elseif length(check) == 1
        if f'(a) > 0
            println(\"f(x) increases until x = \$(check[1]), then decreases after\")
        elseif f'(a) < 0
            println(\"f(x) decreases until x = \$(check[1]), then increases after\")
        end
    else
        if f'(a) > 0
            println(\"f(x) increases until \$(check[1])\")
        else
            println(\"f(x) decreases until \$(check[1])\")
        end
        for n = 1:(length(check)-1)
            if f'((check[n] + check[n+1])/2) > 0
                println(\"f(x) increases between \$(check[n]) and \$(check[n+1])\")
            else
                println(\"f(x) decreases between \$(check[n]) and \$(check[n+1])\")
            end
        end
        if f'(b) > 0
            println(\"f(x) increases after \$(check[end])\")
        else
            println(\"f(x) decreases after \$(check[end])\")
        end
    end
end
</code>
""", "Answer", false)

ans405C = Revealable("""
###Answer C
This should be as simple as changing all instances of `f'(x)` from problem 2 into `f''(x)`, and all instances of \"increasing/decreasing\" to \"concave up/concave down.\" However, it may turn into a nice object lesson in what is often referred to in programming as the \"copy/paste\" bug, in which one instance is missed and the whole program fails because of it!

I'm sure there is a more elegant way to handle all those `println` statements.

<code>
using Calculus

function concavity(f, a, b)
    check = {}  # list of points where derivative switches value is currently empty
    int = (b-a)/100  # 100 is arbitrary, raise/lower as needed. Divides the interval into 100 test points
    for n in a:int:(b-int)
        if sign(f''(n)) != sign(f''(n + int))  # seek points where the first deriv switches value
            push!(check, n) #create list of left hand points where deriv changes value
        end
    end
    for n in 1:length(check)
        l = check[n]
        r = l + int
        while abs(r - l) > 0.00001  # use secants to zoom in on the actual zero on this interval
            m = (f''(r) - f''(l))/(r-l)
            xint = l - f''(l)/m
            r = l
            l = xint
            check[n] = xint  # replace each number in check with the accurate value
        end
    end
    if length(check) == 0
        if f''(a) > 0
            println(\"f(x) is always concave up on this interval\")
        elseif f''(a) < 0
            println(\"f(x) is always concave down on this interval\")
        end
    elseif length(check) == 1
        if f''(a) > 0
            println(\"f(x) is concave up until x = \$(check[1]), then concave up after\")
        elseif f''(a) < 0
            println(\"f(x) is concave down until x = \$(check[1]), then concave up after\")
        end
    else
        if f''(a) > 0
            println(\"f(x) is concave up until x = \$(check[1])\")
        else
            println(\"f(x) is concave down until x = \$(check[1])\")
        end
        for n = 1:(length(check)-1)
            if f''((check[n] + check[n+1])/2) > 0
                println(\"f(x) is concave up between \$(check[n]) and \$(check[n+1])\")
            else
                println(\"f(x) is concave down between \$(check[n]) and \$(check[n+1])\")
            end
        end
        if f''(b) > 0
            println(\"f(x) is concave up after \$(check[end])\")
        else
            println(\"f(x) is concave down after \$(check[end])\")
        end
    end
end
</code>
""", "Answer", false)

ans405D = Revealable("""
###Answer D
Critical points are (-6., 3.394), (1.916, 54.126) and (5.434, -70).

Inflection points have x-values at 0.5 and 4.

Graph is classic W-shaped graph of a positive 4th degree function; dec-inc-dec-inc; cu cd cu.
""", "Answer", false)

#############
# Lesson 06 #
#############

cp406 = Revealable("""
<img src=\"files/4-6/deriv2test.png\" width=300 />
""", "How could the concavity tell us whether we have a min or max?", false)

ans406 = Revealable("""
###Answer A
My program steals blatantly from the first half of my increasing/decreasing program to find x-values where the derivative is zero; after that it's a few lines for concavity testing. It is **so much easier** to do concavity testing than increasing/decreasing interval testing.

<code>
using Calculus

function critpts(f, a, b)
    check = {}  # list of points where derivative switches value is currently empty
    int = (b-a)/100  # 100 is arbitrary, raise/lower as needed. Divides the interval into 100 test points
    for n in a:int:(b-int)
        if sign(f'(n)) != sign(f'(n + int))  # seek points where the first deriv changes
            push!(check, n) #create list of left hand points where derivative changes
        end
    end
    for n in 1:length(check)
        l = check[n]
        r = l + int
        while abs(r - l) > 0.00001  # use secants to zoom in on this interval's zero
            m = (f'(r) - f'(l))/(r-l)
            xint = l - f'(l)/m
            r = l
            l = xint
            check[n] = xint  # replace each number in check with the accurate value
        end
     end
    for n in 1:length(check)
        if f''(check[n])> 0 
            println(\"minimum at (\$(check[n]), \$(f(check[n])))\")
        else
            println(\"maximum at (\$(check[n]), \$(f(check[n])))\")
        end
    end
end
</code>
""", "Answer", false)

#############
# Lesson 07 #
#############

ans407A = Revealable("""
###Answer A
<code>
function ybasedint(f)
    step = 2  # totally arbitrary.
    testpos = 0
    testneg = 0
    while -1000000 < f(testpos) < 1000000  # also totally arbitrary.
        testpos = testpos + step
    end
    while -1000 < f(testneg) < 1000
        testneg = testneg - step
    end
    println(testneg)
    println(testpos)
end
</code>
""", "Answer", false)

ans407B = Revealable("""
###Answer B
<code>
f(x) = x^4 + 35x^3 - 1062x^2 - 8336x + 47840  # the function analyzed

function gridsearch(f, a, b)  #f is the function, a and b the endpoints of the interval in order
    int = b - a 
    int = int/5  # divides interval into 50 subintervals
    test = a  # everything start with a. Test is the point we're currently testing...
    low = f(a)  # low is the record low value so far
    save = a  # save is the x-value corresponding to the record low
    while test < b  # this loop will run until we've tested all the points from a to b
        if f(test)<low  # if the y-value is lower than the current lowest,
            low = f(test)  # then this loop replaces the current (save, low) with the new (save, low)
            save = test
        end
    test = test + int  # moving on to the next point
    end
    println(\"seed with x = \$save\")
end
</code>
""", "Answer", false)

ans407C = Revealable("""
###Answer C
The main reason to do this is it's kind of nice to have one program that does everything rather than having to transfer by hand, but when I combined mine I noticed how glad I was that my code was documented.

It looks so simple, but it is truly a pain in the butt. Since you wrote the three earlier programs in separate sittings, you probably have different variables for the same thing in all the different programs. You will have to unify like variables under a common name and separate variables that you accidentally named the same thing but are different. You will also have to maintain attention to the order of interval endpoints if any of the programs require them to be in numerical order.

Other than that, it's just a matter of deleting the `function` and `end` commands from the top and bottom of each individual program, then putting a great big `function` and `end` to bracket the whole thing.
<code>
function globalmin(f, a, b)  # f is the function, a and b the endpoints of the interval in order
    # This composite function combines a grid search, a 3-point interval, and a slope-based minimization program to find a global minimum.
    
    # the first part of the program is a grid search to determine a good starting point.
    int = b - a
    int = int/50  # divides interval into 50 subintervals
    test = a  # everything starts with a. Test is the point we're currently testing...
    low = f(a)  # low is the record low value so far
    save = a  # save is the x-value corresponding to the record low
    while test < b  # this loop will run until we've tested all the points from a to b
        if f(test)<low  # if the y-value is lower than the current lowest,
        low = f(test)  # then this loop replaces the current (save, low) with the new (save, low)
        save = test  # save will return the location of the lowest point
    end
    test = test + int  # moving on to the next point
  end

    # the next part of the program is a 3-point interval search, using "save" as the seed point, the location of the record low from the grid search
    int = int/10  # initial interval is 1/10 the previous interval
    a = save + int  # first test point is 1 interval unit from the starting point
    if f(a) > f(save)  # this loop checks direction of motion to ensure we're heading to a minimum
        int = -int
        a = save + int
    end
    b = a + int
    while f(b) < f(a)
        save = a  # stepping the interval along
        a = b
        b = b + int
        int = b - save  # this increases the interval width in a Fibonacci pattern.
    end
  
    # finally, the last part of the program minimizes in the interval [save, a].
    left = min(b, save)
    right = max(b, save)
        phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
        int = right - left
        while int > 0.00001  # tolerance, change as needed
            subdiv = phi * int
            lefttest = right - subdiv  # this line and the next create two points within the interval...
            righttest = left + subdiv
            if f(lefttest) < f(righttest)  # ...while this loop tests the interior points in the function and shifts the interval endpoints inward accordingly.
            right = righttest
        else
            left = lefttest
        end
        int = right - left
    end
    println(\"\$left, \$right\")
end
</code>
""", "Answer", false)

#############
# Lesson 10 #
#############

ans410A = Revealable("""
###Answer A
1. 2

2. 19

3. 1
""", "Answer", false)

ans410B = Revealable("""
###Answer B
1. 7 and -5

2. 2.5i &plusmn; 2.40i  (no real eigenvalues, both imaginary)

3. 2.30, 2, and -1.30
""", "Answer", false)

ans410C = Revealable("""
###Answer C
1. 1.99 and 72.01; concave up

2. -12 and -6; concave down

3. at (1, -1) -6 and 2; saddle point. At (1, 0) -2 and 0; inconclusive
""", "Answer", false)

ans410D = Revealable("""
###Answer D
Hessian is [6x  -1; -1  12y]
1. saddle

2. concave up

3. saddle

4. saddle

5. concave down
""", "Answer", false)

ans410E = Revealable("""
###Answer E
1. gradient [4 - 2x  2 - 6y], critical point (2, 1/3)

2. Hessian [-2 0; 0 -6], eigenvalues negative therefore concave down. The critical point is a maximum.
""", "Answer", false)

ans410F = Revealable("""
###Answer F
1. gradient [4x<sup>3</sup> - y   2y - x]. Critical points at (0, 0) and (sqrt(1/8), sqrt(1/32) or (0.35355, 0.17678)

2.  Hessian [12x<sup>2</sup>  -1 ; -1  2]. (0, 0) is a saddle point, (0.35355, 0.17678) is concave up so this critical point is a minimum.
""", "Answer", false)

#############
# Lesson 09 #
#############

ans409A = Revealable("""
###Answer A
I chose to use a `for` loop on this, but a `while` loop with a counter would work perfectly well also.

```
function fibstring(n)
    fibs = [1, 1]  # preloading the array fibs and variables
    a = 1
    b = 1
    for x in 1:(n - 2)  # since I already have 2 elements, for n elements total I need (n - 2) more elements.
            c = a + b  # finding the next term...
            a = b  # ...and redefining the other variables 
            b = c 
            push!(fibs, c)  # finally tack c on the end of fibs; this step could have been earlier
    end
    println(fibs)  # at the end, print out the final list
end
```
""", "Answer", false)

ans409B = Revealable("""
###Answer B

    function vector(s, t)
        vec = t - s
        println (\"The vector from s to t is \$vec\")
        v = s + 1.5 * vec
        println(\"The new point v is \$v\")
    end
```
""", "Answer", false)
