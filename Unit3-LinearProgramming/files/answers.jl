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
            if A[nrows, ncols-1] < 0  # answer column in the last row can't be negative
                A[nrows, :] = -A[nrows, :]
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
            if A[n, ncols] < 0  # test to fix answer-column negatives
                    A[n, :] = -A[n, :] 
            end
            if A[nrows, ncols-1] < 0  # answer column in the last row can't be negative
                A[nrows, :] = -A[nrows, :]
            end
        end
    end
    A  # return A, no `return` statement needed in Julia
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

ans306A = Revealable("""
###Answer A
1. From the first tableau, the most negative indicator is in the first column. Eliminate the -2, then choose the 5. Pivot will be position [3, 1].

2. From the second tableau, the most negative indicator is in column 2. Above it, 50/12 is slightly more than 4, so 2 is the pivot. Position [2, 2].
""", "Answer", false)

ans306B = Revealable("""
###Answer B
1. Complete; x<sub>1</sub> = 60 and x<sub>3</sub> = 500, f = 1200.
2. Neither. In column 2, the row 1 and row 2 numbers have the same value; pivot around the 20, position [1, 2].
3. Unfeasible. There are no legal candidates in the column with the most negative indicator. 
4. Complete; x<sub>1</sub> = 450 and x<sub>2</sub> = 100/3 or 33.33; f = 30.
""", "Answer", false)

ans306C = Revealable("""
###Answer C
Steps:
1. Find smallest indicator.
2. If it's greater than or equal to 0, end and report solution. 
3. If it's less than 0, identify the column of the smallest indicator. 
4. For each number in the column, if it's negative or 0 ignore it.
5. If there are no legal candidates remaining, end and report this as an error (unfeasible).
6. If there are legal candidates remaining, 
    * for each row with a legal candidate,s divide the last column by the candidate.
    * choose row with smallest value.
7. Pivot around chosen candidate.
8. Repeat.
""", "Answer", false)

ans306D = Revealable("""
###Answer D
The first pivot is at [3, 1].

The second pivot is at [1, 2]. 

The solution is x<sub>2</sub> = 6, x<sub>1</sub> = 2, f = 1400. In context, the carpenter should build 2 desks and 6 chairs for a profit of \$1400 (per week!). 
""", "Answer", false)

#############
# Lesson 07 #
#############

ans307A = Revealable("""
###Answer A
Translating words to constraints is the hardest part!
* The VARIABLES are number of servings of lemonade (`L`), number of servings of slushy (`S`).
* The CONSTRAINTS are amount of ice and amount of lemonade powder. The ice constraint can be written as: 1`L` + 2`S` &le; 120; the powder constraint is 3`L` + 2`S` &le; 192. 

I used `L` as x<sub>1</sub> and `S` as x<sub>2</sub>. It's fine if you switched them, but then your first two columns will be switched and all pivots different.

* Initial tableau: [1 2 1 0 0 120; 3 2 0 1 0 192; -4 -3 0 0 1 0]. Pivot around [2, 1].
* After first pivot, tableau: [0 4 3 -1 0 168; 3 2 0 1 0 192; 0 -1 0 4 3 768].  Pivot around [1, 2]. 
* Solution tableau: [0 4 3 -1 0 168; 12 0 -6 6 0 432; 0 0 3 15 12 3240].

The club should make 36 lemonades and 42 slushies for a total profit of \$270.

There are no inactive constraints; they will use all their ice and all their lemonade powder. Just from a business point of view, they should probably raise their prices. 
""", "Answer", false)

