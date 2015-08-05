Becomes 
Minimize T(x) = 0.8x^2 – 2^x + max(0, x-4)^2
Should be at the boundary, 4; any starting point above 6.5 or so will send it way up for r = 10.

I wrote a function:
function extpen(f, P, a)  #f is the objective function, P the penalty function, a is initial value
        r = 10
        for n = 1:10
               T(x) = f(x) + r*P(x)
               a = stepmin(T, a)   #change this to T, a, __ for a GE constraint
               println(a)
               r = 10*r
        end
end