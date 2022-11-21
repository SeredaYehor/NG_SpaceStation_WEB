import redis
import os

from logWorker import configureLogger

redisLog = configureLogger(name="REDIS")

redis = redis.Redis(
    host = os.getenv("redisHost", default="redis"),
    port = os.getenv("redisPort", default="6379")
)

def playerPosition(player):
    return checkPosition(player)

def checkPosition(player):
    item = redis.get(player)
    if not redis.exists(player):
        redis.set(player, "20 20")
    item = redis.get(player)
    x,y = str(item.decode("utf8")).split(" ")
    return [ int(x), int(y) ]

def updatePosition(player, x, y):
    redis.set(player, str(x) + " " + str(y))
