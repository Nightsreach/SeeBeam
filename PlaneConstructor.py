class ThreeDimensionalPlane:
    def __init__(self, topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex, rgb):
        self._topLeftVertex = topLeftVertex
        self._topRightVertex = topRightVertex
        self._bottomRightVertex = bottomRightVertex
        self._bottomLeftVertex = bottomLeftVertex
        
        fill(rgb[0], rgb[1], rgb[2])
        
        self._plane = self.createPlane()
       
    def createPlane(self):
       _tempShape = createShape()
       _tempShape.beginShape()
       _tempShape.vertex(self._topLeftVertex.x, self._topLeftVertex.y, self._topLeftVertex.z)
       _tempShape.vertex(self._topRightVertex.x, self._topRightVertex.y, self._topRightVertex.z)
       _tempShape.vertex(self._bottomRightVertex.x, self._bottomRightVertex.y, self._bottomRightVertex.z)
       _tempShape.vertex(self._bottomLeftVertex.x, self._bottomLeftVertex.y, self._bottomLeftVertex.z)
       _tempShape.endShape(CLOSE)
       return _tempShape
   
    def getPlane(self):
       return self._plane