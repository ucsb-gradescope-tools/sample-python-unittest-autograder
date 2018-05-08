#!/usr/bin/env bash

# Set up autograder files

EXPECTED_FILES="labxx.py"

if [ "$#" -eq 1 ]; then
    SUBMISSION_SOURCE=`pwd`/$1
else
    SUBMISSION_SOURCE=/autograder/submission
fi

if [ -d $SUBMISSION_SOURCE ]; then  
   echo "Checking submission from $SUBMISSION_SOURCE"
else
   echo "ERROR: $SUBMISSION_SOURCE does not exist"
   exit
fi

copy_files_from_dir_if_it_exists () {
    if [ -d $1 ]; then
        cp -rv $1/* .
    fi
}

/bin/rm -rf MAKE-STUDENT-OUTPUT
mkdir -p MAKE-STUDENT-OUTPUT

cd MAKE-STUDENT-OUTPUT

copy_files_from_dir_if_it_exists ../EXECUTION-FILES
copy_files_from_dir_if_it_exists ../BUILD-FILES


for f in $EXPECTED_FILES; do
    if [ -f $SUBMISSION_SOURCE/$f ]; then
        cp -v $SUBMISSION_SOURCE/$f .
    else
        echo "WARNING: Expected file $f not found in $SUBMISSION_SOURCE"
    fi
done

rm -f results.json
python3 run_tests.py > results.json

if [ -d /autograder/results ]; then
    cp -v results.json /autograder/results
fi

cd ..
