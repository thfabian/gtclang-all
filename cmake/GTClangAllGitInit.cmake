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

# gtclang_all_git_submodule_init
# ------------------------------
#
# Update all git-submodules to use the current master branch. This effectively runs:
#
#   > git submodule update --init --remote
#
function(gtclang_all_git_submodule_init)
  if(GTCLANG_ALL_NO_GIT_UPDATE)
    return()
  endif()

  find_program(git_executable "git")
  if(NOT(git_executable))
    message(FATAL_ERROR "ERROR: git not FOUND!")
  endif()
  mark_as_advanced(git_executable)

  macro(run_git)
    unset(result)
    unset(out_var)
    unset(error_var)
    set(cmd "${git_executable}")
    foreach(arg ${ARGN})
      set(cmd ${cmd} "${arg}")
    endforeach()

    execute_process(
      COMMAND ${cmd}
      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
      RESULT_VARIABLE result
      OUTPUT_VARIABLE out_var
      ERROR_VARIABLE error_var
    )

    if(NOT("${result}" STREQUAL "0"))
      message(FATAL_ERROR "${error_var}\n\nERROR: failed to run \"${cmd}\"\n\n${error_var}")
    endif()
  endmacro()

  message(STATUS "Updating git-submodules ...")

  # Check for updates
  run_git("submodule")
  set(updated)
  string(REGEX REPLACE "\n" ";" output "${out_var}")
  foreach(line ${output})
    string(SUBSTRING "${line}" "0" "1" plus)
    if("${plus}" STREQUAL "+")
      string(SUBSTRING "${line}" "42" "-1" project)
      message(STATUS "Updating ${project} ...")
      list(APPEND updated "+")
    endif()
  endforeach()

  # Update the modules
  run_git("submodule" "update" "--init" "--remote")

  if("${updated}" STREQUAL "")
    message(STATUS "Nothing to update")
  endif()

  message(STATUS "Successfully updated git-submodules")
endfunction()
