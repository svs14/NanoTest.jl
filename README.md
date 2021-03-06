# NanoTest

[![Build Status](https://travis-ci.org/svs14/NanoTest.jl.svg?branch=master)](https://travis-ci.org/svs14/NanoTest.jl)

NanoTest is a pipelined testing framework that attempts to integrate
a broad spectrum of testing facilities for software development in Julia.

This package is currently in development.

The final release will provide:

- Extendable API and configuration (plugin-oriented architecture)
- Behaviour Driven Development (BDD)
- Parallel test execution
- Markdown example code runner
- Code coverage thresholding
- Code style thresholding (e.g. lint)
- Code analysis thresholding (e.g. function code complexity)
- Benchmark thresholding (e.g. estimated asymptotic complexity, relative timings)
- Fixtures (e.g. mocks/stubs/spies)
- Stochastic software testing
- Specification based random testing (e.g. QuickCheck in Haskell)
