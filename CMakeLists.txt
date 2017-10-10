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

include(GTClangAllDefinitions)

# Make sure all git submodules are up-to-date (Dawn and gtclang)
include(GTClangAllGitInit)
gtclang_all_git_submodule_init()

# Bootstrap Dawn CMake modules
include(DawnCMakeInit)
set(DAWN_ROOT "${CMAKE_CURRENT_LIST_DIR}/dawn")
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
