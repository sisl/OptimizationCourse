using Revealables

#############
# Lesson 01 #
#############

ans201A = Revealable("""
###Answer A
1. Should look like an upside-down quartic:<br />
<img src=\"files/2-1/quartic.png\" width=100 align=\"left\" />
<br clear=\"all\" />
2. Could be a line or a cubic <br />
<img src=\"files/2-1/line.png\" width=100 align=\"left\" /> <img src=\"files/2-1/cubic.png\" width=100 align=\"left\" />
<br clear=\"all\" />
3. A parabola or absolute value function<br />
<img src=\"files/2-1/parabola.png\" width=100 align=\"left\" /> <img src=\"files/2-1/absval.png\" width=100 align=\"left\" />
<br clear=\"all\" />
4. A symmetric quartic<br />
<img src=\"files/2-1/symquartic.png\" width=100 align=\"left\" />
""", "Answer", false)

ans201B = Revealable("""
###Answer B
To be possible, the numbers of local maxima and minima must be within 1 of each other. Or, with unbounded functions, there can't be both a global maximum and a global minimum.
""", "Answer", false)

#############
# Lesson 02 #
#############

ans202A = Revealable("""
###Answer A

<p>In unit 1, of course, you did this by hand. </p>

<p>It's a lot easier if you just keep the original x as one of the endpoints and only march the other endpoint, instead of marching both endpoints. This will work but will yield a very wide interval in some cases. If you do this and finish early, modify your program so that both endpoints march along.</p>

<p>Here's my version:</p>
<code>
f(x) = x^2 - 4x  # this function is just to test, it can be changed

function threept(f, x, int)  # f is above, x is the given start value, int is the interval (may be large, around 0.5)
    a = x + int  # finding first point location
    if f(a) > f(x)  # testing to see if the function is decreasing and...
        int = -int  # ...reversing direction if not
        a = x + int 
    end
    b = a + int  # another step in same direction
    while f(b) < f(a)  # this loop will run until f(b) is greater than f(a), ie an increase
        x = a  # reassigning variables here... this is what marches the entire interval along.
        a = b 
        b = b + int 
    end
    println(\"\$x, \$(f(x))\")  #prints the three points in order found
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
end
</code>
""", "Answer", false)

