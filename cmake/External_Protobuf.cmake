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
    -Dprotobuf_BUILD_EXAMPLES=OFF
    -Dprotobuf_BUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
    -Dprotobuf_BUILD_TESTS=OFF
    -Dprotobuf_INSTALL_EXAMPLES=OFF
)

ExternalProject_Add(protobuf
  DOWNLOAD_DIR ${GTCLANG_ALL_DOWNLOAD_DIR}
  URL ${protobuf_url}
  URL_MD5 ${protobuf_md5}
  SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/protobuf"
  INSTALL_DIR "${GTCLANG_ALL_INSTALL_PREFIX}/protobuf"
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -G ${CMAKE_GENERATOR} <SOURCE_DIR>/cmake ${cmake_args}
)

ExternalProject_Get_Property(protobuf install_dir)
set(Protobuf_DIR "${install_dir}/lib/cmake/protobuf" CACHE INTERNAL "")

list(APPEND GTCLANG_ALL_THIRDPARTY_CMAKE_ARGS "-DProtobuf_DIR:PATH=${Protobuf_DIR}")