cmake_minimum_required(VERSION 2.6)
project(soci-sample CXX)

set(PROJECT_EXEC main)

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}.")

set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -Wextra -Werror -pedantic")

set(LIBS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib")

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
file(GLOB_RECURSE SRC_FILES "${SRC_DIR}/*.cpp")

set(SOCI_TESTS OFF)
set(SOCI_ROOT_DIR "${LIBS_DIR}/soci/src")
add_subdirectory(${SOCI_ROOT_DIR})

add_executable(${PROJECT_EXEC} "${SRC_FILES}")

list(APPEND SOCI_LIBS "soci_core" "soci_sqlite3")
add_dependencies(${PROJECT_EXEC} ${SOCI_LIBS})
target_link_libraries(${PROJECT_EXEC} ${SOCI_LIBS})
include_directories("${SOCI_ROOT_DIR}/core")
include_directories("${SOCI_ROOT_DIR}/backends/sqlite3")
