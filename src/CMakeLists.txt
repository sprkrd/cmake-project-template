# driver source files
SET(sources project_name_here.cpp)
# locate the necessary dependencies
# add the necessary include directories
INCLUDE_DIRECTORIES(../include)
# create the shared library
ADD_LIBRARY(project_name_here SHARED ${sources})
# link necessary libraries
INSTALL(TARGETS project_name_here
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
INSTALL(DIRECTORY ../include/project_name_here DESTINATION include)
INSTALL(FILES ../Findproject_name_here.cmake DESTINATION ${CMAKE_ROOT}/Modules/)
ADD_SUBDIRECTORY(examples)

