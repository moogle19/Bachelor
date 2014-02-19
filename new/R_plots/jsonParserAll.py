import json
import os
import time


json_data=open("./iphone5_signal_strength.json").read()
json_data4s = open("./iphone4s_signal_strength.json").read()

outputfile = open('DataiPhone5.csv', 'w')
outputfile4s = open('DataiPhone4s.csv', 'w')

data = json.loads(json_data)
data4s = json.loads(json_data4s)

dataarray = data['data']
dataarray4s = data4s['data']

currentCellnumber = 1
currentDistance = 30

outputfile.write("distance;min_signalstrength;max_signalstrength;avg_signalstrength\n")
outputfile4s.write("distance;min_signalstrength;max_signalstrength;avg_signalstrength\n")

while currentCellnumber < 50 :
    for x in dataarray :
        if int(x['cellnumber']) == currentCellnumber :
            beacons = x['beacons']
        
            for y in beacons :
                if int(y['minor']) == 1 :
                    outputfile.write(str(currentDistance) + ';' + y['minRSSI'] + ';' + y['maxRSSI'] + ';' + y['avgRSSI'] + '\n')
                    
    for x4s in dataarray4s :
        if int(x4s['cellnumber']) == currentCellnumber :
            beacons = x4s['beacons']
        
            for y4s in beacons :
                if int(y4s['minor']) == 1 :
                    outputfile4s.write(str(currentDistance) + ';' + y4s['minRSSI'] + ';' + y4s['maxRSSI'] + ';' + y4s['avgRSSI'] + '\n')
        
    currentCellnumber += 1;
    currentDistance += 10;

time.sleep(1)
        
os.system("R CMD BATCH ~/Documents/Uni/Bachelorarbeit/new/R_plots/plot_iphone_5_signal_strength.r")
os.system("R CMD BATCH ~/Documents/Uni/Bachelorarbeit/new/R_plots/plot_iphone_4s_signal_strength.r")