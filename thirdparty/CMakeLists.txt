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

# option(USE_SYSTEM_LLVM_CLANG "Should we use the system Clang/LLVM?" ON)
# option(USE_SYSTEM_BOOST "Should we use the system boost?" ON)

# # LLVM
# if(USE_SYSTEM_LLVM_CLANG)
#   find_package(Clang ${llvm_clang_version_short} REQUIRED)
#   if(DEFINED LLVM_ROOT)
#     list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DLLVM_ROOT:PATH=${LLVM_ROOT}")  
#   else()
#     list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DLLVM_ROOT:PATH=${LLVM_INSTALL_PREFIX}")    
#   endif()
# else()
#   include(External_llvm_clang)
# endif()

# # Boost
# if(USE_SYSTEM_BOOST)
#   find_package(Boost ${boost_min_version} COMPONENTS ${boost_components})
#   if(Boost_FOUND)
#     if(DEFINED BOOST_ROOT)
#       list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DBOOST_ROOT:PATH=${BOOST_ROOT}")  
#     endif()
#     list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DBOOST_LIBRARYDIR:PATH=${Boost_LIBRARY_DIRS}"
#                                         "-DBOOST_INCLUDEDIR:PATH=${Boost_INCLUDE_DIRS}"
#                                         "-DBoost_NO_SYSTEM_PATHS:BOOL=ON"
#                                         "-DBoost_NO_BOOST_CMAKE:BOOL=ON")
#   else()
#     if(ENABLE_TESTS)
#       message(FATAL_ERROR "Testing of gtclang requires Boost")
#     endif()
#   endif()
# else()
#   include(External_boost)
#   set(Boost_FOUND TRUE)
# endif()

# # GridTools
# find_package(GridTools)
# if(GRIDTOOLS_FOUND)
#   if(DEFINED GRIDTOOLS_ROOT)
#     list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DGRIDTOOLS_ROOT:PATH=${GRIDTOOLS_ROOT}")  
#   endif()
#   list(APPEND GSL_THIRDPARTYLIBS_ARGS "-DGRIDTOOLS_INCLUDE_DIRS:PATH=${GRIDTOOLS_INCLUDE_DIRS}")
# else()
#   if(ENABLE_TESTS)
#     message(FATAL_ERROR "Testing of gtclang requires gridtools")
#   endif()
# endif()

# if(Boost_FOUND AND GRIDTOOLS_FOUND)
#   set(GTCLANG_HAS_GRIDTOOLS TRUE CACHE BOOL "gridtools and boost are available")
# endif()

# set(GSL_THIRDPARTYLIBS_ARGS "${GSL_THIRDPARTYLIBS_ARGS}" PARENT_SCOPE)

