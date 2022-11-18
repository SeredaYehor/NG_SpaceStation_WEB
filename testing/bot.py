import asyncio
import websockets
import random
import time
import data
import sys

async def handler(websocket, input):
     await websocket.send("ID")
     init_answer = await websocket.recv()
     print(init_answer)
     time.sleep(1)
     for i in range(len(input)):
         message = await websocket.send("MOVE " + input[i])
         time.sleep(1)

async def listener(websocket, output):
     for i in range(len(output)):
        answer = await websocket.recv()
        print("Test case " + str(i+1) + ":" )
        if output[i] in answer:
           print("Passed")
        else:
           print("Failed")

async def connectSocket(url):
     try:
        async with websockets.connect(url, ping_interval=None) as ws:
             if "8081" in url:
                 await handler(ws, data.input)
             else:
                 await listener(ws, data.output)
     except websockets.ConnectionClosed as ex:
        print("Error ", ex)
        return 1

def startLoop(url):
     loop = asyncio.new_event_loop()
     asyncio.set_event_loop(loop)
     loop.run_until_complete(connectSocket(url))

