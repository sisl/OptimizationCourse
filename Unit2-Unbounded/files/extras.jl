using Revealables

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

#############
# Lesson 04 #
#############

soln204A = Revealable("""
## The Solution
Instead, we divide the interval into three sections instead of two by choosing two interior points instead of one.

<img src=\"files/2-4/solution.png\" width=350 />

Although it would seem obvious to divide the segment into equal thirds, with points at .33 and .67 across the segment, there is a better way.
""", "So what do we do?", false)

#############
# Lesson 06 #
#############

hint206A = Revealable("""
Step 1: determine direction of *increase* (meaning, `f(x + h)` or `f(x - h)` is *higher*, not lower, than `f(x))`.

Step 2: mark off intervals until the y-values *decrease* (meaning, `f(x + h)` is *lower* than `f(x))`.

Step 3: does not change.
""", "Just a few things...", false)

hint206B = Revealable("""
Step 1: The interval will now surround a *maximum*&mdash;easy because you now have a 3-point max program.

Step 2: Does not change.

Step 3: The endpoints of the chosen interval will now be *lower* than the midpoint.

Step 4: Does not change.
""", "Half the steps change.", false)

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

steps208 = [Revealable("""
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

#############
# Lesson 10 #
#############

steps210 = [Revealable("""
<img src=\"files/2-10/step1.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step2.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step3.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step4.png\" width=300 />
""", "", true)]

#############
# Lesson 12 #
#############

xsection = Revealable("""
You should be able to identify stuff that looks like parabolas in both vertical cross-sections down the middle. The horizontal cross-sections are ellipses. 

This function is f(x<sub>1</sub>, x<sub>2</sub>) = (x<sub>1</sub>)<sup>2</sup> + 2(x<sub>2</sub>)<sup>2</sup>. If you're familiar with conic sections, you should be able to see the elliptical equation in the variables. 
""", "You might see...", false)

#############
# Lesson 13 #
#############

hint213A = Revealable("""
###Hint A
In each case, it's mostly a matter of switching \"&lt;\" with \"&gt;\".

No solution is given for this problem. Solving it is entirely up to you!
""", "Hint", false)

#############
# Lesson 15 #
#############

binary215 = Revealable("""
###Binary Numbers
101 in binary = 5 in decimal

1010 in binary = 10 in decimal
""", "Answers", false)