ans307B = Revealable("""
###Answer B
I used x<sub>1</sub> = number of chickens; x<sub>2</sub> = number of goats; x<sub>3</sub> = number of pigs; x<sub>4</sub> = number of cows.

This is a huge matrix.
1. Initial: [1 2 2 4 1 0 0 0 600; 2 1 2 10 0 1 0 0 1200; 0 2 2 5 0 0 1 0 800; -10 -35 -40 -350 0 0 0 1 0]. Pivot around [1, 3].

2. Then: [1 2 2 4 1 0 0 0 600; 2 -2 0 12 -2 2 0 0 1200; -2 0 0 2 -2 0 2 0 400; 20 10 0 -540 40 0 0 2 24000]. Pivot around [2, 4]

3. Then: [4 32 24 0 20 -8 0 0 2400; 2 -2 0 12 -2 2 0 0 1200; -28 4 0 0 -20 -4 24 0 2400; 1320 -960 0 0 -600 1080 0 24 936000]. Pivot around [1, 2]

4. Final: [4 32 24 0 20 -8 0 0 2400; 72 0 48 384 -24 48 0 0 43200; -912 0 -96 0 -720 -96 768 0 67200; 46080 0 23040 0 0 26880 768 32256000].

The initial answer is 75 goats and 112.5 cows for a profit of \$42000. That's probably a close-enough answer, but you can't raise half a cow. If you want a perfectly maximized answer, you can do the process described below.

The active constraints are space and food. The slack variable, x<sub>7</sub>, was 87.5 on the constraint of veterinary service. This means he will be using \$87.50, on average per month, less veterinary service than he's paying for. He might look for a lighter contract, or just hang on to the current one to be safe, since the average is not a guarantee that any given month will not cost more. 

####What Do We Do With Half a Cow?
If you want to work further with the 112.5 cows, start at the point (75, 112.5). Nearby lattice points are (74, 112), (74, 113), (75, 112), (75, 113), (76, 112), and (76, 113). You can eliminate (74, 112) because it clearly won't be better than (75, 112); and (75, 113) and (76, 113) will clearly violate the constraint if (75, 112.5) was on it. First test the remaining points in the constraints, then objective function:
* (74, 113) fails the \"food\" constraint
* (75, 112) passes all constraints, objective function = 41825
* (76, 112) passes all constraints, objective function = 41860.
The actual best point is therefore (76, 112), 76 goats and 112 cows.

Just to be safe I tested (77, 112), but it failed the \"space\" constraint. 
""", "Answer", false)

#############
# Lesson 08 #
#############

ans308A = Revealable("""
###Answer A
Original matrix:

    [3 1 5 15
     2 4 2 20
     4 2 5  0]

Transposed and converted to dual standard max:

    [3    2   1  0  0  0  4
     1    4   0  1  0  0  2
     5    2   0  0  1  0  5
    -15 -20   0  0  0  1  0]
""", "Answer", false)

ans308B = Revealable("""
###Answer B
1. Originally [0 0 0 280 160 72 1360]<br>
After dividing by 72: [0 0 0 3.89 2.22 1 18.89]

2. This is actually the hard part; there are 2 slack variables because there were only two equations. Both these slack variables are 0. Then x<sub>1</sub> is also 0, x<sub>2</sub> is 3.89, x<sub>3</sub> is 2.22, and the value of f is 18.89.
""", "Answer", false)

ans308C = Revealable("""
###Answer C
Constraints:

9s + 12f &ge; 50<br>
3s + 6f &ge; 36

Minimize:

70s + 100f

Initializes as [9 3 1 0 0 70; 12 6 0 1 0 100; -50 -36 0 0 1 0]

After pivoting, the final row (after division) is [22 0 0 6 1 600]

The first slack variable is 22, the second 0. Number of shelves is 0, number of file cabinets is 6 for a cost of \$600.

The manager should order 6 file cabinets and no shelves. There will be 22 cubic feet of extra storage space but all the work area is used. Savings might be achieved by asking workers to put some of the junk they keep on their work area into the storage space instead....
""", "Answer", false)

#############
# Lesson 09 #
#############

ans309A = Revealable("""
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

ans309B = Revealable("""
###Answer B

    function vector(s, t)
        vec = t - s
        println (\"The vector from s to t is \$vec\")
        v = s + 1.5 * vec
        println(\"The new point v is \$v\")
    end
```
""", "Answer", false)

ans309C = Revealable("""
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

ans309D = Revealable("""
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