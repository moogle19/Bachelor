import json
import os
import time


json_data=open("./iphone5_signalstrength_body_minor6.json").read()

outputfile = open('DataFingerprintsiPhone5Body.csv', 'w')

data = json.loads(json_data)

dataarray = data['data']

outputfile.write("Orientation");

for i in range(100) :
    outputfile.write(";" + "fp" + str(i))
    
outputfile.write("\n")

currentCellnumber = 1


while currentCellnumber <= 2 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            if(currentCellnumber == 1) :
                outputfile.write("toBeacon")
            else :
                outputfile.write("awayFromBeacon")
            
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 6 :
                    fingerprints = y['fingerprints']
                    
                    for z in fingerprints :
                        if z['rssi'] != 0 :
                            outputfile.write(';' + str(z['rssi']))
                    
                    #outputfile.write(str(currentDistance) + ';' + y['minRSSI'] + ';' + y['maxRSSI'] + ';' + y['avgRSSI'] + '\n')
            outputfile.write('\n')
        
    currentCellnumber += 1;