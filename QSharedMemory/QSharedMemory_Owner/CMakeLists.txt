cmake_minimum_required(VERSION 3.16)

project(QSharedMemory_Owner LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core)

add_executable(QSharedMemory_Owner
  main.cpp
)
target_link_libraries(QSharedMemory_Owner Qt${QT_VERSION_MAJOR}::Core)

include(GNUInstallDirs)
install(TARGETS QSharedMemory_Owner
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
