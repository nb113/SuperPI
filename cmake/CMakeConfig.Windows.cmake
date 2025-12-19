# Windows specific CMake settings
message(STATUS "Including Windows specific CMake config")

# On Windows link against m might not be necessary; ensure runtime libraries are OK.
# Example: use static CRT by default? (commented out)
# set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

# add any windows-specific compile options
if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
  # MinGW-w64: link libm explicitly
  target_link_libraries(pi_css5 PRIVATE m)
endif()

# Example: add debug flags for debug builds
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  target_compile_options(pi_css5 PRIVATE -g)
endif()
