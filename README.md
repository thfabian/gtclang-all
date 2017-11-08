gtclang-all <br/> <a target="_blank" href="http://semver.org">![Version][Version.Badge]</a> <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Travis status][TravisCI.Badge]</a> <a target="_blank" href="https://opensource.org/licenses/MIT">![License: MIT][MIT.License]</a>
===========

**gtclang** is a source-to-source compiler with a high level DSL (Domain-Specifc Language) to execute stencil-like computations on a variety of different parallel architectures. The target applications for gtclang are regional weather models (regular grids) as well as global weather and climate simulations (irregular grids). gtclang is built on top of the LLVM/Clang compiler framework and [Dawn](https://github.com/MeteoSwiss-APN/dawn) and produces highly optimized C++ source code for the gridtools library.

This repository contains git submodules of the gtclang project: [Dawn](https://github.com/MeteoSwiss-APN/dawn) and [gtclang](https://github.com/MeteoSwiss-APN/gtclang). It can be used to download all relevant source files as well as building many of the necessary dependencies. Please see the documentation in the submodules for more details about each project.

## Building

This project **solely** requires a a C++11 compiler and [CMake](https://cmake.org/) (all other dependencies will be downloaded and locally installed if necessary).

```bash
git clone https://github.com/MeteoSwiss-APN/gtclang-all.git --recursive
mkdir build && cd build
cmake ..
make -j4
make install
```

In order to compile with an specific version of a compiler, pass the argument `-DCMAKE_CXX_COMPILER=<g++-version>` to the cmake.

This will install all the gtclang projects locally into `<gtclang-dir>/install/`. Note that it is *important* to clone the repository **recursively**.

## Continuous Integration

### Linux

|  Toolchain   | Config         |                                                     Status                                                               |
|:-------------|:---------------|-------------------------------------------------------------------------------------------------------------------------:|
| GCC 5.4      | Release        |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![GCC 5.4][GCC_54_Release.Badge]</a>             |
| GCC 5.4      | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![GCC 5.4][GCC_54_RelWithDebInfo.Badge]</a>      |
| GCC 6.3      | Release        |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![GCC 6.3][GCC_63_Release.Badge]</a>             |
| GCC 6.3      | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![GCC 6.3][GCC_63_RelWithDebInfo.Badge]</a>      |
| Clang 3.8    | Release        |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 3.8][Clang_38_Release.Badge]</a>         |
| Clang 3.8    | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 3.8][Clang_38_RelWithDebInfo.Badge]</a>  |
| Clang 4.0    | Release        |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 4.0][Clang_40_Release.Badge]</a>         |
| Clang 4.0    | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 4.0][Clang_40_RelWithDebInfo.Badge]</a>  |
| Clang 5.0    | Release        |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 5.0][Clang_50_Release.Badge]</a>         |
| Clang 5.0    | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/MeteoSwiss-APN/gtclang">![Clang 5.0][Clang_50_RelWithDebInfo.Badge]</a>  |

## About

This project is funded by the [PASCHA](http://www.pasc-ch.org/projects/2017-2020/pascha) project and developed by ETH Zurich and MeteoSwiss.
Significant contributions were made by Fabian Thuering (Master Thesis), Carlos Osuna and Tobias Wicky. 

### License

> The full license can be found [here](https://opensource.org/licenses/MIT).

This project is licensed under the terms of the **MIT** license.

<!-- Links -->
[TravisCI]: https://travis-ci.org/MeteoSwiss-APN/gtclang
[TravisCI.Badge]: https://travis-ci.org/MeteoSwiss-APN/gtclang.svg?branch=master
[Documentation.Badge]: https://img.shields.io/badge/documentation-link-blue.svg
[MIT.License]: https://img.shields.io/badge/License-MIT-blue.svg
[Version.Badge]: https://badge.fury.io/gh/MeteoSwiss-APN%2Fgtclang.svg
[GCC_54_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/3
[GCC_54_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/4
[GCC_63_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/5
[GCC_63_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/6
[Clang_38_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/7
[Clang_38_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/8
[Clang_40_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/9
[Clang_40_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/10
[Clang_50_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/11
[Clang_50_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/MeteoSwiss-APN/gtclang/branches/master/12
