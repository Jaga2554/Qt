# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appFirstProject_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appFirstProject_autogen.dir\\ParseCache.txt"
  "appFirstProject_autogen"
  )
endif()
