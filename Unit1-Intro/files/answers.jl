using Revealables

#############
# Lesson 05 #
#############

ans105A = Revealable("""
###Answer A
1. In order from left to right: (3.9, 18.21), (4, 19), (4.1, 19.81). Increases right, decreases left.

2. (1, 15), (2, 17), (3, 35). Increases right, decreases left

3. (-0.5, 4.61), (0, 3), (0.5, 1.65). Increases left, decreases right.
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

ans106A = Revealable("""
###Answer A
Your code might look different than mine. That's okay!
1. `f(x) = x^2 + 2x - 7`
2. `g(a,b) = (f(a) - f(b))/(a-b)`  Careful with parentheses here!
3. g(3,5)
4. g(-2, 7)
</code>
""", "Answer", false)

ans106B = Revealable("""
###Answer B
My code, heavily documented as usual:
<code>
function info(a, b)
    m = b/a  # the slope, rise/run
    midx = a/2  # x-coordinate of the midpoint
    midy = b/2  # y-coordinate of the midpoint
    dist = (a^2 + b^2)^(1/2)  # distance, using the Pythagorean Theorem
    println(\"The slope from the origin is \$m\")
    println(\"The midpoint is (\$midx, \$midy)\")
    println(\"The distance is \$dist units\")
end
</code>
""", "Answer", false)

#############
# Lesson 07 #
#############

ans107A = Revealable("""
###Answer A
<code>
function Abs(x)
    if x < 0
        println(\"The absolute value is \$(-x)\")
    else
        println(\"The absolute value is \$x\")
    end
end
</code>
""", "Answer", false)

ans107B = Revealable("""
###Answer B
<code>
function grade(x)
    p = round(x/28*100,2)  # Converting points to percent, rounding to 2 decimal places
    if p >= 90
        println(\"Congratulations! You got an A, \$p%!\")
    elseif p >= 70
        println(\"You passed your essay with \$p%!\")
    else
        println(\"Please see Mrs. Crabapple for help raising your \$p%.\")
    end
end
</code>
""", "Answer", false)

#############
# Lesson 08 #
#############

defIteration = Revealable("""
__Iteration__ is when the same procedure is repeated multiple times.


Some examples were long division, the Fibonacci numbers, prime numbers, and the calculator game. Some of these used recursion as well, but not all of them.
""", "Definition", false)

ext1081 = Revealable("""
You would change it to `function Sum(a,b)`, and modify the \"for\" line to `for x in a:b`.
""", "Extension Answer", false)

ext1082 = Revealable("""
Change it to `println(\"The sum is \$S\"`
""", "Extension Answer", false)

ans108A = Revealable("""
###Answer A
Sample code:
<code>
for x in -6:6
    println(4x^2 - 12)
end
</code>
""", "Answer", false)

ans108B = Revealable("""
###Answer B
Sample code:
<code>
x = 20
for n in 1:12
    println(x)
    x = sqrt(x)
end
</code>
""", "Answer", false)

ans108C = Revealable("""
###Answer C
It has to be a function, otherwise getting the first two numbers in the output is a real pain.
<code>
function Fibo(x)    
    println(1)  # first term
    println(1)  # second term
    a = 1  # seed numbers...
    b = 1
    for n = 1:x
        c = a + b
        println(c)
        a = b  # replacement of variables...
        b = c
    end
end
</code>

`fibo(13)` should end with 610.
""", "Answer", false)

ans108D = Revealable("""
###Answer D
Sample program (not including extensions):
<code>
function compound(P)
    n = 0  # starting the counter at 0
    while P < 1000000
        P = 1.05P  # calculation for new value of P
        n = n + 1  # incrementing the counter
    end
    println(n)  # prints the number of iterations
end
</code>
""", "Answer", false)

ans108E = Revealable("""
###Answer E
Example code:
<code>
function calcgame(x)
    n = 0
    while x != 1
        if x%2 == 0
            x = x/2
            n = n + 1
        else 
            x = 3x + 1
            n = n + 1
        end
    end
    println(n)
end
</code>
""", "Answer", false)

ans108F = Revealable("""
###Answer F
Example code:
<code>
for i in 1:20
    calcgame(i)
end
</code>
""", "Answer", false)

ans108G = Revealable("""
###Answer G
My version of the program has an interesting feature that you may or may not have come up with on their own: a variable called `primeness`, which is set to `true` unless/until the number divides evenly. There are lots of different ways to deal with the issue of how to report `n` as prime. As long as the program has output in words that tells whether the number is prime, consider yourself correct. Nevertheless, the idea of a binary variable is a useful one, so if you struggled, you might want go back and modify your program.

For an extension to the extension, list out the factors of the non-prime numbers. For an extension, list out the factors as factor pairs rather than an ordered list.
<code>
function prime(n)
    primeness = true  # assume the number is prime until proven otherwise
    test = 2  # start with 2 as the divisor
    while test <= sqrt(n)  # end when we get over the square root of n
        if n % test == 0  # if no remainder, then...
            primeness = false  # the number is not prime.
        end
        test = test + 1  # increment the divisor by 1 -- there are fancier ways
    end
    if primeness  # `primeness` variable generates an output
        println(\"\$n is prime.\")
    else 
        println(\"\$n is not prime.\")
    end
end
</code>
""", "Answer", false)

#############
# Lesson 09 #
#############


ans109A = Revealable("""
###Answer A
I chose to use a `for` loop on this, but a `while` loop with a counter would work perfectly well also.
<code>
function fibstring(n)
    fibs = [1, 1]  # preloading the array fibs and variables
    a = 1
    b = 1
    for x in 1:(n - 2)  # I have 2 elements, so for n elements total I need (n - 2) more
            c = a + b  # find the next term...
            a = b  # ...and redefine the other variables 
            b = c 
            push!(fibs, c)  # finally tack c on the end of fibs; this step could have been earlier
    end
    println(fibs)  # at the end, print out the final list
end
</code>
""", "Answer", false)

ans109B = Revealable("""
###Answer B
<code>
function vector(s, t)
    vec = t - s
    println (\"The vector from s to t is \$vec\")
    v = s + 1.5 \\\* vec
    println(\"The new point v is \$v\")
end
</code>
""", "Answer", false)

ans109C = Revealable("""
###Answer C
<code>
function unitize(v)
    n = length(v)  # so I know where to stop in my for loop later
    sum = 0  # seed 0 for the current sum 
    for x in 1:n  # repeat for each element of v
        sum = sum + (v[x])^2  # augment sum with value of next term, squared -- Pythagorean Theorem
    end
    mag = sqrt(sum)  # finish with square root of the sum of squares, to find magnitude
    v = v/mag  # replace old vector v with unitized elements
    println(\"The unitized vector is \$v\")
end
</code>
""", "Answer", false)

ans109D = Revealable("""
###Answer D
<code>
function Dot(a, b)
    n = length(a)  # find the length of a for my loop later
    products = []  # preload products as the empty set
    for x in 1:n  # stop when we run out of elements to multiply.
            k = a[x] \\\* b[x]  # multiply each term in order...
            push!(products, k)  # ...and push that onto the end of products
        end
    println(\"The dot product is \$sum(products)\") 
end
</code>
""", "Answer", false)

#############
# Lesson 10 #
#############

ans110 = Revealable("""
###Answer
Your program may be different (and better!).
<code>
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
</code>
""", "Answer", false)
