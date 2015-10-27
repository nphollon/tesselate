module Main where

import Color
import Graphics.Collage as Collage

import Frieze

main =
  let
    polygon =
      Collage.polygon
             [ (-10, -10)
             , (-15, -10)
             , (-15, 30)
             , (15, 25)
             , (-10, 20)
             ]
        |> Collage.filled Color.blue

    drawFrieze y f =
      Frieze.tile f polygon
        |> Collage.moveY y
           
    friezes =
      [ Frieze.p2 31
      , Frieze.p1 31
      ]

    offsets =
      [ 150
      , 200
      ]
  in
    friezes
      |> List.map2 drawFrieze offsets
      |> Collage.collage 900 500
