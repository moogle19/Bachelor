import json
import os
import time


json_data=open("./iphone5_signal_strength.json").read()
json_data4s = open("./iphone4s_signal_strength.json").read()

outputfile = open('DataFingerprintsiPhone5.csv', 'w')
outputfile4s = open('DataFingerprintsiPhone4s.csv', 'w')

data = json.loads(json_data)
data4s = json.loads(json_data4s)

dataarray = data['data']
dataarray4s = data4s['data']

currentCellnumber = 1
currentDistance = 30

outputfile.write("distance")
outputfile4s.write("distance")

for i in range(100) :
    outputfile.write(";" + "fp" + str(i))
    outputfile4s.write(";" + "fp" + str(i))
    
outputfile.write("\n")
outputfile4s.write("\n")


while currentDistance <= 400 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            outputfile.write(str(currentDistance))
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 1 :
                    fingerprints = y['fingerprints']
                    
                    for z in fingerprints :
                        if z['rssi'] != 0 :
                            outputfile.write(';' + str(z['rssi']))
                    
                    #outputfile.write(str(currentDistance) + ';' + y['minRSSI'] + ';' + y['maxRSSI'] + ';' + y['avgRSSI'] + '\n')
            outputfile.write('\n')
                    
    for x4s in dataarray4s :
        if int(x4s['cellnumber']) == currentCellnumber :
            print currentCellnumber
            outputfile4s.write(str(currentDistance))
            beacons4s = x4s['beacons']
        
            for y4s in beacons4s :
                if int(y4s['minor']) == 1 :
                    print '-'
                    fingerprints4s = y4s['fingerprints']
                    
                    print len(fingerprints4s)
                    counter = 0
                    for z4s in fingerprints4s :
                        if counter >= 100 :
                            break;
                        if z4s['rssi'] != 0 :
                            outputfile4s.write(';' + str(z4s['rssi']))
                            counter += 1
                    
                    #outputfile.write(str(currentDistance) + ';' + y['minRSSI'] + ';' + y['maxRSSI'] + ';' + y['avgRSSI'] + '\n')
            outputfile4s.write('\n')
        
    currentCellnumber += 1;
    currentDistance += 10;