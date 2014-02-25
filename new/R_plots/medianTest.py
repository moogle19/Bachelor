import json

json_data=open("./iphone5_signal_strength.json").read()

outputfile = open('MedianVSMittelwert.txt', 'w')

data = json.loads(json_data)

dataarray= data['data']

currentCellnumber = 1

while currentCellnumber <= 40 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            beacons = x['beacons']
            
            for y in beacons :
                if int(y['minor']) == 1 :
                    fingerprints = y['fingerprints']
                    printarray = []
                    for rssi in fingerprints :
                        if rssi['rssi'] != 0 :
                            printarray.append(int(rssi['rssi']))
                    
                    printarray.sort()
                    length = len(printarray)
                    position = 0
                    
                    if length % 2 :
                        position = (length - 1) / 2
                    else :
                        position = length / 2
                        
                    median = printarray.pop(position)
                    
                    summe = 0
                    counter = 0
                    for value in printarray :
                        summe += value
                        counter += 1
                    
                    avg = summe / counter
                    print "Median: " + str(median) + " Avg: " + str(avg)
                    
                    
    currentCellnumber += 1;