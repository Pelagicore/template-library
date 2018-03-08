TEMPLATE-LIBRARY
================
A template C/C++ library. Uses CMake as build system and
[googletest](https://github.com/google/googletest) as testing framework.

Coverage results
----------------
## Dependencies
This project uses the following tools to collect and generate code
unit testing coverage:
* lcov
* gcov
* genhtml

###  Install build dependencies on Debian

``` bash
    sudo apt-get install cmake lcov
```

Building
--------
Configure and build from the git top dir like so:

``` bash
    cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Coverage
    cd build
    make
    make coverage
```

Last step should run the tests and collect and generate code coverage data.
After a successful build you can find the results as html documents in
`build/coverage_results` if you open the `index.html` in your browser you will
see the entry point.

Maintained at https://github.com/Pelagicore/template-library

License and Copyright
---------------------
Copyright (C) 2017 Pelagicore AB

The source code in this repository is subject to the terms of the MPL-2.0 license, please see included "LICENSE" file for details.
License information for any other files is either explicitly stated or defaults to the MPL-2.0 license.
