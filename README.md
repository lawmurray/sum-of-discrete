# Sums of Discrete Random Variables as Banded Matrix Products

This code accompanies the blog post [Sums of Discrete Random Variables as Banded Matrix Products](https://indii.org/blog/sum-of-discrete/). It is prototype code for a CUDA kernel that takes the probability vectors of two random variables and enumerates the probability vector of their sum.

To build:

    make

To run:

    ./main

The output is timings of various versions of the kernel, and the sum of the output vector as a diagnostic, which should be one (up to floating point errors).
