cmake_minimum_required(VERSION 3.22.1)
project(pi_benchmark C)

# common compile options (platform-specific files may add or override more)
add_compile_options(-Wall -pedantic -fomit-frame-pointer -O -funroll-loops -malign-double)

add_executable(pi_css5 pi_fftcs.c fftsg_h.c)

# include platform-specific configuration
if (WIN32)
  include(${CMAKE_SOURCE_DIR}/cmake/CMakeConfig.Windows.cmake)
elseif(APPLE)
  include(${CMAKE_SOURCE_DIR}/cmake/CMakeConfig.Mac.cmake)
elseif(UNIX)
  include(${CMAKE_SOURCE_DIR}/cmake/CMakeConfig.Unix.cmake)
endif()