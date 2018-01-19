set(TARGET tst_library)

include(AddGMock)
add_gmock()

include(AddGTestTest)

file(GLOB TEST_SOURCE_FILES
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_SOURCE_DIR}/src/*.h"
    tst_library.cpp
)

include_directories(
    "../include"
    "../src"
)

#enable_testing()
add_gtest_test(${TARGET} "${TEST_SOURCE_FILES}" "")
