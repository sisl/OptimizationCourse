using Revealables

#############
# Lesson 02 #
#############

proof402 = Revealable("""
###Proving the Shortcut
The proof, though complex, isn't really that bad if you use a couple of tricks. First, center the interval at 0 which will not change the value of the integral. Then, multiply the interval width by 2/(b-a), which will scale the endpoints to -1 and 1. We'll have to scale it back later by multiplying by (b-a)/2. So now, the three given points can be written (-1, L) (0, M) and (1, R). Building the quadratics and solving the system is fairly simple; you will get 1st coefficient = R &ndash; M &ndash; (R-L)/2, 2nd = (R-L)/2, 3rd = M.

Integrating from -1 to 1 is a little hairy with all the variables, but not that bad because things cancel; simplifying is fairly nice, and after multiplying by (b-a)/2 to unscale it to its original size, you will get the formula above. 
""", "Oh yeah? Prove it!", false)

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

#############
# Lesson 06 #
#############

cp406 = Revealable("""
<img src=\"files/4-6/deriv2test.png\" width=300 />
""", "How could the concavity tell us whether we have a min or max?", false)
