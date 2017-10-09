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

# gtclang_all_make_package_info
# -----------------------------
#
# Append a package info string to the global variable GTCLANG_ALL_PACKAGE_INFO for PACKAGE.
#
#    PACKAGE_NAME:STRING=<>      - Name of the package
#    USE_SYSTEM:BOOL=<>          - Do we use the system version of the package?
#
macro(gtclang_all_make_package_info PACKAGE_NAME USE_SYSTEM)
  string(LENGTH ${PACKAGE_NAME} package_name_length)
  math(EXPR indent_length "20 - ${package_name_length}")

  set(full_indent "                    ") 
  string(SUBSTRING ${full_indent} "0" "${indent_length}" indent)

  if(${USE_SYSTEM})
    set(GTCLANG_ALL_PACKAGE_INFO "${PACKAGE_NAME}${indent}: found;${GTCLANG_ALL_PACKAGE_INFO}")
  else()
    set(GTCLANG_ALL_PACKAGE_INFO "${GTCLANG_ALL_PACKAGE_INFO};${PACKAGE_NAME}${indent}: building")
  endif()
endmacro()