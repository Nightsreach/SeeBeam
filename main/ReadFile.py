import csv

def readFile(filename):   
    with open(filename, "rb") as openfile:
        csvfile = csv.reader(openfile, delimiter = ',', quotechar = '|')
        tmpBeamList = []
        
        for row in csvfile:
            tmpPlaneList = []
            if len(row) > 1:   
                tmpPlaneList.append(PVector(float(row[0]), float(row[1]), float(row[2])))
                tmpPlaneList.append(PVector(float(row[3]), float(row[4]), float(row[5])))
                tmpPlaneList.append(PVector(float(row[6]), float(row[7]), float(row[8])))
                tmpPlaneList.append(PVector(float(row[9]), float(row[10]), float(row[11])))
            
                tmpBeamList.append(tmpPlaneList)
            
        return tmpBeamList        
       