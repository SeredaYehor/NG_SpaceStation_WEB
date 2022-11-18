from threading import Thread
from concurrent.futures import ThreadPoolExecutor
import bot
import asyncio

sockets = ["ws://localhost:8081", "ws://localhost:8083"]

def listenServer():
   listenThread = Thread(target=bot.startLoop, args=[sockets[1]])
   listenThread.start()
   listenThread.join()

def createBot():
   walkThread = Thread(target=bot.startLoop, args=[sockets[0]])
   walkThread.start()
   walkThread.join()

def startTest():
   workThread = Thread(target=createBot)
   listenThread = Thread(target=listenServer)
   workThread.start()
   listenThread.start()
   workThread.join()
   listenThread.join()

startTest()
print("End of testing")
