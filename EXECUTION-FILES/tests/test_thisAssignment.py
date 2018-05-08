# NOTE: This file MUST be named test_SOMETHING, i.e. not SOMETHING_test
# And the functions in it must start with test_SOMETHING not SOMETHING_test
# if you want them to be run as tests (via auto-discovery)

import unittest
import pytest
from gradescope_utils.autograder_utils.decorators import weight,visibility

from labxx import *

class TestConversion(unittest.TestCase):

  def setUp(self):
    pass

  @weight(10)
  def test_addEm_1(self):
    self.assertEqual(addEm(2,4),6)

  # This one is hidden only until after the due date
    
  @weight(20)
  @visibility('after_due_date')
  def test_addEm_2(self):
    self.assertEqual(addEm(3,1),4)


  # This one is hidden forever
  # Students will only see a point total of the visible tests they got correct
  
  @weight(20)
  @visibility('hidden')
  def test_addEm_2(self):
    self.assertEqual(addEm(3,1),4)
    
