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

include(ExternalProject)

set(cmake_args
  ${GTCLANG_ALL_PACKAGE_CMAKE_ARGS}
  -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  -DBUILD_SHARED_LIBS=ON                                                         
  -Dprotobuf_BUILD_EXAMPLES=OFF
  -Dprotobuf_BUILD_SHARED_LIBS=ON
  -Dprotobuf_BUILD_TESTS=OFF
  -Dprotobuf_INSTALL_EXAMPLES=OFF
)

set(source_dir "${CMAKE_CURRENT_BINARY_DIR}/protobuf")
set(install_dir "${GTCLANG_ALL_INSTALL_PREFIX}/protobuf")

# C++ protobuf
ExternalProject_Add(protobuf-cpp
  DOWNLOAD_DIR ${GTCLANG_ALL_DOWNLOAD_DIR}
  URL ${protobuf_url}
  URL_MD5 ${protobuf_md5}
  SOURCE_DIR "${source_dir}"
  INSTALL_DIR "${install_dir}"
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -G ${CMAKE_GENERATOR} <SOURCE_DIR>/cmake ${cmake_args}
)

ExternalProject_Get_Property(protobuf-cpp install_dir)
set(Protobuf_DIR "${install_dir}/lib/cmake/protobuf" CACHE INTERNAL "")

# Python protobuf
find_package(PythonInterp 3.5 REQUIRED)
find_package(bash REQUIRED)

set(PROTOBUF_PROTOC "${install_dir}/bin/protoc")
set(PROTOBUF_LIBPROTOBUF_PATH "${install_dir}/lib")
set(PROTOBUF_PYTHON_SOURCE "${source_dir}/python")
set(PROTOBUF_PYTHON_INSTALL "${install_dir}")
set(PROTOBUF_CMAKE_EXECUTABLE "${CMAKE_COMMAND}")
set(PROTOBUF_PYTHON_EXECUTABLE "${PYTHON_EXECUTABLE}")

set(install_script_in "${CMAKE_CURRENT_LIST_DIR}/templates/protobuf_python_install_script.sh.in")
set(install_script "${CMAKE_CURRENT_BINARY_DIR}/protobuf_python_install_script.sh")
configure_file(${install_script_in} ${install_script} @ONLY)

ExternalProject_Add(protobuf-python
  SOURCE_DIR "${source_dir}/python"
  CONFIGURE_COMMAND ${BASH_EXECUTABLE} ${install_script}
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)
add_dependencies(protobuf-python protobuf-cpp)

# Glob target
add_custom_target(protobuf COMMAND "")
add_dependencies(protobuf protobuf-python protobuf-cpp)

list(APPEND GTCLANG_ALL_THIRDPARTY_CMAKE_ARGS "-DProtobuf_DIR:PATH=${Protobuf_DIR}")