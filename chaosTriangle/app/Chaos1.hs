module Chaos1 where

import Data.List
import Graphics.Gloss
import System.Random

window :: Display
window = InWindow "Chaos Triangle" (1000, 1000) (500, 500)

background :: Color
background = black 

m :: Float
m = 3.0 

n :: Float
n = 1.0 

vertices :: [(Float, Float)]
vertices = [(0,400), (-346.4, -200), (346.4, -200)] -- 3
--vertices = [(200, 200), (-200, 200), (-200, -200), (200, -200)] -- 4
--vertices = [(-95.1056516295159 * 2,-29.289321881345173*2), (-58.77852522924732*2,80.90169943749474*2), (58.77852522924734*2,80.90169943749474*2), (95.1056516295159*2,-29.289321881345165*2), (0.0,-100*2)] -- 5
--vertices = [(0, 4*50), (3.46*50, 2*50), (3.45*50, -2.01*50), (-0.009*50, -3.99*50), (-3.49*50, -1.94*50), (-3.46*50, 2*50)] -- 6

triangle :: Picture
triangle = Polygon vertices

drawTriangle :: Picture
drawTriangle = Color white triangle

randomVertices ::  [(Float, Float)]
randomVertices  = map snd $ sortOn fst $ zip (randomVertices' 10000 (mkStdGen 42)) (cycle vertices)
--rand = take n $ [x | x <- 


randomVertices' :: Int -> StdGen -> [Int]
randomVertices' r gen = take r $ randoms gen

midPoint :: (Float, Float) ->  (Float, Float) -> (Float, Float)
midPoint (x1,y1) (x2, y2) = ((n * x1 + m * x2) / (m + n) ,  (n * y1 + m * y2) / (m + n)) 

points ::  [(Float, Float)] ->  [(Float,Float)] -> [(Float, Float)]
points finalPoints [] = finalPoints
points finalPoints randVert = points (finalPoints ++ [midPoint (last finalPoints) (head randVert)]) (tail randVert)

