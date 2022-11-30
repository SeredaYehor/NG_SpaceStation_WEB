import unittest
import test

class TestMapLoader(unittest.TestCase):

   def test_map(self):
      self.assertEqual(test.readLocalMap(), test.getMap())

   def test_getElem(self):
      testData = [[0, 1, -1, 16, 'a', 10000, 21], # x values
                  [0, 1, -1, 20, 3, 1000, 27], # y values
                  ['*', '*', '', 'w', '500', '500', 'c']] # expected results
      for i in range(len(testData[0])):
         with self.subTest(i=i):
            self.assertTrue(testData[2][i] in test.getElem(testData[0][i], testData[1][i]))

   def test_setElem(self):
      testData = [[0, 1, -1, 16, 'a', 10000], # x values
                  [0, 1, -1, 20, 3, 1000], # y values
                  ['!', '!', '!', '!', '!', '!'], # elem values
                  ['!', '!', '!', '!', '500', '500']] # expected results
      for i in range(len(testData[0])):
         with self.subTest(i=i):
            self.assertTrue(testData[3][i] in test.setElem(testData[0][i], testData[1][i], testData[2][i]))

if __name__ == '__main__':
    unittest.main()
