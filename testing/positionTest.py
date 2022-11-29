import unittest
from redis import Redis
import sys
from playerTest import Client

sys.path.append("../backend/SS_Position")

import redisWorker
import mapWorker

sys.path.remove("../backend/SS_Position")

class TestPosition(unittest.TestCase):

   def setUp(self):
      self.player = "test"
      redisWorker.redis = Redis("localhost", "6379")

   def test_checkPosition(self):
      self.assertEqual(redisWorker.checkPosition(self.player), [20, 20])

   def test_playerPosition(self):
      self.assertEqual(redisWorker.playerPosition(self.player), [20, 20])

   def test_updatePosition(self):
      redisWorker.updatePosition(self.player, 19, 19)
      self.assertEqual(redisWorker.checkPosition(self.player), [19, 19])

   def test_positionReachable(self):
      testData = [[22, 1, -1, 16, 'a', 10000],
                  [22, 1, -1, 20, 3, 1000], # y values
                  [True, False, False, False, False, False]] # expected results
      for i in range(len(testData[0])):
         with self.subTest(i=i):
            self.assertEqual(mapWorker.positionReachable(testData[0][i], testData[1][i]), testData[2][i])

   def test_interactDoor(self):
      testData = [[22, 1, -1, 16, 'a', 10000, 21], # x values
                  [22, 1, -1, 20, 3, 1000, 27], # y values
                  ['.', '*', '*', 'w', '500', '500', 'o']] # expected results
      for i in range(len(testData[0])):
         with self.subTest(i=i):
            self.assertTrue(testData[2][i] in mapWorker.interactDoor(testData[0][i], testData[1][i]))

   def test_position_and_listen_sockets(self):
      client = Client(["W", "A", "S", "D", "A", "A", "A", "A"])
      testData =  ['MOVE 20 19', 'MOVE 19 19', 'MOVE 19 20', 'MOVE 20 20',
                   'MOVE 19 20', 'MOVE 18 20', 'MOVE 17 20', '16 20 w']
      self.assertEqual(client.start(), testData)

if __name__ == '__main__':
   unittest.main()

