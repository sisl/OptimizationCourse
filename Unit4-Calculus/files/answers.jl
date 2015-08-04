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

hint406A = Revealable("""
Step 1: determine direction of *increase* (meaning, `f(x + h)` or `f(x - h)` is *higher*, not lower, than `f(x))`.

Step 2: mark off intervals until the y-values *decrease* (meaning, `f(x + h)` is *lower* than `f(x))`.

Step 3: does not change.
""", "Just a few things...", false)

ans406A = Revealable("""
###Answer A
<code>
function threeptmax(f, x, int) # f is the pre-loaded function (above), x is the initial value, int is the initial test interval (small).
    a = x + int
    if f(a) < f(x)
        int = -int
        a = x + int
    end
    b = a + int
    iter = 0  # no reason to keep track of iterations, just curious
    while f(b) > f(a)
        x = a  # stepping the interval along
        a = b
        b = b + int
        iter = iter + 1
        int = b - x  # this increases the interval width in a Fibonacci pattern.
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

hint406B = Revealable("""
Step 1: The interval will now surround a *maximum*&mdash;easy because you now have a 3-point max program.

Step 2: Does not change.

Step 3: The endpoints of the chosen interval will now be *lower* than the midpoint.

Step 4: Does not change.
""", "Half the steps change.", false)

ans406B = Revealable("""
###Answer B
<code>
function fibmax(f, minlim, maxlim, epsilon)  # equation specified at the end. See above for cautions on minlim, maxlim. Epsilon is the acceptable interval width/error.
    phi = (-1+(5)^(1/2))/2  # the value of the golden ratio, about 61.8%, used as our sectioning number
    int = maxlim - minlim
    iteration = 0  # totally unnecessary to keep track of iterations, but why not
    while int > epsilon  # loop runs until the interval is within the tolerance specified.
        subdiv = phi * int  # these three lines mark two points within the interval
        lefttest = maxlim - subdiv  
        righttest = minlim + subdiv
        if f(lefttest) > f(righttest)  # loop decreases interval by shifting endpoints inward to the inner point with the highest function value
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
        iteration = iteration + 1  # again, not necessary.
    end
    println(\"\$minlim, \$maxlim\")
    println(iteration)  # still not necessary. Interesting maybe.
end
</code>
""", "Answer", false)

ans406C = Revealable("""
###Answer C
<code>
function findmin(f, leftbound, rightbound)  # Function `f` will need to be entered below. Leftbound and rightbound are your interval endpoints; see note above.
    while rightbound - leftbound > .0001  # This tolerance is arbitrary and can be adjusted as needed. Or, add a new defined variable `tolerance`
        slope = (f(rightbound) - f(leftbound))/(rightbound - leftbound)
        if slope > 0
            leftbound = leftbound + (rightbound - leftbound)/3
            # The division by 3 above and below is arbitrary and aggressive.
            # If you get an infinite loop you may want to adjust the step lower, say /4 or /10.
            # This will make the algorithm relatively slower but also less likely to overshoot the minimum.
        elseif slope < 0
            rightbound = rightbound - (rightbound - leftbound)/3
        else  # In the special case where the slopes are equal it marches both endpoints in.
            leftbound = leftbound + (rightbound + leftbound)/3
            rightbound = rightbound - (rightbound + leftbound)/3
        end
    end
    println(\"\$leftbound, \$rightbound\")  # Note that the response is the boundaries, from which you can probably estimate the minimum; if not, adjust the tolerance above.
end
</code>
""", "Answer", false)

ans406D = Revealable("""
###Answer D
The minima are at -0.421 and 2.256
The maximum is at 0.790.

What you're really doing here is testing your code&mdash;if your answers don't agree (and you correctly entered __-__f(x) when trying to make the program do the opposite of what it was built to do), then there is something wrong with at least one of your programs! If the answers all agree, then there is probably nothing wrong with your programs.
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
# Lesson 08 #
#############

slope = Revealable("""
##Curved Functions and Slope
__Slope__ is a term used to describe the steepness of straight lines. 
<img src=\"files/2-8/slopes.png\" width=400 />

But even curved functions have *steepness*.
<img src=\"files/2-8/function.png\" width=400 />

In this diagram, the steepest part of the curve is steeper than the yellow line, and shallower than the red line, and about the same as the green line.
<img src=\"files/2-8/redgreenyellowslopes.png\" width=400 />
""", "Slope Review", false)

hint408A = Revealable("""
The math here can get ugly. Some ways to make it less ugly:
1. Enter the function `f(x)` into Julia and use that to evaluate y-values.
2. Use point-slope form for your linear equations.
3. Continue to use point-slope form when solving. The slopes of adjacent lines are opposite so the x-values will cancel nicely every time.
""", "Hints for Easier Calculations", false)

ans408A = Revealable("""
###Answer A
1. (-5, 75), (1, 183), (7, 291)

2. y - 75 = 450(x + 5); y - 183 = -450(x - 1); y - 183 = 450(x - 1); y - 291 = -450(x - 7)

3. (-1.88, 1479), (4.12, 1587)
""", "Answer", false)

ans408B = Revealable("""
###Answer B
Very subtle note here: Because of the nature of the method, the left hand point will always reach forward with a positive slope m, towards the right hand point which reaches back with a negative slope -m. The equations are written with the assumption that (x1, y1) are the left hand point and (x2, y2) are the right hand point. Therefore order is important when calling the program.
<code>
function intersect(x1, y1, x2, y2)
    m = 450
    ycross = (m*(x2 - x1) + (y1 + y2))/2
    xcross = (ycross - y1)/m + x1
    println(\"x = \$xcross\")
    println(\"y = \$ycross\")
end
</code>
""", "Answer", false)

ans408C = Revealable("""
###Answer C
1. On the function, (4.12, 494.840ish)
2. Two new points: (2.9065, 1040.9199) and (5.3335, 1040.9199)

These two have the same y-value. Neither has the current high y-value which is (-1.88, 1479), but if two were ever tied you would just pick one and run with it. Tradition says left first.
""", "Answer", false)

steps408 = [Revealable("""
<img src=\"files/2-8/step1.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step2.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step3.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step4.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step5.png\" width=300 />
""", "", true)]

ans408D = Revealable("""
###Answer D
In most languages, you'd need a return line. In Juila, functions automatically return the last value they touch, so Julia functions don't usually have a return line.
<code>
function listpoints(A, x1, x2)
  A = vcat(A, [x1 x2])
  A = sortrows(A)
    # `return A` would go here, but Julia doesn't need it
end

A = listpoints([-5 75], 1, 183)
A = listpoints(A, 7, 291)
A = listpoints(A, -1.88, 1479)
A = listpoints(A, 4.12, 494.840)
A = listpoints(A, 2.91, 1040.92)
A = listpoints(A, 5.33, 1040.92)
println(A)
</code>
""", "Answer", false)

ans408E = Revealable("""
###Answer E
9 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.91 1040.92 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]

11 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.12 688.95 / 2.91 335.403 / 3.69 687.3715 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]
""", "Answer", false)

ext408 = Revealable("""
###Extension Program

I split this program into multiple functions, which is a good idea when programs get complex and hard to read. Plus, I call `augment` multiple times. Having that code in a sub-function means that I don't have to rewrite it over and over.

<code>
    # pre-defined function
g(x) =  -x^4 + 4x^3 + 30x^2 - 50x + 400 # function value here 

    # this function will be called later to find intersection points of a line with slope m through (x1, y1) and a line with slope -m through (x2, y2)
function augment(A, maxslope, x1, y1, x2, y2)  # must be in order, left point first.
    ycross = (maxslope*(x2 - x1) + (y1 + y2))/2
    xcross = (ycross - y1)/maxslope + x1
    A = vcat(A, [xcross ycross])
end

function sawtooth(f, maxslope, left, right)  # function, maximum slope, left and right boundaries only 
    A = [left f(left); (left + right)/2 f((left + right)/2); right f(right)]
    A = augment(A, maxslope, A[1,1], A[1,2], A[2, 1], A[2,2])
    A = augment(A, maxslope, A[2,1], A[2,2], A[3,1], A[3,2])
    A = sortrows(A)
    for n = 1:5
        loc = findmax(A[:, 2])[2]  # returns the index of the highest number in the 2nd column of A
        A[loc, 2] = f(A[loc])
        A = augment(A, maxslope, A[loc-1, 1], A[loc-1, 2], A[loc, 1], A[loc, 2])
        A = augment(A, maxslope, A[loc, 1], A[loc, 2], A[loc+1, 1], A[loc+1, 2])
        A = sortrows(A)
    end
    println(A)
end

sawtooth(g, 450, -5, 7)
</code>
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

#############
# Lesson 10 #
#############

ans210A = Revealable("""
###Answer A
1. 134, 4, 21
2. Make sure you are getting a visual of what this does: it evaluates a function at a given point, then a smidgen above, a smidgen below, a smidgen right, and a smidgen left, then minimizes those values. The answers are: (3, 4.9); (1.9, 0); (-4, -0.9)

There are a lot of different ways to accomplish this task. Mine is below. 

<code>
f(a, b) = a^2 + 5*b^2

function brute4(f, a, b)
    A = [a b; a+.1 b; a-.1 b; a b+.1; a b-.1]  # for brute force, I think using arrays is pretty slick.
    vals = [ ]
    for n in 1:5
        vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
    end
    loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
    println(\"x1 at \$(A[loc]) and x2 at \$(A[loc + 5])\")
end
</code>
""", "Answer", false)

steps210 = [Revealable("""
<img src=\"files/2-10/step1.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step2.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step3.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step4.png\" width=300 />
""", "", true)]

ans210B = Revealable("""
###Answer B
The first practice function should narrow down to the origin; the second to (4, -3).

Again, multiple ways to do this. 
<code>
f(a, b) = a^2 + 5*b^2

function brute4min(f, a, b)
    loc = 7  # could be anything other than 1 as a seed, I just like 7
    while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
        A = [a b; a+step b; a-step b; a b+step; a b-step]  # array stores all 5 points to test.
        vals = [ ]
        for n in 1:5
            vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
        end
        loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
        a = A[loc]
        b = A[loc + 5] # taking advantage of fixed length of A at 5 to index directly rather than row, column
        end
        step = step/10        
    end
    println(\"x1 = \$(round(a, 3)) and x2 = \$(round(b, 3))\")  # rounding to 3 decimal places
end
</code>
""", "Answer", false)

ans210C = Revealable("""
###Answer C
Answers should approach approximately (0.7313..., -0.3656...).
""", "Answer", false)

ans210D = Revealable("""
###Answer D
<code>
function brute4min(f, a, b)
    step = 1
    for n in 1:8
        loc = 7  # could be anything other than 1 as a seed, I just like 7
        while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
            A = [a b; a+step b; a-step b; a b+step; a b-step]  # array stores all 5 points to test.
            vals = [ ]
            for n in 1:5
                vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
            end
            loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
            a = A[loc]
            b = A[loc + 5] # taking advantage of fixed length of A at 5 to index directly rather than row, column
        end
        step = step/10
        println(\"x1 = \$a and x2 = \$b\")  # note that this will print out each successive result, not just a final one; move this down if all you want is final
    end
end
</code>
""", "Answer", false)

ans210E = Revealable("""
###Answer E

The actual minimum occurs at (1, 1). My version of this code came up with a starting point of (-0.6, -0.6). This was close enough to give the actual minimum using the previous program.
<code>
f(a, b) = 100*(a - b)^2 + (1-b)^2

function gridsearch(f, a, b, c, d)
    int1 = (b-a)/5  # splits the x1 interval into 5 sections, 6 total points 
    int2 = (d-c)/5  # same for x2
    min = f(a, c)
    A = [a c]  # seeds (a, c) as initial minimum point
    for x in {a + int1*n for n in 0:5}  # array of 6 evenly spaced points from a to b
        for y in {c + int2*n for n in 0:5}  # nested, 6 evenly spaced points from c to d
            test = f(x, y)
            if test < min  # if the function value here is lower than the current min, replaces it and location
                min = test
                A = [x y]
            end
        end
    end
    println(\"x1 = \$(A[1]), x2 = \$(A[2])\")  # prints the location of the lowest value
end
</code>
""", "Answer", false)

ext210 = Revealable("""
###Sample Answer
<code>
function brute4min(f, a, b, c)
    step = 1
    for n = 1:8
        loc = 7  # could be anything other than 1 as a seed, I just like 7
        while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
            A = [a b c; a+step b c; a-step b c; a b+step c; a b-step c; a b c+step; a b c-step  # add c and steps of c into A
            vals = [ ]
            for n = 1:5
            vals = vcat(vals, f(A[n], A[n+7], A[n+14]))  # builds a column array with successive values of points. A has 7 rows
        end
            loc = findmin(vals)[2]  # returns location of maximum value of vals (loc alone will give a string of (value, location))
            a = A[loc]
            b = A[loc + 7] # A's length is fixed at 7, so we can index directly
            c = A[loc + 14]
        end
        step = step/10
        println(\"x1 = \$a, x2 = \$b, x3 = \$c\")  # now prints out all 3 variables
    end
end
</code>
""", "Answer", false)

#############
# Lesson 11 #
#############

ans211A = Revealable("""
###Answer A
All improvement should be in the direction of the minimum, (3, -1).

For my code, I chose to use arrays rather than if/else replacement, but either one should work.
<code>
f(a, b) = (a-3)^2 + (b+1)^2

function hjbegin(f, a, b)
    S = [a a+.1 a-.1]  # establishes an array S with our test points on x1
    A = [ ]  # seeds an empty set A
    for n in 1:3 
        A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
    end
    c = S[findmin(A)[2]]  # assigns the name "c" to the coordinate of S with the lowest function value
    A = [ ]  # resets A as empty
    T = [b b+.1 b-.1]  # establishes T with test points on x2
    for n in 1:3 
        A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
    end
    d = T[findmin(A)[2]]  # assigns the name "d" to the coordinate of T with the lowest function value
    println(\"\$a, \$b\")
    println(\"\$c, \$d\")
    println(\"\$(c-a), \$(d-b)\")  # returns the vector between the original and improved point
end
</code>
""", "Answer", false)


ans211B = Revealable("""
###Answer B
You should get something very close to the true minimum at (3, -1).
<code>
f(a, b) = (a-3)^2 + (b+1)^2

function vectorsearch(f, a, b, x, y)  # a and b are coordinates of the starting point; x, y is vector found by hjbegin
    while f(a + x, b + y) < f(a, b)
        a = a + x 
        b = b + y 
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)


ans211C = Revealable("""
###Answer C
Answers should converge towards (0.7315ish, -0.3658ish).

If you have the written steps from the first part, you should see the same results from the combined code without the need to switch between two programs.
<code>
function hj(f, a, b) # function and starting point
    int = .1 
    S = [a a+int a-int]  # establishes an array S with our test points on x1. 
    A = [ ]  # seeds an empty set A
    for n in 1:3 
        A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
    end
    c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
    A = [ ]  # resets A as empty
    T = [b b+int b-int]  # establishes T with test points on x2
    for n in 1:3 
        A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
    end
    d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
    vectorx = c - a 
    vectory = d - b
    while f(c + vectorx, d + vectory) < f(c, d)
        c = c + vectorx
        d = d + vectory
    end
    println(\"\$c, \$d\")
end
</code>
""", "Answer", false)


ans211D = Revealable("""
###Answer D
Answers should approach (0.7314ish, -0.3657ish)
<code>
function hj(f, a, b) # function and starting point
    int = .1 
    vectorx = 100  # could be any nonzero, just being careful here
    vectory = 100
    while vectorx != 0 && vectory != 0
        S = [a a+int a-int]  # establishes an array S with our test points on x1. 
        A = [ ]  # seeds an empty set A
        for n in 1:3 
            A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
        end
        c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
        A = [ ]  # resets A as empty
        T = [b b+int b-int]  # establishes T with test points on x2
        for n in 1:3 
            A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
        end
        d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
        vectorx = c - a 
        vectory = d - b
        while f(c + vectorx, d + vectory) < f(c, d)
            c = c + vectorx
            d = d + vectory
        end
        a = c 
        b = d
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)


ans211E = Revealable("""
###Answer E
Answers should approach (0.731404, -0.365702).
<code>
f(a, b) = (a+b)^2 + (sin(a+2))^2  + b^2 + 10

function hj(f, a, b) # function and starting point
    int = 1 
    for n in 1:7  # this will end up with an interval of 0.000001.
        vectorx = 100  # could be any nonzero, just being careful
        vectory = 100
        while vectorx != 0 && vectory != 0
            S = [a a+int a-int]  # establishes an array S with our test points on x1. 
            A = [ ]  # seeds an empty set A
            for n in 1:3 
                A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
            end
            c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
            A = [ ]  # resets A as empty
            T = [b b+int b-int]  # establishes T with test points on x2
            for n in 1:3 
                A = vcat(A, f(c, T[n])  # builds A with function values of T.   
            end
            d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
            vectorx = c - a 
            vectory = d - b
            while f(c + vectorx, d + vectory) < f(c, d)
                c = c + vectorx
                d = d + vectory
            end
            a = c 
            b = d   
        end
        int = int/10
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)

#############
# Lesson 12 #
#############

xsection = Revealable("""
You should be able to identify stuff that looks like parabolas in both vertical cross-sections down the middle. The horizontal cross-sections are ellipses. 

This function is f(x<sub>1</sub>, x<sub>2</sub>) = (x<sub>1</sub>)<sup>2</sup> + 2(x<sub>2</sub>)<sup>2</sup>. If you're familiar with conic sections, you should be able to see the elliptical equation in the variables. 
""", "You might see...", false)

ans212A = Revealable("""
###Answer A
1. f(x<sub>1</sub>, -1) = (x<sub>1</sub> - 3)<sup>2</sup> + 16; or, f(x) = (x - 3)<sup>2</sup> + 16. 
2. minimized at x = 3. (If you've studied quadratics, you knew this&mdash;the function is a parabola in vertex form.)
3. f(3, x<sub>2</sub>) = 0 + (x<sub>2</sub> + 5)<sup>2</sup>; or, f(x) = (x + 5)<sup>2</sup>. Minimized at -5; again, you knew this.
The answer, (3, -5), is the minimum of this function. This happened here because it's a very simple function, but it won't always.
""", "Answer", false)

ans212B = Revealable("""
###Answer B
(-1, .5), function value = 3.25 at original, 0.5 at new. It's a solid improvement but still not a minimum over the entire function.

The vector from (0.5, 1) to (-1, 0.5) is &lt;-1.5, -0.5&gt;.
""", "Answer", false)

ans212C = Revealable("""
###Answer C
1. The new point is (-1-1.5a, .5 -.5a)
2. The raw version is f(x<sub>1</sub>, x<sub>2</sub>) = (-1 - 1.5a)<sup>2</sup> + 2(.5 - .5a)<sup>2</sup> + 2(-1 - 1.5a)(.5 - .5a). If you simplified, you would get f = 4.25a<sup>2</sup> + 1.5a + .5.

Notice in Part 2: the new function is a function in one variable, and therefore *can be minimized*. 
""", "Answer", false)

ans212D = Revealable("""
###Answer D
1. a = -0.17647.
2. Since the new point was (-1 - 1.5a, .5 - .5a), plugging in a = -0.17647 yields (-0.7353, 0.5882).
3. f(-0.7353, 0.5882) = 0.3676.
""", "Answer", false)

ans212E = Revealable("""
###Answer E
Okay, I cheated a little. I have two subprograms with the same name (`fibmin`) but different inputs. Julia can handle it! (Google \"Julia multiple dispatch\" if you want to know more.) Depending on which arguments I pass in, Julia chooses the correct `fibmin` function.

Maybe you came up with a more elegant way.
<code>
function fibmin(f, a, b, dim)  # input: function, two variables, and which dimension to minimize
    phi = (-1+(5)^(1/2))/2
    maxlim = 10  # interval endpoints, change as needed
    minlim = -10
    tolerance = 0.000001  # change as needed
    int = maxlim - minlim
    while int > tolerance
        subdiv = phi*int
        lefttest = maxlim - subdiv  # these two lines create two points within the interval
        righttest = minlim + subdiv
        if dim == 1  # minimize dimension variable #1 (a)?
            moverightbound = f(lefttest, b) < f(righttest, b)
            else  # if not, minimize dimension variable #2 (b)
            moverightbound = f(a, lefttest) < f(a, righttest)
        end
        if moverightbound  # loop shifts interval boundaries
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
    end
    (maxlim + minlim)/2  # return value of minimized variable
end

function fibmin(f)  # input: function
    phi = (-1+(5)^(1/2))/2
    maxlim = 10  # interval endpoints, change as needed
    minlim = -10
    tolerance = 0.000001  # change as needed
    int = maxlim - minlim
    while int > tolerance
        subdiv = phi*int
        lefttest = maxlim - subdiv  # create two points within the interval
        righttest = minlim + subdiv
        if f(lefttest) < f(righttest)  # loop shifts interval boundaries
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
    end
    (maxlim + minlim)/2  # return minimum x-value
end

function cyclic(f, a, b)  # f is a function in 2 variables; (a, b) is the seed point 
    q = 40  # any high number will do
    f1 = 0 
    f2 = 40
    while abs(f1 - f2) > 0.0001  # tolerance for final answer
        c = fibmin(f, a, b, 1)  # minimize a
        d = fibmin(f, c, b, 2)  # minimize b
        g(x) = f(c + (c-a)*x, d + (d-b)*x)  # g is single-variable function of vector from (a,b) beyond (c,d).
        q = fibmin(g)  # minimize g(x) (to find the scalar)
        f1 = f(a, b)
        a = c + (c-a)*q
        b = d + (d-b)*q
        f2 = f(a,b)
    end
    println(\"x1 = \$a, x2 = \$b, value = \$(f(a, b))\")
end
</code>
""", "Answer", false)

#############
# Lesson 13 #
#############

hint213A = Revealable("""
###Hint A
In each case, it's mostly a matter of switching \"&lt;\" with \"&gt;\".

No solution is given for this problem. Solving it is entirely up to you!
""", "Hint", false)

ans213B = Revealable("""
###Answer B
1. For my Hooke-Jeeves, not much would change because I used arrays. If they went with multiple variables instead of arrays, it will require a lot more work here because the number of variables goes up quickly with the number of dimensions. Otherwise the algorithm is the same: test a bunch of points, find the best one, form a vector from the original, push along that vector until it stops minimizing, then repeat, shrinking the interval as needed.

2. In my program, I'd have to change my first `fibmin` function to allow more variables, and I'd need to modify the part where I check which dimension is being minimized. Other than that not much would change: once you minimize each variable, you form a vector and minimize that (it will still be an equation in 1 variable, a), then repeat.
""", "Answer", false)

ans213C = Revealable("""
###Answer C
1. For my Hooke-Jeeves, not much would change because I used arrays. If they went with multiple variables instead of arrays, it will require a lot more work here because the number of variables goes up quickly with the number of dimensions. Otherwise the algorithm is the same: test a bunch of points, find the best one, form a vector from the original, push along that vector until it stops minimizing, then repeat, shrinking the interval as needed.

2. In my program, I'd have to change my first `fibmin` function to allow more variables, and I'd need to modify the part where I check which dimension is being minimized. Other than that not much would change: once you minimize each variable, you form a vector and minimize that (it will still be an equation in 1 variable, a), then repeat.
""", "Answer", false)

#############
# Lesson 14 #
#############

ans214A = Revealable("""
###Answer A
Answers will vary, of course. 
1. should use `rand()`
2. should use `40 + 5*rand()`
3. should use `randn()`
4. should use `40 + 4.2*randn()`
""", "Answer", false)

ans214B = Revealable("""
###Answer B
Somewhere in the 10-13 range, more or less, would be typical, but on one trial you could get almost anything.
""", "Answer", false)

ans214C = Revealable("""
###Answer C
Answers will vary, of course. I got 11.58; 11.83; 11.79; 11.75. 

The actual average appears to be around 11.8, ish. If you wrote your answers with more than 2 decimal places, DON'T!!!! This method is not that accurate and it is irresponsible to report results as if it is.
<code>
function travel(n)
    total = 0
    for x in 1:n
        a = 1 + 3&#42;rand() + .8 + .35&#42;randn() + .5 + 1.5&#42;rand() + 4 + .1&#42;randn() + .25 + 3 + .8&#42;randn()
        total = total + a
    end
    average = total/n 
    println(average)
end

travel(40)
</code>
""", "Answer", false)

ans214D = Revealable("""
###Answer D
Answers will vary. For my five trials I got 14.878, 14.619, 14.711, 14.628, and 14.812. I would guess the actual average to be around 14.7 hours.
<code>
function travel(n)
    total = 0
    for x in 1:n
        a = (1 + 3&#42;rand() )
        if a >= 2
            a = a + 1.2 + .6&#42;rand()
        else
            a = a + .8 + .35&#42;randn()
        end
        a = a + .8 + .35&#42;randn() + .5 + 1.5&#42;rand() + 4 + .1&#42;randn() + .25
        if a > 9 
            a = a + 5.1 + 1.9&#42;randn()
        else
            a = a + 3 + .8&#42;randn()
        end
        total = total + a 
    end
    average = total/n 
    println(average)
end

travel(500)
</code>
""", "Answer", false)

#############
# Lesson 15 #
#############

ans215A = Revealable("""
###Answer A
All of the arrows will be equals signs.

You may not have seen this yet, but `and` translates to `&&` (line 4)

`while` loop stays the same (but needs an `end` command).

`if` loops stay the same (but need an `end`); `then` is unnecessary.

`return` (last line) may become `println` or it could stay `return`.

Whole thing can be enclosed in a `function`/`end` command.
""", "Answer", false)

binary215 = Revealable("""
###Binary Numbers
101 in binary = 5 in decimal

1010 in binary = 10 in decimal
""", "Answers", false)

ans215B = Revealable("""
###Answer B
1. The values are:
    * A: a = 7, b = 13, c = 1
    * B: a = 2, b = 2, c = 9
    * C: a = 11, b = 8, c = 10
    * D: a = 11, b = 4, c = 7.

2. In order from highest to lowest: A has fitness 19; C has fitness 9; D has fitness 8; B has fitness -5.
""", "Answer", false)

ans215C = Revealable("""
###Answer C
Answers will vary here. You should have four individuals grouped into two pairs; individuals may be repeated but not within a pair. 

This process of weighting the probabilities is simplified, but basically equivalent to what might be actually used.
""", "Answer", false)

ans215D1 = Revealable("""
###Answer D1
Your answers are totally different from mine at this point. You should generate a separate number for each pair; it might end up being the same number.
""", "Answer", false)

ans215D2 = Revealable("""
###Answer D2
Although I got rid of the -5, otherwise my children were markedly inferior to the parent generation when I ran this! It happens! That's why it takes a lot of repetition... and a larger population. Which is why it requires computers.
""", "Answer", false)

ans215E = Revealable("""
My third generation was a huge improvement; my fourth, not so much. 
Here are the fitness ranks of my generations, if you're curious:<br clear="all">
I: 19, 9, 8, -5<br clear="all">
II: 13, 10, 3, 1<br clear="all">
III: 40, 15, 14, 10<br clear="all">
IV: 28, 12, 11, -5<br clear="all">

Then I got hooked...<br clear="all">
V: 21, 16, 12, 4<br clear="all">
VI: 23, 21, 16, 6<br clear="all">
VII: 21, 21, 21, 6<br clear="all">


One thing I noticed while getting hooked is that I wrote a program that made an array out of `rand(12)` and returned the location of anything less than 1/12, which saved some time. If you're curious, continue your own iterations with computer support. Depending on your programming experience, writing an entire program might take more time than doing it by hand.

VIII: 24, 23, 21, 19.<br clear="all">
I stopped here because it was lunchtime. The optimum solution is 1111 / 1111 / 0000 = 30. It's clear that successive generations are approaching the optimum, and also getting more uniform (though mutation keeps it interesting). Cool stuff.
""", "Answer", false)






