# sample-python-unittest-autograder

A simple Gradescope autograder for Python based on `unittest` test cases.

This repo is designed to be used in conjunction with the 
[link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo) tool.

The [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo)
allows you to easily link a Gradescope autograded assigment with a github repo.  You only have to create
the `Autograder.zip` file once; after that, you can make changes to the assignment simply by pushing them
to a github repo.

# Instructions

## Step 1: Clone this template

* Create a new empty private repo, e.g. with the name PRIVATE-cs8-s18-labxx-gs
* Clone the empty repo with `git clone <url>`
* Add a remote for this sample repo via: 
   > `git remote add template git@github.com:ucsb-gradescope-tools/sample-python-unittest-autograder.git`
* Pull from this sample repo via `git pull template master`
* Push to origin with `git push origin master`

## Step 2: Edit the template for your assignment

* In `grade.sh` edit the environment variable `EXPECTED_FILES` to list the files you expect the student to submit.  Only these
   will be copied from the student submission into the space where the assignment is graded.
   
   If you prefer *all* files to be copied in, edit the `grade.sh` script to copy all files from `/autograder/submission` into
   the target directory.
   
* Under the directory `tests`, edit the file given so that it contains the unit tests that you want to be used as a basis
   for the student's graded.   Use the decorators from the Gradescope 
   provided module 
   [autograder_utils](https://github.com/gradescope/gradescope-utils/tree/master/gradescope_utils/autograder_utils).  (Quick reference below.)
   
## Step 3: Create an `Autograder.zip` using the [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo) tool.
   
* Clone the [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo).
* In that repo, edit `env.sh` to point to your repo.  You don't need to commit that change.
* Run the script `./make_deploy_keys.sh` and upload your deploy key to the new repo you created for your assignment.
* Run the script `./make_autograder_zip.sh` and then upload the `Autograder.zip` to Gradescope.

You are now ready to test your autograded assignment.
   
# Decorator reference

As quick reference, here are examples of the decorators you can use on `unittest` tests:
   
* `@weight(5.0)` (parameter is of type float; represents number of points)
* `@tags("conditionals", "recursion")` (parameters are strings)
* `@visibility("after_due_date")` Legal values are explained [in Gradescope's documentation](https://gradescope-autograders.readthedocs.io/en/latest/specs/#controlling-test-case-visibility)
   * `"hidden"`
   * `"after_due_date"`
   * `"after_published"`
   * `"visible"` (default).  
   
   
