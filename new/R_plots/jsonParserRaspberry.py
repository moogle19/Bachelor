import json
import os
import time


json_data=open("./iphone5_raspberry_signal_strength.json").read()

outputfile = open('signal_Strength_raspberry.csv', 'w')

data = json.loads(json_data)

dataarray = data['data']

currentCellnumber = 1
currentDistance = 30

outputfile.write("distance;avg\n")


while currentDistance <= 400 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            outputfile.write(str(currentDistance))
            outputfile.write(";")
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 1 :
                    average = y['avgRSSI']
                    outputfile.write(str(average))
                    outputfile.write("\n")

    currentCellnumber += 1;
    currentDistance += 10;