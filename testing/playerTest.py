import websocket # websocket-client module !!!
import time
#import data
from threading import Thread
from concurrent.futures import ThreadPoolExecutor

class Client():

   def __init__(self, input):
      self.listen_socket = websocket.WebSocket()
      self.listen_socket.connect("ws://ss_connector:8083", ping_interval=None)
      self.position_socket = websocket.WebSocket()
      self.position_socket.connect("ws://test:8081", ping_interval=None)
      self.testData = input

   def start(self):
      result = []
      self.position_socket.send("ID")
      init_answer = self.position_socket.recv()
      print(init_answer)
      time.sleep(1)
      for i in range(len(self.testData)):
         message = self.position_socket.send("MOVE " + self.testData[i])
         answer = self.listen_socket.recv()
         result.append(answer.split(' ', 1)[1]) #remove ip from answer
         time.sleep(1)
      return result


