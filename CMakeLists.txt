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

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING 
      "Choose the type of build, options are: Debug Release RelWithDebInfo." FORCE)
endif()

if(NOT BUILD_SHARED_LIBS)
  set(BUILD_SHARED_LIBS ON CACHE BOOL "Build shared libraries." FORCE)
endif()

if(NOT CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE STRING
      "Install path prefix, prepended onto install directories." FORCE)
endif()

project(gtclang-all C CXX)
cmake_minimum_required(VERSION 3.3)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Make sure all git submodules are up-to-date
include(GTClangAllGitInit)
dawn_git_submodule_init()

include(DawnCMakeInit)
set(DAWN_ROOT "${CMAKE_CURRENT_LIST_DIR}/dawn")
dawn_cmake_init()

# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# include(Macros)
# include(ExternalProject)

# # Prevent in source builds
# gsl_check_in_source_build()

# # Set default download dir
# gsl_set_default_download_dir()

# # Custom targets
# gsl_add_target_clean_all()

# # Set default CMake arguments
# option(BUILD_SHARED_LIBS "Build shared libraries" ON)

# set(GSL_DEFAULT_ARGS
#   "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}"
#   "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
#   "-DCMAKE_CXX_COMPILER:PATH=${CMAKE_CXX_COMPILER}"
#   "-DCMAKE_C_COMPILER:PATH=${CMAKE_C_COMPILER}"
# )

# include(Projects)
# add_subdirectory(thirdparty)

# # Set default CMake arguments
# option(ENABLE_TESTS "Build integration and unittets" OFF)
# option(ENABLE_EXAMPLES "Build examples" OFF)
# option(USE_GPU "Use CUDA backend for benchmarking" OFF)

# include(External_gsl)
# include(External_gridtools_clang)
