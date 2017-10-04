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

# dawn_git_submodule_init
# -----------------------
#
# Update all git-submodules to use the current master branch. This effectively runs:
#
#   > git submodule update --init --remote
#
macro(dawn_git_submodule_init)
  find_program(git_executable "git")
  if(NOT(git_executable))
    message(FATAL_ERROR "ERROR: git not FOUND!")
  endif()

  message(STATUS "Updating git-submodules ...")
  execute_process(
    COMMAND "${git_executable}" "submodule" "update" "--init" "--remote"
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    RESULT_VARIABLE result
    OUTPUT_VARIABLE out_var
    ERROR_VARIABLE error_var
  )

  if(NOT("${result}" STREQUAL "0"))
    message(FATAL_ERROR "${error_var}\n\nERROR: failed to update git submodules")
  else()
    message(STATUS "Successfully updated git-submodules")
  endif()
endmacro()