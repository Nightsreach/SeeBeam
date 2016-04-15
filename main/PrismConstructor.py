from NormalVectors import *
from PlaneConstructor import *

class RectangularPrism:
    def __init__(self, topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex, depth, rgb): 
        self._bfTopLeftVertex = topLeftVertex
        self._bfTopRightVertex = topRightVertex
        self._bfBottomRightVertex = bottomRightVertex
        self._bfBottomLeftVertex = bottomLeftVertex
        self._depth = depth
        self._rgb = rgb
        
        self._calcTopFaceVertices()
        
        self._prism = self.createPrism()
        
    def _calcTopFaceVertices(self):
       DirectionalNormal = DirectNormalOut(self._bfTopLeftVertex, self._bfTopRightVertex, self._bfBottomRightVertex, self._bfBottomLeftVertex).getNormal()
       
       self._tfTopLeftVertex = self._bfTopLeftVertex + (DirectionalNormal * self._depth)
       self._tfTopRightVertex = self._bfTopRightVertex + (DirectionalNormal * self._depth)
       self._tfBottomRightVertex = self._bfBottomRightVertex + (DirectionalNormal * self._depth)
       self._tfBottomLeftVertex = self._bfBottomLeftVertex + (DirectionalNormal * self._depth)
       
    def createPrism(self):
       _tempShape = createShape(GROUP)
       _bottomFace = ThreeDimensionalPlane(self._bfTopLeftVertex, self._bfTopRightVertex, self._bfBottomRightVertex, self._bfBottomLeftVertex, self._rgb).getPlane()
       _topFace = ThreeDimensionalPlane(self._tfTopLeftVertex, self._tfTopRightVertex, self._tfBottomRightVertex, self._tfBottomLeftVertex, self._rgb).getPlane()
       _frontFace = ThreeDimensionalPlane(self._bfTopLeftVertex, self._bfTopRightVertex, self._tfTopRightVertex, self._tfTopLeftVertex, self._rgb).getPlane()
       _backFace = ThreeDimensionalPlane(self._bfBottomRightVertex, self._bfBottomLeftVertex, self._tfBottomLeftVertex, self._tfBottomRightVertex, self._rgb).getPlane()
       _leftFace = ThreeDimensionalPlane(self._bfTopLeftVertex, self._tfTopLeftVertex, self._tfBottomLeftVertex, self._bfBottomLeftVertex, self._rgb).getPlane()
       _rightFace = ThreeDimensionalPlane(self._bfTopRightVertex, self._tfTopRightVertex, self._tfBottomRightVertex, self._bfBottomRightVertex, self._rgb).getPlane()
       
       _tempShape.addChild(_bottomFace)
       _tempShape.addChild(_topFace)
       _tempShape.addChild(_frontFace)
       _tempShape.addChild(_backFace)
       _tempShape.addChild(_leftFace)
       _tempShape.addChild(_rightFace)
       return _tempShape
   
    def getPrism(self):
        return self._prism