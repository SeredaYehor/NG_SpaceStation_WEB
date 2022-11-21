import requests

url = "http://localhost:8082"

def getMap():
   return parseMap(processRequest("/map"))

def getElem(x, y):
   return processRequest(f"/getElem?x={x}&y={y}")

def setElem(elem, x, y):
   return processRequest(f"/setElem?x={x}&y={y}&{elem}")

def processRequest(uri):
   responce = requests.get(url + uri)
   return responce.text

def parseMap(map):
   for char in [',', '[', ']', '\"', ' ']:
       map = map.replace(char, '')
   return map.replace("\\n",'\n')

def readLocalMap():
   file = open("map.txt", "r")
   map = file.read()
   file.close()
   return map
