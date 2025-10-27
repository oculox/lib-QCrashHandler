cmake_minimum_required(VERSION 3.10)


# Load the main crash handler CMake file.
include(${CMAKE_CURRENT_LIST_DIR}/qcrashhandler.cmake)

# Export the name of the library.
set(CRASHHANDLER_LIBRARY_NAME "crash-handler" CACHE INTERNAL "")

# Qt components.
find_package(Qt6 REQUIRED COMPONENTS Core)

# Setup build process.
add_library(${CRASHHANDLER_LIBRARY_NAME} STATIC
    ${CRASHHANDLER_HEADERS}
    ${CRASHHANDLER_SOURCES}
)
target_include_directories(${CRASHHANDLER_LIBRARY_NAME} PRIVATE
    ${CRASHHANDLER_INCLUDE_DIRS}
    Qt6::Core
)
target_link_libraries(${CRASHHANDLER_LIBRARY_NAME} PRIVATE
    Qt6::Core
)

# Disable warnings.
if (MSVC)
    target_compile_options(${CRASHHANDLER_LIBRARY_NAME} PRIVATE /w)
else()
    target_compile_options(${CRASHHANDLER_LIBRARY_NAME} PRIVATE -w)
endif()
