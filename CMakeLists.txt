cmake_minimum_required(VERSION 3.16)

project(H2rename VERSION 8.3.0 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets Concurrent LinguistTools)

set(TS_FILES h2rename.ts h2rename_de.ts h2rename_nl.ts)

qt_add_executable(H2rename
    main.cpp
    h2rename.cpp h2rename.h h2rename.ui
    ReadDirProgress.ui
    h2rename.qrc
    H2rename.rc
    h2rename.ico
    ${TS_FILES}
    h2rename_de.qm
    h2rename_nl.qm
    H2rename.pro
    aboutdialog.h aboutdialog.cpp aboutdialog.ui
)

target_link_libraries(H2rename PRIVATE
    Qt6::Widgets
    Qt6::Concurrent
)

set_target_properties(H2rename PROPERTIES
    WIN32_EXECUTABLE TRUE
)

# https://www.codestudy.net/blog/how-to-set-warning-level-in-cmake/
# Set warning levels for GCC
target_compile_options(H2rename PRIVATE
  $<IF:$<CXX_COMPILER_ID:GNU>,
    -Wall -Wextra -Wpedantic, #-Wshadow  # GCC flags
    >
)
