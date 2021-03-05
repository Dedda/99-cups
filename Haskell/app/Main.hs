module Main where

import Data.List

main :: IO ()
main = putStrLn (intercalate "\n" lines)
  where lines = concat . verses $ [99, 98..0]

verses :: [Int] -> [[String]]
verses = map verse

verse :: Int -> [String]
verse number = [onTheWall, takeDown]
  where onTheWall = cupsOnTheWallLine number
        takeDown = takeDownLine number

cupsOnTheWallLine :: Int -> String
cupsOnTheWallLine number = cups ++ onTheWall ++ " " ++ cups ++ "."
  where cups = cupsOfTea number

cupsOnTheWall :: Int -> String
cupsOnTheWall number = cups ++ onTheWall
  where cups = cupsOfTea number

cupsOfTea :: Int -> String
cupsOfTea number = cups ++ " of tea"
  where cups = cupsLine number

cupsLine :: Int -> String
cupsLine 0 = "No more cups"
cupsLine 1 = "One more cup"
cupsLine n = number ++ " cups"
  where number = show n

takeDownLine :: Int -> String
takeDownLine 0 = "Go to the store, buy some more. " ++ (cupsOnTheWall 99)
takeDownLine 1 = "Take it down and pass it around. " ++ (cupsOnTheWall 0)
takeDownLine n = "Take one down and pass it aroud. " ++ (cupsOnTheWall remaining)
  where remaining = n - 1

onTheWall :: String
onTheWall = " on the wall."