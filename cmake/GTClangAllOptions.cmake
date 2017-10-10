##===------------------------------------------------------------------------------*- CMake -*-===##
##                         _       _       
##                        | |     | |
##                    __ _| |_ ___| | __ _ _ __   __ _ 
##                   / _` | __/ __| |/ _` | '_ \ / _` |
##                  | (_| | || (__| | (_| | | | | (_| |
##                   \__, |\__\___|_|\__,_|_| |_|\__, | - GridTools Clang DSL
##                    __/ |                       __/ |
##                   |___/                       |___/
##
##
##  This file is distributed under the MIT License (MIT). 
##  See LICENSE.txt for details.
##
##===------------------------------------------------------------------------------------------===##

option(GTCLANG_ALL_NO_GIT_UPDATE "Do not update the git-submodules" OFF)
set(GTCLANG_ALL_DAWN_DIR "${CMAKE_SOURCE_DIR}/dawn" CACHE PATH "Directory of Dawn")
set(GTCLANG_ALL_GTCLANG_DIR "${CMAKE_SOURCE_DIR}/gtclang" CACHE PATH "Directory of GTClang")

# Fetch GTClang options
include("${GTCLANG_ALL_DAWN_DIR}/cmake/DawnOptions.cmake")

# Fetch Dawn options
include("${GTCLANG_ALL_GTCLANG_DIR}/cmake/GTClangOptions.cmake")
