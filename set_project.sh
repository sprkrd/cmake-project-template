#!/bin/bash

name=$1
pty_name=$2
author=$3

CamelCase=`echo $name | sed -r 's/(^|_)([a-z])/\U\2/g'`
UPPER_CASE=`echo $name | sed -r 's/([a-z])/\U\1/g'`

if [ -z "$name" ]
then
  echo "Missing name. Usage: ./set_project name \"Pretty name\" \"Author\""
  exit 1
fi

if [ -z "$pty_name" ]
then
  echo "Missing pretty name. Usage: ./set_project name \"Pretty name\" \"Author\""
  exit 1
fi

if [ -z "$author" ]
then
  echo "Missing author. Usage: ./set_project name \"Pretty name\" \"Author\""
  exit 1
fi

find . -type f -print0 | xargs -0 sed -i "s/project_name_here/$name/g"
find . -type f -print0 | xargs -0 sed -i "s/ProjectNameHere/$CamelCase/g"
find . -type f -print0 | xargs -0 sed -i "s/<year>/`date +%Y`/g"
find . -type f -print0 | xargs -0 sed -i "s/<author>/$author/g"
sed -i "s/PROJECT_NAME_HERE/$UPPER_CASE/g" include/project_name_here/project_name_here.h

find . -type f -print0 | xargs -0 sed -i "s/CMake project template/$pty_name/g"

mv include/project_name_here/project_name_here.h include/project_name_here/$name.h
mv include/project_name_here include/$name
mv src/examples/project_name_here_example.cpp src/examples/${name}_example.cpp
mv "test/project_name_here_test.cpp" "test/${name}_test.cpp"
mv src/project_name_here.cpp src/$name.cpp
mv Findproject_name_here.cmake Find$name.cmake

mv README_template.md README.md
rm -rf .git
rm set_project.sh