ans202B = Revealable("""
###Answer B

The value of h controls two things: first, how accurate your interval is; and second, how many iterations are run. This was discussed in the previous unit: h too large and your interval could be inaccurate (or you might skip over it); h too small and your iteration count goes through the roof. 

Here's my program with the counter thrown in:

<code>
function threept(f, x, int)
    a = x + int
    if f(a) > f(x)
        int = -int 
        a = x + int 
    end
    b = a + int 
    iter = 0
    while f(b) < f(a)
        x = a 
        a = b 
        b = b + int 
        iter = iter + 1
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

ans202C = Revealable("""
###Answer C

The first attempt is fairly straightforward, and the second a little harder.

For the first, a line just before the end of the `while` loop saying `h = 1.5h` will suffice.

For the second, one option is to create a bunch of new variables for the intervals. This is ugly but sufficient.

A much more elegant trick is to notice that the sum of the last two intervals is merely the difference between the first and third current points. In my code, the three points were named `x`, `a`, `b`; so I added a line just before the end of the `while` loop saying `h = b - x`.  

My final code, with counter:

<code>
function threept(f, x, int)
    a = x + int
    if f(a) > f(x)
        int = -int 
        a = x + int 
    end
    b = a + int 
    iter = 0
    while f(b) < f(a)
        x = a 
        a = b 
        b = b + int 
        iter = iter + 1
        int = b - x  # new line creating Fibonacci incrementation of interval width
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

#############
# Lesson 03 #
#############

passwords = Revealable("""
Intelligence that can be (and is) applied to this procedure includes:
* testing the most common passwords, like *Password123*
* testing dictionary words instead of random strings of numbers
* testing numbers related to dates, like year numbers or month-day combinations
* testing user information (usually publicly available on Facebook) like their pet's or spouse's name, their birthday or anniversary. 

If you want to get into a moral lesson here, the obvious conclusion is you want to make your password immune to this sort of intelligence by avoiding common passwords, actual words, actual dates, or personal information.)
""", "More on Passwords and Brute Force", false)

ans203A = Revealable("""
###Sample Answer


Because this program is awful, you won't use it again. The purpose is to:
1. show you how to do a brute-force-type program in case you ever need to
2. solidify the idea of a minimum value and some of the programming concepts behind finding it; and 
3. show you how improvement-y the improvements are in the next few lessons.

<code>
f(x) = x^2 - 4x  # could be anything

function brute(f, int, a, b)  # f = predefined function, interval (very small, like .001), a = left endpoint, b = right endpoint
    low = f(a)  # defining variables; starting with the left endpoint a
    test = a 
    loc = a
    while test < b  # will test all numbers between a and b
            if f(test) < low  # this check runs if the test point is lower than the previous low value
                low = f(test)  # and replaces the old low with the new low
                loc = test  # then records its location for later
            else  # if the test point is higher, nothing happens
            end
        test = test + int  # moves on to the next test point
    end
    println(\"minimum at x = \$loc with y-value = \$low\")  # after getting to b, prints the record low and its location
end
</code>

""", "Answer", false)

#############
# Lesson 04 #
#############

soln204A = Revealable("""
## The Solution
Instead, we divide the interval into three sections instead of two by choosing two interior points instead of one.

<img src=\"files/2-4/solution.png\" width=350 />

Although it would seem obvious to divide the segment into equal thirds, with points at .33 and .67 across the segment, there is a better way.
""", "So what do we do?", false)

ans204A = Revealable("""
###Answer A

Although you won't always be required to write a plan as a practice problem, the longer the code, the more important it is to do so on you own.
1. Start with the endpoints of an interval
2. End when a certain tolerance is reached&mdash;probably the width of the interval is less than [some number] or `f(var) <` [some other number].
3. Divide the interval into three sections by the golden ratio. Choose the section that forms a V (interior point lower than endpoints).
4. Using the new endpoints/interval, loop back to step 3.
""", "Answer", false)

ans204B = Revealable("""
###Answer B
This code does not shorten calculations using the golden ratio property, but you could!

<code>
function fibmin(eq, minlim, maxlim, epsilon)  # equation must be pre-loaded; epsilon is an arbitrary error tolerance.
    phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
        int = maxlim - minlim
        iteration = 0  # keeping track of iterations out of curiosity, not necessary.
        while int > epsilon
            subdiv = phi * int
            lefttest = maxlim - subdiv  # this line and the next create two points within the interval...
            righttest = minlim + subdiv
                if eq(lefttest) < eq(righttest)  # this loop tests the interior points and shifts the endpoints inward accordingly
                    maxlim = righttest
                else
                    minlim = lefttest
                end
            int = maxlim - minlim
            iteration = iteration + 1
        end
    println(\"\$minlim, \$maxlim\")
    println(iteration)
end
</code>
""", "Answer", false)

#############
# Lesson 05 #
#############



ans205A = Revealable("""
###Answer A

One of the tricky things about this task is how much to narrow the interval. I used thirds in my program for speed and convenience, though I worried that thirds might be overly aggressive. There's a possibility that the minimum would occur in the outer third and if I skip over it, I'll end up with an infinite loop in my program. Fortunately infinite loops are easy to identify, and then I would just change my /3 to /4 or /10 or something and repeat.

How did you choose to narrow the interval, and why? 
<code>
function findmin(f, leftbound, rightbound)  # Function `f` will need to be pre-loaded. 
    while rightbound - leftbound > .0001  # This tolerance can be adjusted as needed. Or, add a new defined variable `tolerance`.
        slope = (f(rightbound) - f(leftbound))/(rightbound - leftbound)
        if slope < 0
                leftbound = leftbound + (rightbound - leftbound)/3  # here's that /3 - modify as needed
        elseif slope > 0
                rightbound = rightbound - (rightbound - leftbound)/3
        else  # In the special case where the slopes are equal it marches both endpoints in. 
            leftbound = leftbound + (rightbound + leftbound)/3 
            rightbound = rightbound - (rightbound + leftbound)/3
        end
    end
    println(\"\$leftbound, \$rightbound\")  # Prints the boundaries, from which you can estimate the location of the minimum
end
</code>
""", "Answer", false)

ans105B = Revealable("""
###Answer B
1. Points should be: (0, 0) (0.6, -2.04) (1.2, -3.36) (1.8, -3.96) (2.4, -3.84). The interval/answer is bolded.

2. (2, -4) (2.5, -6.125) This is going the wrong direction; change step to -0.5. [If you didn't pay attention, you got the minimum, around 3.] Complete answer: (2, -4) (1.5, -1.375) (1, 1) (.5, 2.375) (0, 2)
""", "Answer", false)

ans105C = Revealable("""
###Answer C
Answers will vary greatly depending on starting \$x\$, starting \$h\$, and how you increment \$h\$ (Fibonacci numbers are only a suggestion).

Make sure you are beginning with a small \$h\$ (at most 0.5). It will ramp up fairly quickly as you increase its value.

1. The local maximum is at \$x = -8.6852\$. Note that this cubic is unbounded on both left and right so if you choose a starting \$x\$ greater than 12 or so, your numbers will fly off to infinity.

2. This function has a few local minima past -12, but as long as you choose an \$x\$-value greater than -11 or so, you should reach the absolute minimum at around \$x = 2.75172\$.
""", "Answer", false)

#############
# Lesson 06 #
#############

hint206A = Revealable("""
Step 1: determine direction of *increase* (meaning, `f(x + h)` or `f(x - h)` is *higher*, not lower, than `f(x))`.

Step 2: mark off intervals until the y-values *decrease* (meaning, `f(x + h)` is *lower* than `f(x))`.

Step 3: does not change.
""", "Just a few things...", false)

ans206A = Revealable("""
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

hint206B = Revealable("""
Step 1: The interval will now surround a *maximum*&mdash;easy because you now have a 3-point max program.

Step 2: Does not change.

Step 3: The endpoints of the chosen interval will now be *lower* than the midpoint.

Step 4: Does not change.
""", "Half the steps change.", false)

ans206B = Revealable("""
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

ans206C = Revealable("""
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

ans206D = Revealable("""
###Answer D
The minima are at -0.421 and 2.256
The maximum is at 0.790.

What you're really doing here is testing your code&mdash;if your answers don't agree (and you correctly entered __-__f(x) when trying to make the program do the opposite of what it was built to do), then there is something wrong with at least one of your programs! If the answers all agree, then there is probably nothing wrong with your programs.
""", "Answer", false)


#############
# Lesson 07 #
#############

ans207A = Revealable("""
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

ans207B = Revealable("""
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

ans207C = Revealable("""
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
<img src=\"files/2-8/slopes.png\" width=200 />

But even curved functions have *steepness*.
<img src=\"files/2-8/function.png\" width=200 />

In this diagram, the steepest part of the curve is steeper than the yellow line, and shallower than the red line, and about the same as the green line.
<img src=\"files/2-8/redgreenyellowslopes.png\" width=200 />
""", "Slope Review", false)

hint208A = Revealable("""
The math here can get ugly. Some ways to make it less ugly:
1. Enter the function `f(x)` into Julia and use that to evaluate y-values.
2. Use point-slope form for your linear equations.
3. Continue to use point-slope form when solving. The slopes of adjacent lines are opposite so the x-values will cancel nicely every time.
""", "Hints for Easier Calculations", false)

ans208A = Revealable("""
###Answer A
1. (-5, 75), (1, 183), (7, 291)

2. y - 75 = 450(x + 5); y - 183 = -450(x - 1); y - 183 = 450(x - 1); y - 291 = -450(x - 7)

3. (-1.88, 1479), (4.12, 1587)
""", "Answer", false)

ans208B = Revealable("""
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

ans208C = Revealable("""
###Answer C
1. On the function, (4.12, 494.840ish)
2. Two new points: (2.9065, 1040.9199) and (5.3335, 1040.9199)

These two have the same y-value. Neither has the current high y-value which is (-1.88, 1479), but if two were ever tied you would just pick one and run with it. Tradition says left first.
""", "Answer", false)

step = [Revealable("""
<img src=\"files/2-8/step1.png\" width=300 />
""", "=", true), Revealable("""
<img src=\"files/2-8/step2.png\" width=300 />
""", "=", true), Revealable("""
<img src=\"files/2-8/step3.png\" width=300 />
""", "=", true), Revealable("""
<img src=\"files/2-8/step4.png\" width=300 />
""", "=", true), Revealable("""
<img src=\"files/2-8/step5.png\" width=300 />
""", "=", true)]

ans208D = Revealable("""
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

ans208E = Revealable("""
###Answer E
9 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.91 1040.92 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]

11 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.12 688.95 / 2.91 335.403 / 3.69 687.3715 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]
""", "Answer", false)

ext208 = Revealable("""
###Extension Program

I split this program into multiple functions, which is a good idea when programs get complex and hard to read. Plus, I call `augment` multiple times. Having that code in a sub-function means that I don't have to rewrite it over and over.

<code>
    # pre-defined function
g(x) =  -x^4 + 4x^3 + 30x^2 - 50x + 200 # function value here 

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


ans209A = Revealable("""
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

ans109B = Revealable("""
###Answer B

    function vector(s, t)
        vec = t - s
        println (\"The vector from s to t is \$vec\")
        v = s + 1.5 * vec
        println(\"The new point v is \$v\")
    end
```
""", "Answer", false)

ans109C = Revealable("""
###Answer C
    function unitize(v)
        n = length(v)  # so I know where to stop in my for loop later
        sum = 0  # seeding 0 for the current sum 
        for x in 1:n  # repeats for each element of v
            sum = sum + (v[x])^2  # augments sum with the value of the next term, squared - Pythagorean Theorem
        end
        mag = sqrt(sum)  # finishes with square root of the sum of squares, to find magnitude
        v = v/mag  # replaces old vector v with unitized elements
        println(\"The unitized vector is \$v\")
    end
""", "Answer", false)

ans109D = Revealable("""
###Answer D
    function Dot(a, b)
        n = length(a)  # finds the length of a for my loop later
        products = []  # preloads products as the empty set
        for x in 1:n  # stops when we run out of elements to multiply.
                k = a[x] * b[x]  # multiplies each term in order...
                push!(products, k)  # ...and pushes that onto the end of products
            end
        println(\"The dot product is \$sum(products)\")  # then reports the sum of products 
    end
""", "Answer", false)

#############
# Lesson 10 #
#############

ans110 = Revealable("""
###Sample Program:

    f(x) = x^2 - 4x  # function can be modified to whatever

    function secant(f, a, b)
        while abs(b - a) > 0.00001  # more accurate is fine. Note absolute value is important for distance!
                                    # Also could use f(b) < 0.00001.
            m = (f(a) - f(b))/(a - b)  # made a variable for slope to simplify next line
            x = -f(a)/m + a  # calculating the x-intercept
            a = b  # redefining a and b to include the old b and the x-intercept x
            b = x 
        end  # loop ends when tolerance is reached
        println(b)  # print the value of b (the last x-intercept found).
    end
""", "Answer", false)
