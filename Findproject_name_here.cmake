#edit the following line to add the librarie's header files
FIND_PATH(project_name_here_INCLUDE_DIR project_name_here.h /usr/include/iridrivers /usr/local/include/iridrivers)

FIND_LIBRARY(project_name_here_LIBRARY
    NAMES project_name_here
    PATHS /usr/lib /usr/local/lib /usr/local/lib/iridrivers) 

IF (project_name_here_INCLUDE_DIR AND project_name_here_LIBRARY)
   SET(project_name_here_FOUND TRUE)
ENDIF (project_name_here_INCLUDE_DIR AND project_name_here_LIBRARY)

IF (project_name_here_FOUND)
   IF (NOT project_name_here_FIND_QUIETLY)
      MESSAGE(STATUS "Found project_name_here: ${project_name_here_LIBRARY}")
   ENDIF (NOT project_name_here_FIND_QUIETLY)
ELSE (project_name_here_FOUND)
   IF (project_name_here_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find project_name_here")
   ENDIF (project_name_here_FIND_REQUIRED)
ENDIF (project_name_here_FOUND)

