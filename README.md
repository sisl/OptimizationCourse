# Optimization Course Information
These Mathematical Optimization Notebooks complement the presentations in Stanford Intelligent Systems Laboratory's [Mathematical Optimization Curriuculum](https://web.stanford.edu/group/sisl/k12/optimization/#!index.md). There is a notebook for every lesson in which the Julia language is used. If you would like to make answers unavailable to your students, you can remove `answers.jl` from the set of files available to them.

The first three units are non-Calculus, requiring only a knowledge of Algebra; the last two units require completion of Calculus AB. All of the units make use of the Julia programming language to teach students how to apply basic coding techniques to solve complex and relevant mathematical problems.

## Course Outline
1. Introductions and Skills
  * Optimization, vectors, iteration and recursion, foundational programming skills
2. Non-calculus methods without constraints
  * Methods in two dimensions using computers; extension to methods in three or more dimensions
3. Non-calculus methods with constraints
  * Linear programming
4. Calculus methods without constraints
  * Newton's method and review of derivative meaning; derivatives in 3D and above with implications for optimization
5. Calculus methods with constraints
  * Penalty functions; overview of other methods; Lagrange multipliers

## Audience
* First three units: math content around Algebra 1 level, analytical skills approaching Calculus. Students at the Pre-Calculus level should feel comfortable. Skilled, motivated students in Algebra 1 can certainly give it a shot.
* Last two units: Calculus required – know how to take derivatives and be familiar with their implications for finding maxima and minima.
* Computer programming skills will be taught from the ground up. Previous experience is not necessary.

## Technical Requirements
The notebooks run in the [IJulia](https://github.com/JuliaLang/IJulia.jl) environment. You will need several Julia packages: [Revealables](https://github.com/sisl/Revealables.jl), Interact, Reactive, Gadfly, and Calculus.

To use the notebooks, clone them (and their associated files) from this repository and open them in IJulia.

## Credits
These notebooks began as curriculum developed by Julia Roberts, a mathematics teacher at Cupertino High School in San Jose. The curriculum was modified and adapted into notebooks by Renee Trochet, a mathematics teacher at Eastside College Prep in East Palo Alto. This series of lessons was created with support from Professor Mykel Kochenderfer at Stanford University, under a grant from the National Science Foundation through the IISME (Industry Initiatives for Science and Math Education) program.
