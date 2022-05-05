cmake_minimum_required(VERSION 3.19.0)

add_subdirectory(${CMAKE_SOURCE_DIR}/src/3rdparty)

project(swapper)

aux_source_directory(src/swapper/ SRC_LIST)
add_executable(swapper ${SRC_LIST})