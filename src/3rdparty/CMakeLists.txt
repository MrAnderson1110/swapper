cmake_minimum_required(VERSION 3.19.0)

# Must be before any projects
include(cmake/ProjectWeb3cpp.cmake)
set(BUILD_TESTS OFF)
add_subdirectory(web3cpp)

project(3rdparty)