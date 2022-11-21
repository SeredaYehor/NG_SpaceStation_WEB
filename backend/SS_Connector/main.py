import asyncio

import core
from threading import Thread

def start():
    socketThread = Thread(target=core.sockWorker)
    apiThread = Thread(target=core.apiWorker)

    socketThread.start()
    apiThread.start()

    socketThread.join()
    apiThread.join()

start()
