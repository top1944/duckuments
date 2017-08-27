# Probability basics {#probability_basics}

Assigned: Liam

TODO: Random Variables, PDFs, CDFs, conditioning, marginalization, Bayes' rule, joints, posterior, likelihood, sufficient statistics, entropy, KLD, MI, Gaussian, moments, conditional independence, Markov property, graphical methods? why Gaussian? 1) Central limit theorem. 2) Maximum entropy

Exercise: derive the formula for Gaussian entropy

In this chapter we give a brief review of some basic probabilistic concepts. For a more in depth treatment a textbook such as [](#bib:Papoulis).

## Random Variables {#random_variables}

The key underlying concept in probabilistic theory is that of an *event*, such as the output of a random trial. For example, the result of a coin flip turning up HEADS, or the result of rolling a die turning up the number "4". 

\begin{definition}\label{def:random_variable}
A  (either discrete or continuous) variable that can take on any value that corresponds to the feasible output of a random trial.
\end{definition}

For example, we could model the event of flipping a fair coin with the random variable $X$. We write the probability that $X$ takes $HEADS$ as $p(X=HEADS)$. The set of all possible values for the variable $X$ is its *domain*, $\mathcal{X}$. In this case, 
\[
    \mathcal{X}=\{HEADS,TAILS}\}.
\]
     Since $X$ can only take one of two values, it is a *binary* random variable. In the case of a die roll, 
\[
    \mathcal{X}=\{1,2,3,4,5,6\}, 
\]
and we refer to this as a *discrete* random variable. If the output is real value or a subset of the real numbers, e.g., $\mathcal{X} = \mathbb{R}$, then we refer to $X$ as a *continuous* random variable.

Consider once again the toin cossing event. If the coin is fair, the have $p(X=HEADS)=p(X=TAILS)=0.5$. Here, the function $p(x)$ is called the *probability mass function* or pmf. The pmf is shown in [](#fig:binary_pmf).

<div figure-id="fig:binary_pmf" figure-caption="The pmf for a fair coin toss">
  <img src="binary_pmf.svg" style='width: 30em'/>
</div>

Here are some very important properties of $p(x)$:
- $0\leq p(x) \leq (1)$
- $\sum_{x\in\mathcal{X}}=1$


In the case of a continuous random variable, we will call this function $f(x)$ and call it a *probability density function*, or pdf.


In the case of continuous RVs, technically the $p(X=x)$ for any value $x$ is zero since $\mathcal{X}$ is infinite. To deal with this, we also define another important function, the *cumulative density function*, which is given by $F(x) \triangleq p(X\leq x)$, and now we can define $f(x) \triangleq \frac{d}{dx}F(x)$. A pdf and corresponding cdf are shown in [](#fig:pdf_cdf) (This happens to be a Gaussian distribution, defined more precisely in [](#gaussian).).

<div figure-id="fig:pdf_cdf" figure-caption="The continuous pdf and cdf">
  <img src="pdf_cdf.svg" style='width: 30em'/>
</div>

### Joint Probabilities {#joint}

If we have two different RVs representing two different events $X$ and $Y$, then we represent the probability of two distinct events $x \in \mathcal{X}$ and ${y \in \mathcal{Y}$ both happening, which we will denote as following: $p(X=x AND Y=y) = p(x,y)$. The function $p(x,y)$ is called *joint distribution*.

### Conditional Probabilities {#conditional}

Again, considering that we have to RVs, $X$ and $Y$, imagine these two events are linked in some way. For example, $X$ is the numerical output of a die roll and $Y$ is the binary even-odd output of the same die roll. Clearly these two events are linked since they are both uniquely determined by the same underlying event (the rolling of the die). In this case, we say that the RVs are *dependent* on one another. In the event that we know one of events, this gives us some information about the other. We denote this using the following notation $p(X=x GIVEN Y=y = p(x|y)$ and is called the *conditional distribution*.


<div class="check" markdown="1">
Write down the conditional pmf for the scenario just described assuming an oracle tells you that the die roll is even. In other words, what is p(x|EVEN)? (Warning: if you think this is very easy that's good, but don't get over-confident) 
</div>

The joint and conditional distributions are related by the following (which could be considered a definition of the joint distribution):

\begin{equation}
p(x,y} = p(x|y)p(y)
\label{eq:joint}
\end{equation}

and similarly, the following could be considered a definition of the conditional distribution:

\begin{equation}
p(x|y) = \frac{p(x,y)}{p(y)} \text{if} p(y) > 0
\label{eq:condition}
\end{equation}

In other words, the conditional and joint distributions are inextricably linked (you can't really talk about one without the other).

If two variables are *independent*, then the following relation holds: $p(x,y)=p(x)p(y)$.

### Marginal Distribution



### The Gaussian Distribution {#gaussian} 
