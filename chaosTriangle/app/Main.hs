module Main where
import Chaos1

import Graphics.Gloss

main :: IO()
main = 
    animate window background (\time -> Pictures [drawTriangle, drawPoints (take ((round ((time/60)*360))*100) (points [(0,0)] randomVertices))])


drawPoints :: [Point] -> Picture
drawPoints ps = pictures [color red (translate x y (circleSolid 3)) | (x,y) <- ps]
