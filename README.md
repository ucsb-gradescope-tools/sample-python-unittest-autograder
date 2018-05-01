# sample-python-unittest-autograder

A simple Gradescope autograder for Python based on `unittest` test cases.

This repo is designed to be used in conjunction with the 
[link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo) tool.

The [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo)
allows you to easily link a Gradescope autograded assigment with a github repo.  You only have to create
the `Autograder.zip` file once; after that, you can make changes to the assignment simply by pushing them
to a github repo.

# Instructions

* In `grade.sh` edit the environment variable `EXPECTED_FILES` to list the files you expect the student to submit.  Only these
   will be copied from the student submission into the space where the assignment is graded.
   
   If you prefer *all* files to be copied in, edit the `grade.sh` script to copy all files from `/autograder/submission` into
   the target directory.
   
* Under the directory `tests`, edit the file given so that it contains the unit tests that you want to be used as a basis
   for the student's graded.   Use the decorators from the Gradescope 
   provided module 
   [autograder_utils](https://github.com/gradescope/gradescope-utils/tree/master/gradescope_utils/autograder_utils).  As a 
   quick reference, here are examples of those decorators:
   namely:
   
   * `@weight(5.0)` (parameter is of type float; represents number of points)
   * `@tags("conditionals", "recursion")` (parameters are strings)
   * `@visibility("after_due_date")` (legal values are `"hidden"`, `"after_due_date"`, `"after_published"`
      and `"visible"` (default).  They are explained further
      [in Gradescope's documentation](https://gradescope-autograders.readthedocs.io/en/latest/specs/#controlling-test-case-visibility)

   
