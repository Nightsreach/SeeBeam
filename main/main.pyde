add_library('proscene')
from PlaneConstructor import ThreeDimensionalPlane
from PrismConstructor import RectangularPrism
from ReadFile import readFile

listOfSections = {}
downScaleResolution = 5
prismThickness = 25
fileName = ""

def calcBeamLength(lstPlanes):
    beamLength = 0
    for item in lstPlanes:
        for plVertex in item:
            if plVertex.x > beamLength:
                beamLength = plVertex.x
            
    return beamLength  

def createSections(listOfPlanes):
    counter = 0
    for item in listOfPlanes:
        #listOfSections[str(counter)] = ThreeDimensionalPlane(item[0]/downScaleResolution, item[1]/downScaleResolution, item[2]/downScaleResolution, item[3]/downScaleResolution, [255,0,0]).getPlane()
        listOfSections[str(counter)] = RectangularPrism(item[0]/downScaleResolution, item[1]/downScaleResolution, item[2]/downScaleResolution, item[3]/downScaleResolution, prismThickness/downScaleResolution, [255,0,0]).getPrism()
        counter += 1
    
def drawSections(offset):
    for key in listOfSections:
        shape(listOfSections[key], offset/downScaleResolution, 0)
        
def setUpScene():
    scene.setGridVisualHint(False)
    scene.setAxesVisualHint(False)
    
    if scene.is3D():
        scene.setCameraType(Camera.Type.PERSPECTIVE)
   
    scene.setRadius(400)
    scene.showAll()
    
def fileSelected(selection):
  if (selection == null):
    println("Window was closed or the user hit cancel.")
  else:
    println("User selected " + selection.getAbsolutePath())
    fileName = selection.getAbsolutePath()
  
def setup():
    global scene, offset
    
    
    selectInput("Select a file to process:", "selection")
    print(fileName +  "12#")

    
    #Manually set responsive display size in the dirtiest way. Taken 90% of height to account for top/bottom bars), I'll find a better way later
    size(displayWidth, int(displayHeight*0.9), P3D)
    
    scene = Scene(this)
    
    listOfPlanes = readFile(fileName)    
    createSections(listOfPlanes)
    
    setUpScene()
    
    beamLength = calcBeamLength(listOfPlanes)
    offset = -1 * (float(beamLength) / 2)
    
def draw():
    background(140)
    drawSections(offset)
     