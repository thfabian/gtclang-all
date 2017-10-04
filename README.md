gtclang-all <br/> <a target="_blank" href="http://semver.org">![Version][Version.Badge]</a> <a target="_blank" href="https://travis-ci.org/thfabian/dawn">![Travis status][TravisCI.Badge]</a> <a target="_blank" href="https://opensource.org/licenses/MIT">![License: MIT][MIT.License]</a>
===========

**gtclang** is a source-to-source compiler with a high level DSL (Domain-Specifc Language) to execute stencil-like computations on a variety of different parallel architectures. The target applications for gtclang are regional weather models (regular grids) as well as global weather and climate simulations (irregular grids). gtclang is built on top of the LLVM/Clang compiler framework and [Dawn](https://github.com/MeteoSwiss-APN/dawn) and produces highly optimized C++ source code for the gridtools library.

This repository contains git submodules for gtclang project: [Dawn](https://github.com/MeteoSwiss-APN/dawn) and [gtclang](https://github.com/MeteoSwiss-APN/gtclang). It can be used to download all relevant source files as well as building many of the necessary dependencies. Please see the documentation in the submodules for more details about each project.

## Building

This project solely requires a a C++11 compiler and [CMake](https://cmake.org/).

```bash
mkdir build && cd build
cmake ..
make
make install
```

This will install all the gtclang projects locally into `<gtclang-dir>/install/`. 

## Continuous Integration

### Linux

|  Toolchain   | Config         |                                                     Status                                                          |
|:-------------|:---------------|--------------------------------------------------------------------------------------------------------------------:|
| GCC 5.4      | Release        |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 5.4][GCC_54_Release.Badge]</a>          |
| GCC 5.4      | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 5.4][GCC_54_RelWithDebInfo.Badge]</a>   |
| GCC 6.3      | Release        |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 6.3][GCC_63_Release.Badge]</a>          |
| GCC 6.3      | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 6.3][GCC_63_RelWithDebInfo.Badge]</a>   |
| Clang 4.0    | Release        |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 5.4][Clang_40_Release.Badge]</a>        |
| Clang 4.0    | RelWithDebInfo |  <a target="_blank" href="https://travis-ci.org/thfabian/gtclang-all">![GCC 5.4][Clang_40_RelWithDebInfo.Badge]</a> |

## About

This project is funded by the [PASCHA](http://www.pasc-ch.org/projects/2017-2020/pascha) project and developed by ETH Zurich and MeteoSwiss.
Significant contributions were made by Fabian Thuering (Master Thesis), Carlos Osuna and Tobias Wicky. 

### License

> The full license can be found [here](https://opensource.org/licenses/MIT).

This project is licensed under the terms of the **MIT** license.

<!-- Links -->
[TravisCI]: https://travis-ci.org/thfabian/gtclang-all
[TravisCI.Badge]: https://travis-ci.org/thfabian/gtclang-all.svg?branch=master
[Documentation.Badge]: https://img.shields.io/badge/documentation-link-blue.svg
[MIT.License]: https://img.shields.io/badge/License-MIT-blue.svg
[Version.Badge]: https://badge.fury.io/gh/thfabian%2Fgtclang-all.svg
[GCC_54_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/3
[GCC_54_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/4
[GCC_63_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/5
[GCC_63_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/6
[Clang_40_Release.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/7
[Clang_40_RelWithDebInfo.Badge]: https://travis-matrix-badges.herokuapp.com/repos/thfabian/gtclang-all/branches/master/8