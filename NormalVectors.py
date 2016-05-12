class NormalVector:
    def __init__(self, topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex):
        self._topLeftVertex = topLeftVertex
        self._topRightVertex = topRightVertex
        self._bottomRightVertex = bottomRightVertex
        self._bottomLeftVertex = bottomLeftVertex
        
        self._normal = self.getNormalToPlane()
        
    def getNormalToPlane(self):
        vecOne = self._topRightVertex - self._topLeftVertex
        vecTwo = self._topRightVertex - self._bottomRightVertex
        normVector = vecOne.cross(vecTwo)
        return normVector.normalize()
    
    def getNormal(self):
        return self._normal
    
class DirectNormalOut:
    def __init__(self, topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex):
        _normalVector = NormalVector(topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex).getNormal()
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) > 0:
            _normalVector.x *= -1
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) < 0:
            _normalVector.x *= -1
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) > 0:
            _normalVector.x *= -1
            
        self._normal = _normalVector
    
    def getNormal(self):
        return self._normal
    
class DirectNormalIn:
    def __init__(self, topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex):
        _normalVector = NormalVector(topLeftVertex, topRightVertex, bottomRightVertex, bottomLeftVertex).getNormal()
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) < 0:
            _normalVector.x *= -1
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) > 0:
            _normalVector.x *= -1
        if (topLeftVertex.x + topRightVertex.x + bottomRightVertex.x + bottomLeftVertex.x) < 0:
            _normalVector.x *= -1
            
        self._normal = _normalVector
    
    def getNormal(self):
        return self._normal    
    
    