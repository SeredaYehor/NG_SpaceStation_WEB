import redisWorker
import mapWorker
import requests
import os
from logWorker import configureLogger

coreLog = configureLogger(name="CORE")
step = 1
def sendToAll(message):
    response = requests.get(os.getenv("ConnectorUrl",
                            default="http://ss_connector:8084/send?msg=" + str(message)))
    if str(response.status_code) != "200":
        coreLog.error(message + ": " + str(response.status_code))

def processMessage(player, message):
    if "MOVE" in message:
        cmd, dir = message.split(" ")
        processMovement(player, dir)

def processMovement(player, key):
    baseX,baseY = redisWorker.playerPosition(player)
    x,y = baseX,baseY
    match (key):
        case "W": y -= step
        case "S": y += step
        case "A": x -= step
        case "D": x += step

    resultPosition = str(x) + " " + str(y)

    if mapWorker.positionReachable(x,y):
        redisWorker.updatePosition(player,x,y)
        sendToAll(player + " MOVE " + str(x) + " " + str(y))
    else:
        object = mapWorker.interactDoor(x,y)
        sendToAll("UPD " + resultPosition + " " + object)
