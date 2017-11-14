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

# Make sure dawn and gtclang are present
set(DAWN_GIT_URL "git@github.com:MeteoSwiss-APN/dawn.git" 
    CACHE PATH "URL of the dawn git repository to clone")
set(DAWN_GIT_BRANCH "master" CACHE STRING "Branch of the dawn git repository to clone")

set(GTCLANG_GIT_URL "git@github.com:MeteoSwiss-APN/gtclang.git" 
    CACHE PATH "URL of the gtclang git repository to clone")
set(GTCLANG_GIT_BRANCH "master" CACHE STRING "URL of the gtclang git repository to clone")

include(GTClangAllCloneRepository)
gtclang_all_clone_repository(NAME dawn URL ${DAWN_GIT_URL} BRANCH ${DAWN_GIT_BRANCH})
gtclang_all_clone_repository(NAME gtclang URL ${GTCLANG_GIT_URL} BRANCH ${GTCLANG_GIT_BRANCH})

# Bootstrap Dawn CMake modules
include(DawnCMakeInit)
set(DAWN_ROOT "${GTCLANG_ALL_DAWN_SOURCE_DIR}")
dawn_cmake_init()

include(DawnAddTargetCleanAll)
include(DawnCheckInSourceBuild)
include(DawnGetArchitectureInfo)
include(DawnGetCompilerInfo)
include(DawnGetPlatformInfo)
include(DawnMakeStringPair)
include(DawnReportResult)

# Include all options (including all Dawn and GTClang options)
include(GTClangAllOptions)

dawn_get_compiler_info()
dawn_get_platform_info()
dawn_get_architecture_info()

# Prevent in source builds
dawn_check_in_source_build()

# Add custom targets
dawn_add_target_clean_all(
  "${CMAKE_BINARY_DIR}/prefix"
  "${CMAKE_BINARY_DIR}/thirdparty"  
  "${CMAKE_BINARY_DIR}/dawn-cmake"  
  "${CMAKE_BINARY_DIR}/dawn"
  "${CMAKE_BINARY_DIR}/dawn-prefix"
  "${CMAKE_BINARY_DIR}/gtclang"
  "${CMAKE_BINARY_DIR}/gtclang-prefix"
  "${CMAKE_BINARY_DIR}/Makefile"
)

# Output summary of the configuration
macro(make_config_string FIRST SECOND)
  dawn_make_string_pair(${FIRST} ": ${SECOND}" 20 out)
  list(APPEND config_info ${out})
endmacro()
make_config_string("Platform" ${DAWN_PLATFORM_STRING})
make_config_string("Architecture" ${DAWN_ARCHITECTURE_STRING})
make_config_string("Compiler" ${DAWN_COMPILER_STRING})
make_config_string("Build type" ${CMAKE_BUILD_TYPE})
dawn_report_result("Configuration summary" ${config_info})

# Build all dependencies
add_subdirectory(thirdparty)

# Build the projects
include(External_Dawn)
include(External_GTClang)
