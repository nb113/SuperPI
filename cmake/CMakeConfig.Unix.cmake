# Unix (Linux) specific CMake settings
# Link math library properly and add static link option if desired
message(STATUS "Including Unix specific CMake config")

target_link_libraries(pi_css5 PRIVATE m)
# set -static as linker option only if explicitly requested via option
if (DEFINED ENABLE_STATIC_LINK AND ENABLE_STATIC_LINK)
  add_link_options(-static)
endif()

# Example: add debug flags for debug builds
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  target_compile_options(pi_css5 PRIVATE -g)
endif()
