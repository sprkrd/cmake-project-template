IF(BUILD_TESTING)

  ## Download and build GTEST

  configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
  execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
  if(result)
    message(FATAL_ERROR "CMake step for googletest failed: ${result}")
  endif()
  execute_process(COMMAND ${CMAKE_COMMAND} --build .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
  if(result)
    message(FATAL_ERROR "Build step for googletest failed: ${result}")
  endif()

  # Prevent overriding the parent project's compiler/linker
  # settings on Windows
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

  # Add googletest directly to our build. This defines
  # the gtest and gtest_main targets.
  add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                   ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                   EXCLUDE_FROM_ALL)

  # The gtest/gtest_main targets carry header search path
  # dependencies automatically when using CMake 2.8.11 or
  # later. Otherwise we have to add them here ourselves.
  if (CMAKE_VERSION VERSION_LESS 2.8.11)
    include_directories("${gtest_SOURCE_DIR}/include")
  endif()

  # Build all tests

  INCLUDE_DIRECTORIES(../include)
  FILE(GLOB TEST_FILES "*_test.cpp")
  FOREACH(TEST_FILE ${TEST_FILES})
    STRING(REGEX REPLACE "(^.*/|\\.[^.]*$)" "" TEST_WO_EXT ${TEST_FILE})
    MESSAGE("Test ${TEST_WO_EXT} found")
    ADD_EXECUTABLE(${TEST_WO_EXT} ${TEST_FILE})
    #TARGET_LINK_LIBRARIES(${TEST_WO_EXT} ${GTEST_BOTH_LIBRARIES} pthread)
    TARGET_LINK_LIBRARIES(${TEST_WO_EXT} gtest_main)
    ADD_TEST(NAME ${TEST_FILE} COMMAND $<TARGET_FILE:${TEST_WO_EXT}>)
  ENDFOREACH()

ELSE()
  MESSAGE("BUILD_TESTING disabled, skipping tests...")
ENDIF()

