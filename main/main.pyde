add_library('controlP5')
add_library('proscene')

from PlaneConstructor import ThreeDimensionalPlane
from PrismConstructor import RectangularPrism
from ReadFile import readFile

listOfSections = {}
downScaleResolution = 5
prismThickness = 25
fileName = "file1.csv"
drawRect = False

class ButtonListener(ControlListener):

    def controlEvent(self, e):   
        
        if e.getId() == 1:
        
            print e.getId()
            

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
   

def gui():    
    menuButton = cp5.addButton("Menu",10,width - 100,20,80,20).setId(1)
    cp5.setAutoDraw(False)
    cp5.getController("Menu").addListener(ButtonListener())

    

    
            
def sceneSetup():
    
    hint(DISABLE_DEPTH_TEST)
    
    currCameraMatrix = PMatrix3D(PGraphics.modelview)
    cameraZ = ((height/2.0) / tan(PI*60.0/360.0))
    perspective(PI/3.0, scene.camera().aspectRatio(), cameraZ/10.0, cameraZ*10.0);
    
    scene.setAxesVisualHint(False) 
    scene.setGridVisualHint(False)
    scene.setRadius(400)
    camera()
    
    cp5.draw()
    hint(ENABLE_DEPTH_TEST)
        
def setup():
    global scene, g3, cp5, currCameraMatrix, PGraphics, offset, e, menuButton
    
    size(int(displayWidth*0.7), int(displayHeight*0.7),OPENGL)
    scene = Scene(this)
    cp5 = ControlP5(this)
    PGraphics = createGraphics(400,400, P3D)
    
    gui()
        
    listOfPlanes = readFile(fileName)    
    createSections(listOfPlanes)
    beamLength = calcBeamLength(listOfPlanes)
    offset = -1 * (float(beamLength) / 2)
    
def draw():
    background(140)
    drawSections(offset)

    sceneSetup()