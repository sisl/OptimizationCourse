using Revealables
using Gadfly
using ImplicitEquations

#############
# Lesson 01 #
#############

ans301A = Revealable("""
###Answer A
1. 3c + 4k &le; 24    (c = number of batches of cookies; k = number of cakes)
2. 20b<sub>1</sub> + 12b<sub>2</sub> &ge; 100   (b<sub>1</sub> = number of box 1, b<sub>2</sub> = number of box 2)
3. 4b + 9r + 14w &le;  45 (b = number of miles biking, r = number of miles running, w = number of miles walking)

Some things to watch out for: 

* Make sure variables are phrased in terms of *number of*. People are often tempted to abbreviate `c = cookies`, which looks great until they try to read the constraint and come up with \"3 cookies plus four cakes is less than 24,\" which makes no sense. It's 3 times the *number of batches* of cookies. It's a pain in the rear but saves grief later.

* Note that the object or factor described by all the numbers is invisible in the constraint. In 1, the whole example is about flour, but nothing in the constraint refers to \"flour\"; it has disappeared. Similarly in the answer to 2 there are no \"books\" and in 3 there are no \"minutes.\" This gets really confusing for some people, who will often want to variable-ize flour, books, or minutes.
""", "Answer", false)

function ans301B()
    labor(exp, inexp) = 15exp + 10inexp
    supervisor(exp, inexp) = exp + 2inexp
    println("Corner points are at (0, 0), (80, 0), (0, 60) and (60, 30).
    \n
    \nlabor(exp, inexp) = 15exp + 10inexp
    \nsupervisor(exp, inexp) = exp + 2inexp
    \nGadfly.plot((labor == 1200) | (supervisor == 120), 0, 120, 0, 120)")
    Gadfly.plot((labor == 1200) | (supervisor == 120), 0, 120, 0, 120)
end

slope301 = Revealable("""
###Finding the Slope
To find the slope, the easiest way is to set f = 0 and solve for x<sub>2</sub> / x<sub>1</sub>. 

Maybe you'd rather just plug in the corner points. But sometimes you have an objective function that is a curve and not a line. In that case, the optimal value of the objective function will occur on a boundary line but not necessarily at a corner point. To solve, you would graph the curve of the objective function and drag it in the direction of increasing `f` (kind of like making a contour map) and find the last place the objective function contacts the feasible region. That will be the location of the maximum.
""", "Why find the slope?", false)

ans301C = Revealable("""
###Answer C
The corner points were (0, 0), (0, 60), (80, 0) and (30, 60).
1. f = 10x<sub>1</sub> + 9x<sub>2</sub>; maximized at (30, 60) with f = 840. The company should hire 30 experienced and 60 inexperienced workers for 840 tasks per minute.
2. f = 3x<sub>1</sub> + 2x<sub>2</sub>; maximized at (80, 0) with f = 240. The company should hire 80 experienced and 0 inexperienced workers for 240 customers per year.

Don't forget to write, or at least think about, the meaning of the points rather than just the numerical values. 
""", "Answer", false)

ans301D = Revealable("""
###Answer D
In C1, both constraints were active. In C2, only the \"money\" constraint was active.
""", "Answer", false)

ans301E = Revealable("""
###Answer E
1. If money is active and supervision is inactive, then by increasing the amount of money available for wages, you could increase the value of `f`. At the same time, you have extra supervisor time. They could take on extra duties or perhaps you could reduce one to part-time.

2. If supervision is active and money inactive, then you might consider hiring another supervisor. You will have extra money in your wage allocation; this might be used to hire that supervisor, or perhaps offer bonuses, or just put in savings.

3. If both constraints are active, then you would have to increase both wage allocation and supervisor availability to increase the value of `f`.
""", "Answer", false)

#############
# Lesson 02 #
#############

dims302 = Revealable("""
The first two are \"square,\" the first 2x2 and the second 3x3. The third matrix is 3x2, the fourth one a \"row\" matrix at 1x3, and the fifth one a \"column\" matrix at 3x1.
""", "What are the dimensions of the matrices above?", false)

ans302A = Revealable("""
###Answer A
1.
```
[ 10 -12
  -9  17 ]
  ```
<br clear="all" />

2.
```
[ 3  2 -1 | 14
  2 -2  5 | 22
 -1  1 -2 | -5]
 ```
""", "Answer", false)

ans302B = Revealable("""
###Answer B

1. [-8 7; 3 -1]

2. [15 -37; -21 58]

3. [2 7; 7 71] Multiplying matrices is not commutative!

4. [3 -5; 2 7] 

5. [3 -5; 2 7] Hey, the answers to 4 and 5 are the same! Both problems involve the *identity matrix*, which we'll talk about soon.
""", "Answer", false)

ans302C = Revealable("""
###Answer C
This is the system of equations:

4x<sub>1</sub> - 2x<sub>2</sub> + x<sub>3</sub> = 21

3x<sub>1</sub> - x<sub>3</sub> = 12

-2x<sub>1</sub> + x<sub>2</sub> + 3x<sub>3</sub> = 14
""", "Answer", false)

ans302D = Revealable("""
###Answer D
1. [.09 .16 -.09; .55 -.29 .45; -.09 .09 .09]
2. Yikes! Giant error! This has no inverse. Any matrix with a determinant of 0 is not invertible, but that's not really important here, it's just cool.
3. This is kind of a lot at once. First, you need to translate the coefficient matrix into a matrix A (being careful to correctly place 0's), then abbreviate this system as AX = B, then use inverses to find X = A<sup>-1</sup>B. At this point, it's a Julia problem. The answer is 2, 0 , -1, 5.

Remember how painful it is to solve systems of equations by hand? Getting a computer to do it for you is a HUGE time-saver. Plus, computers don't forget negative signs or lose track of what step they're on.
""", "Answer", false)

#############
# Lesson 03 #
#############

ans303A = Revealable("""
###Answer A
Instead of using \"3,\" use \"A[1, 1].\" It'll save work later.

```A = float64([3 1 -2; 2 -2 5])```

First operation: ```A[1, :] = [A[1, :] / A[1, 1]]``` with result `[1 1/3 -2/3; 2 -2 5]`<br>
Second operation: ```A[2, :] = [A[2, 1] \* A[1, :] - A[2, :]]```   with result `[1 1/3  -2/3; 0 -2.67 -6.33]`

You can also use `vcat` for these and it will work just fine. The language is a lot nicer looking but it takes more lines.
""", "Answer", false)

ans303B = Revealable("""
###Answer B
If tested on the example equations, you should get x<sub>2</sub> = 0.105, x<sub>1</sub> = 1.842

In my function below, I did not make the first row, first column number 1 because I didn't figure many people would; if you chose to, congratulations! It will save time in the solving step and has uses later.
<code>
function gauss1(A)
    A = float64(A)  # convert from int to float
    A[2,:] = A[1,:] \\\* A[2,1] / A[1,1] - A[2,:] 
    println(A)
    x2 = A[2,3]/A[2,2]
    println(\"x2 = \$x2\")
    x1 = (A[1,3] - A[1,2] \* x2) / A[1,1]
    println(\"x1 = \$x1\")
end
</code>
""", "Answer", false)

rre303 = Revealable("""
It's clear why this is the idea form when you translate the matrix back into a system of equations:

    x1 = a
    x2 = b

That's the solution to the system!
""", "Why is this the ideal form?", false) 

ans303C = Revealable("""
###Answer C
<code>
function gauss2(A)
    A = float64(A)
    A[1,:] = A[1,:] / A[1,1]   
    A[2,:] = A[2,1] \\\* A[1,:] - A[2,:]
    A[2,:] = A[2,:] / A[2,2]
    A[1,:] = A[1,:] - A[1,2] \\\* A[2,:]
    B = A[:, 3]
    println(A)
    println(B)
end
</code>
""", "Answer", false)

ans303D = Revealable("""
###Answer D
<code>
function gauss3(A)
    A = float64(A)
    A[1,:] = A[1,:] / A[1,1]
    A[2,:] = A[1,:] \\\* A[2,1] - A[2,:]
    A[3,:] = A[1,:] \\\* A[3,1] - A[3,:]     
    A[2,:] = A[2,:] / A[2,2]
    A[1,:] = A[2,:] \\\* A[1,2] - A[1,:]
    A[3,:] = A[2,:] \\\* A[3,2] - A[3,:]
    A[3,:] = A[3,:] / A[3,3]
    A[1,:] = A[3,:] \\\* A[1,3] - A[1,:]
    A[2,:] = A[3,:] \\\* A[2,3] - A[2,:]
    B = A[:,4]
    println(B)
end
</code>
""", "Answer", false)

ans303E = Revealable("""
###Answer E
Note the need for two nested `for` loops, one to cycle through the rows and one for the actual pivoting process.
<code>
function gauss4(A)
    A = float64(A)
    for n in 1:3
        A[n,:] = A[n,:] / A[n,n]
        for r in 1:3
            if r != n
                A[r,:] = A[n,:] \\\* A[r, n] - A[r,:]
            end
        end
    end
    B = A[:, 4]
    println(B)
end
</code>
""", "Answer", false)

ans303F = Revealable("""
###Answer F
<code>
function gauss(A)
    A = float64(A)
    k = size(A, 1)
    for n in 1:k
        A[n,:] = A[n,:] / A[n, n]
        for r in 1:3
            if r != n
                A[r,:] = A[n,:] \\\* A[r, n] - A[r,:]
            end
        end
    end
    B = A[:, k+1]
    println(B)
end
</code>
""", "Answer", false)

#############
# Lesson 04 #
#############

ans304A = Revealable("""
###Answer A
1. 3x<sub>1</sub> + 5<sub>2</sub> + x<sub>3</sub> = 12
2. 2x<sub>1</sub> - 4<sub>2</sub> + x<sub>3</sub> + x<sub>4</sub> = 200
3. 6x<sub>1</sub> + <sub>2</sub> - x<sub>3</sub> = 150
4. -3x<sub>1</sub> + 2<sub>2</sub> + x<sub>3</sub> = 120,000
5. x<sub>1</sub> + 5<sub>2</sub> + 2x<sub>3</sub> - 8x<sub>4</sub> + x<sub>5</sub> - x<sub>5</sub> = 13.8
6. x<sub>1</sub> - 2<sub>2</sub> + x<sub>3</sub> = 0
""", "Answer", false)

ans304B = Revealable("""
###Answer B
1. -3x<sub>1</sub> - 12x<sub>2</sub> + f = 0
2. -4x<sub>1</sub> + x<sub>2</sub> + f = 0
3. First, it becomes maximize f = -2x<sub>1</sub> - x<sub>2</sub>, then 2x<sub>1</sub> + x<sub>2</sub> + f = 0
""", "Answer", false)

ans304C = Revealable("""
###Answer C
Objective Function: Maximize -50x<sub>1</sub> - 20x<sub>2</sub> - 42x<sub>3</sub> + f = 0

Constraints:

3x<sub>1</sub> + 2x<sub>2</sub> - x<sub>3</sub> + x<sub>4</sub> = 100

2x<sub>1</sub> + x<sub>2</sub> + 4x<sub>3</sub> + x<sub>5</sub> = 80

The main thing, of course, is the different names for the two slack variables.
""", "Answer", false)

ans304D = Revealable("""
###Answer D
    [ 3    2   -1  1  0  0  100
      2    1    4  0  1  0   80
    -50  -20  -42  0  0  1    0]

Yes, this in standard maximum form.
""", "Answer", false)

ans304E = Revealable("""
###Answer E
The third constraint is the tricky one. \"At least 3 times as many chairs as desks\" translates to c &gt; 3d, or c - 3d &gt; 0. To be in standard max, this must instead be written 3d - c < 0.

The initial tableau will be this, or the equivalent with the first two columns switched.
```
    [  5    2  1  0  0  0  22
       2    1  0  1  0  0  10
       3   -1  0  0  1  0   0
    -400 -100  0  0  0  1   0]
```
""", "Answer", false)

#############
# Lesson 05 #
#############

ans305A = Revealable("""
###Answer A
x<sub>1</sub> = 6

x<sub>3</sub> = 13/3 or 4 1/3

x<sub>5</sub> = 21/5 or 4.2

f = 200/14 or 14.286
""", "Answer", false)

ans305B = Revealable("""
###Answer B
A typical operation might look like this:
    ```A[2, :] = A[2, :] - 2*A[1, :]```

The answer is
```
    [1  0  3 -1  0  240
     0  3 -6  3  0  720
     0  0  3  3  3  5040]
```
 
Solutions are x<sub>1</sub> = 240, x<sub>2</sub> = 240, f = 1680.
""", "Answer", false)

ans305C = Revealable("""
###Answer C
After first pivot: 
```
    [15  10   1   0  0  1200
      0  20  -1  15  0  600
      0  -7   2   0  3  2400]
```

After second pivot/final tableau:
```
    [30   0   3  -15  0  1800
      0  20  -1   15  0   600
      0   0  33  105 60 52200]
```
Answers: x<sub>1</sub> = 60, x<sub>2</sub> = 30, f = 870. Not shockingly, it's the same answer we got graphically. 
""", "Answer", false)

ans305D =  Revealable("""
###Answer D
<code>
function pivot(A, r, c)
    nrows = size(A, 1)
    ncols = size(A, 2)
    for n in 1:nrows
        if n != r
            A[n, :] = A[n, c] \\\* A[r, :] - A[r, c] \\\* A[n, :]
            if A[n, ncols] < 0  # test to fix answer-column negatives
                    A[n, :] = -A[n, :] 
            end
        end
    end
    println(A)
end
</code>
""", "Answer", false)

ans305E =  Revealable("""
###Answer E
<code>
function pivot(A, r, c)
    nrows = size(A, 1)
    ncols = size(A, 2)
    for n in 1:nrows 
        if n != r
            A[n, :] = A[n, c] \\\* A[r, :] - A[r, c] \\\* A[n, :]
            if A[n, ncols] < 0 
                A[n, :] = -A[n, :]
            end
        end
    end
    return(A)  # `return(A)` not necessary; could just have `A`
end

A = [15 10 1 0 0 1200; 1 2 0 1 0 120; -10 -9 0 0 1 0]
A = pivot(A, 1, 1)
A = pivot(A, 2, 2)
println(A)
</code>
""", "Answer", false)


#############
# Lesson 06 #
#############

ans106A = Revealable("""
###Answer A
Sample code:
```
f(x) = x^2 + 2x - 7
g(a,b) = (f(a) - f(b))/(a-b)  # Careful with parentheses here!
g(3,5)
g(-2, 7)
```

""", "Answer", false)

ans106B = Revealable("""
###Answer B
Sample Program, heavily documented as usual:
```
function info(a, b)
    m = b/a  # the slope, rise/run
    midx = a/2  # x-coordinate of the midpoint
    midy = b/2  # y-coordinate of the midpoint
    dist = (a^2 + b^2)^(1/2)  # distance, using the Pythagorean Theorem
    println(\"The slope from the origin is \$m\")
    println(\"The midpoint is (\$midx, \$midy)\")
    println(\"The distance is \$dist units\")
end
```
""", "Answer", false)

#############
# Lesson 07 #
#############

ans107A = Revealable("""
###Answer A
```
function Abs(x)
    if x < 0
        println(\"The absolute value is \$(-x)\")
    else
        println(\"The absolute value is \$x\")
    end
end
```
""", "Answer", false)

ans107B = Revealable("""
###Answer B
```
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
```
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
```
for x in -6:6
    println(4x^2 - 12)
end
```
""", "Answer", false)

ans108B = Revealable("""
###Answer B
Sample code:
```
x = 20
for n in 1:12
    println(x)
    x = sqrt(x)
end
```
""", "Answer", false)

ans108C = Revealable("""
###Answer C
It has to be a function, otherwise getting the first two numbers in the output is a real pain.

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

`fibo(13)` should end with 610.
""", "Answer", false)

ans108D = Revealable("""
###Answer D
Sample program (not including extensions):

    function compound(P)
        n = 0  # starting the counter at 0
        while P < 1000000
            P = 1.05P  # calculation for new value of P
            n = n + 1  # incrementing the counter
        end
        println(n)  # prints the number of iterations
    end
""", "Answer", false)

ans108E = Revealable("""
###Answer E
Example code:

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
""", "Answer", false)

ans108F = Revealable("""
###Answer F
Example code:

    for i in 1:20
        calcgame(i)
    end
""", "Answer", false)

ans108G = Revealable("""
###Answer G
My version of the program has an interesting feature that you may or may not have come up with on their own: a variable called `primeness`, which is set to `true` unless/until the number divides evenly. There are lots of different ways to deal with the issue of how to report `n` as prime. As long as the program has output in words that tells whether the number is prime, consider yourself correct. Nevertheless, the idea of a binary variable is a useful one, so if you struggled, you might want go back and modify your program.

For an extension to the extension, list out the factors of the non-prime numbers. For an extension, list out the factors as factor pairs rather than an ordered list.

    function prime(n)
        primeness = true  # assumes the number is prime until proven otherwise
        test = 2  # starting with 2 as the divisor
        while test <= sqrt(n)  # ending when we get over the square root of n
            if n % test == 0  # if no remainder, then...
                primeness = false  # the number is not prime.
            end
            test = test + 1  # increments the divisor by 1 -- there are fancier ways
        end
        if primeness  # here we see the `primeness` variable used to generate an output
            println(\"\$n is prime.\")
        else 
            println(\"\$n is not prime.\")
        end
    end

""", "Answer", false)

#############
# Lesson 09 #
#############


ans109A = Revealable("""
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
            sum = sum + (v[x])^2  # augments sum with the value of the next term, squared -- Pythagorean Theorem
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
