using Revealables

#############
# Lesson 01 #
#############

ans401A = Revealable("""
### Answer A
1. 31.75
2. 3
3. 22.5
4. 20.5
5. 20.05
6. 20.005
7. 20, of course!
""", "Answer", false)

ans401B = Revealable("""
### Answer B
1. 0.7201
2. 0.7215
3. 0.721673
4. 0.721686
5. 0.721688
6. Answers will vary depending on how many zeroes they type in (I didn't bother counting). Anyway it's not accurate. The moral of this story is that rounding error becomes really significant when you try to get too accurate. Mine converged just fine for a while as I added 0's, but then it started getting worse.
7. The actual derivative here is 5/(2*sqrt(5)), which is 0.7216878...
""", "Answer", false)

ans401C = Revealable("""
### Answer C
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

ans402A = Revealable("""
### Answer A
1. 41.33 in both cases.
2. The three points will be (-1, 9), (2,30) and (5, 87). The integral of 2x<sup>2</sup> + 5x + 12 from -1 to 5 gives 216. Simpson's Rule yields 1 * (9 + 120 + 87) = 216.
3. Both answers are identical at -4.67.

""", "Answer", false)

ans402B = Revealable("""
### Answer B
1. Integral = 168; Simpson's = (-3, -9), (4, 12) and (11, 33) for 14 / 6 \\\* (-9 + 48 + 33) = 168.0. 
2. Integral = 37.333; Simpson's = (4, 2) (10, 3.1623) (16, 4) for 2 \\\* (2 + 12.6491 + 4) = 37.298. 
3. Integral = 1; Simpson's = (0, 1), (&pi;/4, .7071), (&pi;/2, 0) for &pi;/12 \\\* (1 + 2.8284 + 0) = 1.002
4. Integral = 145.6949; Simpson's = (1, 2.718) (3, 20.0855) (5, 148.4132) for 4 / 6 \\\* (2.718 + 80.3421 + 148.4132) = 154.3158.
""", "Answer", false)

ans402C = Revealable("""
### Answer C
Come up with your own definition of \"acceptable error.\" Sometimes the audience will dictate that, but sometimes it's just up to the designer (that's you!).

I found that interval width 4 (original) gave 154.315726...; width 2 gave 146.417113...; width 1 gave 145.7439987. I wasn't happy until around 0.05; 0.01 was extremely accurate. (At that point I wondered how accurate just doing a Riemann sum would be, but it was not as accurate.)

<code>
function simpson(f, a, b)
    m = (a + b) / 2 
    integral = (b - a) / 6 \\\* (f(a) + 4*f(m) +f(b))  # calculate and return integral
end

b = 0
for k in (1:.01:4.99)
    b = b + simpson(f, k, k + .01)
end
println(b)
</code>
""", "Answer", false)

ans402D = Revealable("""
### Answer D
This is a bit tricky because you really do need a whole number of intervals, and they really should be evenly spaced (though this is actually not necessary), and the width could be anything. 

My solution is to divide `w` by 0.01 (which is my desired interval width), then round to the nearest whole number, then divide `w` again by that whole number to get the width of each interval. Rounding to a whole number can be accomplished using `round(k, 0)`.
""", "Answer", false)

ans402E = Revealable("""
### Answer E
<code>
function simpson(f, a, b)
    integral = 0  # seed initial value for sum later
    k = round((b-a)/.01, 0)  # determine how many intervals are required to get interval width of ~0.01
    step = (b-a)/k  # create the step value using width / number of intervals
    for n in a:step:(b-step)  # build sub-intervals with left endpt n and right endpt (n + step), width = step
        m = n + (step/2)  # midpoint 
        add = step / 6 \\\* (f(n) + 4*f(m) + f(n+step))  # simpson's rule on subinterval
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
### Answer A
My fractional answer was 67917414/24012432, which came out to:

        2.828427124749...

compared to

        2.828427124746...
""", "Answer", false)

ans403B = Revealable("""
### Answer B
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

ans404A = Revealable("""
### Answer A
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

ans404B = Revealable("""
### Answer B
1. This derives to 15x<sup>2</sup> + 4x. The maximum will occur either at the endpoints or where the derivative of this equals zero (i.e., where the second derivative equals 0). The second derivative is 30x + 4, which equals 0 at -2/15. The slope (derivative) at each point is: (-2, 52); (-2/15, -2.67); (5, 395). Limiting slope is 395.

2. This derives to 12x<sup>3</sup> - 4x, second derivative 36x<sup>2</sup> - 4. The second derivative is 0 at &plusmn;1/3, with slopes &plusmn;0.88. The endpoints have slopes of &plusmn;0.5, so the limiting slope is 0.88.
""", "Answer", false)

ans404C = Revealable("""
### Answer C
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
### Answer A
Decreasing from -&infin; to -1.366; increasing from -1.366 to 0.366; decreasing from 0.366 to 1; increasing from 1 to &infin;. Equals 0 at -1.366, 0.366 and 1.

I used my Newton program to find the zeroes, of course!
""", "Answer", false)

ans405B = Revealable("""
### Answer B
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
### Answer C
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
### Answer D
Critical points are (-6., 3.394), (1.916, 54.126) and (5.434, -70).

Inflection points have x-values at 0.5 and 4.

Graph is classic W-shaped graph of a positive 4th degree function; dec-inc-dec-inc; cu cd cu.
""", "Answer", false)

#############
# Lesson 06 #
#############

ans406 = Revealable("""
### Answer
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

zeroslope = Revealable("""
The minimum point has a “slope” of zero. Notice that every line on the plane has a slope of zero at that point.
""", "Answer", false)

ans407A = Revealable("""
### Answer A
1. 32 + 8z<sup>2</sup> – 32z
2. 27y + 2
3. 2x<sup>2</sup> + 794x – 40000
4. 484
""", "Answer", false)

ans407B = Revealable("""
### Answer B
1. derives to 16z – 32
2. derives to 27
3. derives to 4x + 794
4. derives to 0
""", "Answer", false)

ans407C = Revealable("""
### Answer C
1. 3x<sup>2</sup> + 8x – 12
2. 3x<sup>2</sup> + 4x – 3
3. 3x<sup>2</sup> + 400x – 30000
4. 3x<sup>2</sup> + 4yx – 3y<sup>2</sup>
5. 32 – 24y
6. 8 + 12y
7. 2x<sup>2</sup> – 6xy
""", "Answer", false)

ans407D = Revealable("""
### Answer D

One of the hardest things for good calculus students is they'll use the product rule when they shouldn't – watch for it!

1. [6x + 4y<sup>2</sup>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8xy – 2]
2. [28x<sup>3</sup> – 6y^2x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24y^2 – 6x<sup>2</sup>y + 12]
3. [2x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2y]
4. [12y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12x]
""", "Answer", false)

ans407E = Revealable("""
### Answer E
1. [4x + 3y – 4yz 3x + 4z – 4xz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2y<sup>2</sup> – 4xy]
2. [2y 2x + 4z – 3z<sup>2</sup>w&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4y – 6yzw 3yz<sup>2</sup>]
""", "Answer", false)

#############
# Lesson 08 #
#############

ans408A = Revealable("""
### Answer A
1. [0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0]
2. [2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6]
3. [-2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-10]
""", "Answer", false)

ans408B = Revealable("""
### Answer B
1. [-14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6]
2. [-2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5]
3. [19&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-22]

""", "Answer", false)

ans408C = Revealable("""
### Answer C
The gradient is [2y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2x – 2]

1. [0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-2], magnitude 2
2. [-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8], magnitude 10
3. [20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;38], magnitude 42.942
4. [8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-12], magnitude 14.422
5. Gradient is 0 when 2y = 0 and 2x – 2 = 0, which occurs at (1, 0).
""", "Answer", false)

ans408D = Revealable("""
### Answer D

Gradient is [3y – 2w + 5z&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3x – 2w&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2x – 2y]

Vector at (0, 1, -1, 2) is [-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-2]

magnitude is 7.483
""", "Answer", false)

ans408E = Revealable("""
### Answer E
The gradient is [4 – 2x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 – 6y]
1. [2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-28] magnitude 28.071
2. [-2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14] magniude 14.142
3. [0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2] magnitude 2
4. [10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;38] magnitude 39.294
5. Gradient is 0 at [2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1/3]. Note that on 3), the gradient’s x-value was 0 because it was already on the maximum point. In general, the farther we got from the maximum the higher the gradient became.
""", "Answer", false)

ans408F = Revealable("""
### Answer F
The gradient is [2x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2+4y] which evaluates to [10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50]. Since you are trying to minimize, you should travel along [-10,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-50], in the opposite direction of the gradient vector.
""", "Answer", false)

#############
# Lesson 10 #
#############

ans410A = Revealable("""
### Answer A
1. 2

2. 19

3. 1
""", "Answer", false)

ans410B = Revealable("""
### Answer B
1. 7 and -5

2. 2.5i &plusmn; 2.40i  (no real eigenvalues, both imaginary)

3. 2.30, 2, and -1.30
""", "Answer", false)

ans410C = Revealable("""
### Answer C
1. 1.99 and 72.01; concave up

2. -12 and -6; concave down

3. at (1, -1) -6 and 2; saddle point. At (1, 0) -2 and 0; inconclusive
""", "Answer", false)

ans410D = Revealable("""
### Answer D
Hessian is [6x  -1; -1  12y]
1. saddle

2. concave up

3. saddle

4. saddle

5. concave down
""", "Answer", false)

ans410E = Revealable("""
### Answer E
1. gradient [4 - 2x  2 - 6y], critical point (2, 1/3)

2. Hessian [-2 0; 0 -6], eigenvalues negative therefore concave down. The critical point is a maximum.
""", "Answer", false)

ans410F = Revealable("""
### Answer F
1. gradient [4x<sup>3</sup> - y   2y - x]. Critical points at (0, 0) and (sqrt(1/8), sqrt(1/32) or (0.35355, 0.17678)

2.  Hessian [12x<sup>2</sup>  -1 ; -1  2]. (0, 0) is a saddle point, (0.35355, 0.17678) is concave up so this critical point is a minimum.
""", "Answer", false)

#############
# Lesson 11 #
#############

ans411A = Revealable("""
### Answer A
1. gradient [-65  32], eigenvalues 33.048 and -29.048
2. gradient [3  9  17], eigenvalues -12.966, 12.043, and 0.922
""", "Answer", false)

ans411B = Revealable("""
### Answer B
1. [20  47]
2. f(a) = (10 - 2a)<sup>2</sup> + 2(12 - 47a)<sup>2</sup> - (12 - 47a)
""", "Answer", false)

ans411C = Revealable("""
### Answer C
1. a = 0.2707
2. New point = (4.5849, -0.7256)
""", "Answer", false)

ans411D = Revealable("""
### Answer D
1. From (4.5849, -0.7256), vector = <-9.17, 3.90>, a = 0.434, new point (0.610, 0.966)
2. From (0.610, 0.966), vector = <-1.22, -2.86>, a = .271, new point (0.2795, 0.1905)
""", "Answer", false)

ans411E = Revealable("""
### Answer E
For 5 iterations, I got a final point (0.0170, 0.2464).

For 10 iterations, I got (0.000, 0.2500), which is the minimum.

<code>
using Calculus

function fibmin(eq, minlim, maxlim)  # equation entered below; minlim and maxlim bracket desired minimum value
    phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
    int = maxlim - minlim
    while int > 0.00001  # tolerance, change as needed
        subdiv = phi \\\* int
        lefttest = maxlim - subdiv  # this line and the next create two points within the interval...
        righttest = minlim + subdiv
        if eq(lefttest) < eq(righttest)  # tests interior points in `eq` and shifts the interval endpts inward
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
    end
    return((maxlim + minlim) / 2)
end

function steepdesc(f, x1, x2)  # x1 and x2 are values of the initial point
    for n in 1:5
        g = gradient(x -> f(x[1], x[2]))
        v = -g([x1, x2])  # returns the negative gradient as motion vector v
        test(a) = f((x1 + a\\\*v[1]), (x2 + a\\\*v[2]))  # cross section of function in direction of vector v/scalar a
        a = fibmin(test, -10, 10) # scalar a shouldn't be too big, esp as vector v is not normalized
        x1 = x1 + a\\\*v[1]  # forms new point from old + scalar \\\* vector
        x2 = x2 + a\\\*v[2]
        println(\"\$x1, \$x2\")
    end
 end
</code>
""", "Answer", false)

ans411F = Revealable("""
### Answer F
This one is frustrating! 

The actual minimum is at (2, 1), but even after 100 iterations it didn't get there. I got to (1.926, 0.963) and threw in the towel.
""", "Answer", false)

#############
# Lesson 12 #
#############

ans412A = Revealable("""
### Answer A
Careful with the subscripts!

It ends up not mattering if you use v or g because the elements end up squared/positive anyway.

s<sub>1</sub> = 0.022; 
s<sub>2</sub> = 0.0386
""", "Answer", false)

ans412B = Revealable("""
### Answer B
(1.8097, 0.0935)

You could use the steepest-descent program from the last section and run one iteration, or just peel off the first iteration; or you could work by hand using gradients, vectors, and minimization.

The gradient here is [3.432, 0.308], vector is <-3.432, -0.308>.
""", "Answer", false)

ans412C = Revealable("""
### Answer C
Scalar multiplier s = 0.00152; new vector = <-3.4452, -0.173926>
""", "Answer", false)

ans412D = Revealable("""
### Answer D
Should get very close to the true minimum at (0, 0), with some rounding error.

With quadratic functions of n variables, the conjugate gradient method will always converge within n iterations. In this case, there were 2 variables and it took 2 iterations to find the minimum.
""", "Answer", false)

ans412E = Revealable("""
### Answer E
Still slow to converge, but at least after 100 I was at (1.993, 0.997)

<code>
using Calculus

function fibmin(eq, minlim, maxlim)  # equation entered below; minlim and maxlim bracket the minimum value
    phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
    int = maxlim - minlim
    while int > 0.00001  # tolerance, change as needed
        subdiv = phi \\\* int
        lefttest = maxlim - subdiv  # create two test points within the interval
        righttest = minlim + subdiv
            if eq(lefttest) < eq(righttest)  # test the interior points in the function and shifts the interval endpoints inward accordingly.
                maxlim = righttest
            else
                minlim = lefttest
            end
        int = maxlim - minlim
    end
    return((maxlim + minlim)/2)
end

function conjgrad(f, x1, x2)  # x1 and x2 are values of the initial point
    g = gradient(x -> f(x[1], x[2]))
    v1 = -g([x1, x2])  # return negative gradient as motion vector v
    for n in 1:20
        test(a) = f((x1 + a\\\*v1[1]), (x2 + a\\\*v1[2]))  # cross section of f in direction of vector v/scalar a
        a = fibmin(test, -10, 10) # scalar a shouldn't be too big, esp as vector v is not normalized
        x1 = x1 + a\\\*v1[1] # form new point from old + scalar*vector
        x2 = x2 + a\\\*v1[2]
        v2 = -g([x1, x2])  # negative gradient at new point becomes temporary motion vector (pre-nudge)
        s = dot(v2, v2) / dot(v1, v1)  # calculate scalar/nudge factor s
        v2 = v2 + s\\\*v1  # replace temporary motion vector with post-nudged motion vector
        v1 = v2  # rename v2 as v1 for the benefit of the loop
        println(\"\$x1, \$x2\")
    end
end
</code>
""", "Answer", false)

#############
# Lesson 13 #
#############

ans413A = Revealable("""
### Answer A
* Use the positive gradient as the direction vector rather than the negative gradient
* Use a maximization program instead of a minimization program for maximizing f(a)
""", "Answer", false)

ans413B = Revealable("""
### Answer B
Here's my old gridsearch program. It helped a little, but not much; it recommended that I start at (1, 1) instead of (0, 0), which got me to (1.988, 0.994) after 20 iterations.

<code>
function gridsearch(f, a, b, c, d)
    int1 = (b-a)/5  # splits the x1 interval into 5 sections, 6 total points 
    int2 = (d-c)/5  # same for x2
    min = f(a, c)
    A = [a c]  # seeds (a, c) as initial minimum point
    for x in {a + int1\\\*n for n in 0:5}  # array of 6 evenly spaced points from a to b
        for y in {c + int2\\\*n for n in 0:5}  # nested, 6 evenly spaced points from c to d
            test = f(x, y)
            if test < min  # if the function value is lower than the current min, replace it and location
                min = test
                A = [x y]
            end
        end
    end
    println(\"x1 = \$(A[1]), x2 = \$(A[2])\")  # prints the location of the lowest value
end
</code>
""", "Answer", false)

ans413C = Revealable("""
### Answer C
1. You should get close to the actual minimum at z = 2, y = 4, x = 0

2. This was kind of mean. Although with the simple functions we've been using as examples it seems \"easier\" to use calculus to minimize, it can get really ugly really fast. At some point the programs take over.

Anyway:

gradient = [10x + 6z - 12     2y - 4z    6x - 4y + 14z - 12]

This system of equations does, indeed, equal 0 at (0, 4, 2).

Hessian: [10  0  6; 0  2  -4; 6 -4 14]. Eigenvalues are all positive, confirming that it is positive definite/concave up, therefore (0, 4, 2) is a minimum. Yuck!!!

My 3d program here:
<code>
function conjgrad3(f, x1, x2, x3)  # x1 through x3 are values of the initial point
    g = gradient(x -> f(x[1], x[2], x[3]))
    v1 = -g([x1, x2, x3]  # returns the negative gradient as motion vector v
    for n in 1:20
        test(a) = f((x1 + a\\\*v1[1]), (x2 + a\\\*v1[2]), (x3 + a\\\*v[3]))  # cross section of f in direction of vector v/scalar a
        a = fibmin(test, -10, 10) # scalar a shouldn't be too big, esp as vector v is not normalized
        x1 = x1 + a\\\*v1[1] # forms new point from old + scalar\\\*vector
        x2 = x2 + a\\\*v1[2]
        x3 = x3 + a\\\*v1[3]
        v2 = -g([x1, x2, x3])  # neg gradient at new point becomes temp motion vector (pre-nudge)
        s = dot(v2,v2)/dot(v1,v1)  # calculate scalar/nudge factor s
        v2 = v2 + s\\\*v1  # replace temporary motion vector with post-nudged motion vector
        v1 = v2  # rename v2 as v1 for the benefit of the loop
        println(\"\$x1, \$x2, \$x3\")
    end
end
</code>
""", "Answer", false)
