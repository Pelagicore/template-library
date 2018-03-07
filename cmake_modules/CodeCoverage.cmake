#
# Copyright (C) 2016-2018 Pelagicore AB
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR
# BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES
# OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
# ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
# SOFTWARE.
#
# For further information see LICENSE
#

# Prerequisites tools
find_program( GCOV_PATH gcov )
find_program( LCOV_PATH lcov )
find_program( GENHTML_PATH genhtml )
find_program( GCOVR_PATH gcovr PATHS ${CMAKE_SOURCE_DIR}/tests)

if(NOT GCOV_PATH)
        message(FATAL_ERROR "gcov is not found!")
endif()

if(NOT LCOV_PATH)
        message(FATAL_ERROR "lcov not found!")
endif()

if(NOT GENHTML_PATH)
        MESSAGE(FATAL_ERROR "genhtml not found!")
endif()

# Param target_name     The custom make target
# Param test_runner     Test runner target
# Param output_name     lcov output is generated as output_name.info
function(setup_target_for_coverage target_name test_runner output_name)
        # Setup target
        add_custom_target(${target_name}
                
                # Cleanup lcov
                ${LCOV_PATH} --directory . --zerocounters
                
                # Run tests
                COMMAND ${test_runner}

                # Capturing lcov counters and generating report
                COMMAND ${LCOV_PATH} --directory . --capture --output-file ${output_name}.info
                COMMAND ${LCOV_PATH} --remove ${output_name}.info 'build/*' '*tests*' '*googletest*' '/usr/*' --output-file ${output_name}.info.cleaned
                COMMAND ${GENHTML_PATH} -o ${output_name} ${output_name}.info.cleaned
                COMMAND ${CMAKE_COMMAND} -E remove ${output_name}.info ${output_name}.info.cleaned
                
                WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
                COMMENT "Resetting code coverage counters to zero.\nProcessing code coverage counters and generating report."
        )
        
        # Show info where to find the report
        add_custom_command(TARGET ${target_name} POST_BUILD
                COMMAND ;
                COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --green --bold "Open ${CMAKE_CURRENT_BINARY_DIR}/${output_name}/index.html in your browser to view the coverage report."
        )
endfunction()
