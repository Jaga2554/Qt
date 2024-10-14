cmake_minimum_required(VERSION 3.16)

project(FirstProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appFirstProject
    main.cpp
)

qt_add_qml_module(appFirstProject
    URI FirstProject
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES Backend.h
        SOURCES Backend.cpp
        RESOURCES SpeedometerStyle.qml
        QML_FILES Main_copy.qml
        RESOURCES resources.qrc
        SOURCES ModeManager.h
        SOURCES ModeManager.cpp
        SOURCES
        SOURCES
)

set(CMAKE_AUTORCC ON)

qt_add_resources(appFirstProject "app_images"
    PREFIX "/"
    FILES
        icon.PNG
        battery_grey.PNG
        controller.PNG
        engine.PNG
        green-arrow-left-11383.png
        green-arrow-right-11383.png
        left_arrow.PNG
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFirstProject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appFirstProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFirstProject
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appFirstProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
