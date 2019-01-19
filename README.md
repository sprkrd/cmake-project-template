# CMake project template

Project skeleton that incorporates a ready-to-go CMake structure for
libraries and applications in C++. CMake's minimum version is: 3.0. CMakeLists
is tuned for C++11.

By default,
it uses the GPL 3.0 license for generating the new projects.

The basic project is structured as follows:

```
project
├── bin
├── build
├── CMakeLists.txt
├── doc
│   ├── doxygen.conf
│   ├── doxygen_project_name.conf
│   └── main.dox
├── Findproject_name_here.cmake
├── GPL-3.0.txt
├── gplv3.png
├── include
│   └── project_name_here
│       └── project_name_here.h
├── lib
├── LICENSE.txt
├── README.md
├── src
│   ├── CMakeLists.txt
│   ├── examples
│   │   ├── CMakeLists.txt
│   │   └── project_name_here_example.cpp
│   └── project_name_here.cpp
└── test
    ├── CMakeLists.txt
    └── project_name_here_test.cpp
```

## Usage:

Just execute the set_project.sh script. It receives as arguments the
slugified name of the project, preferably in snake_case form; the
name of the project in "pretty form" and the name of the author.
An usage example would be:

```
./set_project nice_things "All the nice things" "John Doe"
```

The script will erase the template's .git folder (so it's ready for
being initialized for another repository), and substitute all the
occurrences of "project_name_here" and other placeholders by the
information supplied as the script's arguments.

The project can be built right away:

```
mkdir build
cd build
cmake .. -DBUILD_TESTING=ON
make -j4
```

Also, one can execute `make doc` for generating the Doxygen documentation,
and `make test` to execute all the tests.

## Acknowledgements

This template has been adapted from the one provided by [S.
Hernández](http://www.iri.upc.edu/staff/shernand),
from the Institut de Robòtica i Informàtica Industrial.

[gplv3logo]: gplv3.png "GPL 3.0 logo"

