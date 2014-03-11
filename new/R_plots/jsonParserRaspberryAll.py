import json
import os
import time


json_data=open("./iphone5_raspberry_signal_strength.json").read()

outputfile = open('iphone5_raspberry_signal_strength-all.csv', 'w')

data = json.loads(json_data)

dataarray = data['data']

currentCellnumber = 1
currentDistance = 30

outputfile.write("distance;min;max;avg\n")

while currentCellnumber < 50 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 1 :
                    outputfile.write(str(currentDistance) + ';' + y['minRSSI'] + ';' + y['maxRSSI'] + ';' + y['avgRSSI'] + '\n')
        
    currentCellnumber += 1;
    currentDistance += 10;
