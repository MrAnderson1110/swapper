include(ExternalProject)

set(_overwrite_build_command BUILD_COMMAND cmake --build <BINARY_DIR> --)

set(prefix "${CMAKE_CURRENT_SOURCE_DIR}")
set(src "${CMAKE_CURRENT_SOURCE_DIR}/web3cpp")
set(WEB3CPP_INCLUDE_DIR "${prefix}/include")

ExternalProject_Add(
    Web3cpp
    PREFIX "${prefix}"
    SOURCE_DIR "{src}"
    UPDATE_COMMAND git restore .
    GIT_REPOSITORY "https://github.com/avme/web3cpp.git"
    GIT_TAG "origin/main"
    GIT_PROGRESS true
    GIT_REMOTE_UPDATE_STRATEGY CHECKOUT
    PATCH_COMMAND patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/cmake/ProjectWeb3cpp.patch
    CMAKE_GENERATOR "Unix Makefiles"
    CMAKE_ARGS -DBUILD_TESTS=OFF
    BUILD_COMMAND make
    INSTALL_COMMAND ""
)


add_library(web3cpp STATIC IMPORTED)
file(MAKE_DIRECTORY "${WEB3CPP_INCLUDE_DIR}")  # Must exist.
set_property(TARGET web3cpp PROPERTY IMPORTED_CONFIGURATIONS Release)
set_property(TARGET web3cpp PROPERTY IMPORTED_LOCATION_RELEASE "${WEB3CPP_LIBRARY}")
set_property(TARGET web3cpp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${WEB3CPP_INCLUDE_DIR}")

add_dependencies(web3cpp Web3cpp)