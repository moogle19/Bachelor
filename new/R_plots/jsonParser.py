import json
json_data=open("./iphone5_signal_strength.json").read()

outputfileAVG = open('AVGiPhone5.csv', 'w')
outputfileMin = open('MINiPhone5.csv', 'w')
outputfileMax = open('MAXiPhone5.csv', 'w')

data = json.loads(json_data)

dataarray = data['data']

currentCellnumber = 1
currentDistance = 30

outputfileAVG.write("distance;signalstrength\n")
outputfileMin.write("distance;signalstrength\n")
outputfileMax.write("distance;signalstrength\n")

while currentCellnumber < 50 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 1 :
                    outputfileAVG.write(str(currentDistance) + ';' + y['avgRSSI'] + '\n')
                    outputfileMin.write(str(currentDistance) + ';' + y['minRSSI'] + '\n')
                    outputfileMax.write(str(currentDistance) + ';' + y['maxRSSI'] + '\n')

    currentCellnumber += 1;
    currentDistance += 10;
        
