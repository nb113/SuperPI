# macOS specific CMake settings
message(STATUS "Including macOS specific CMake config")

# On macOS libm symbols are in libSystem, linking -lm is usually unnecessary.
# But we include it for compatibility with some toolchains.
if (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID STREQUAL "Clang")
  target_link_libraries(pi_css5 PRIVATE m)
endif()

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  target_compile_options(pi_css5 PRIVATE -g)
endif()
