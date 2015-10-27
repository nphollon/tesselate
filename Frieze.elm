module Frieze where

{-| Tesselate a graphic in one dimension. The frieze group specifies how to
tile the graphic.
-}

import Array
import Graphics.Collage as Collage exposing (Form)
import Transform2D exposing (Transform2D)

{-| Tile a form according to the symmetry rule indicated by the frieze group.
-}
tile : FriezeStyle -> Form -> Form
tile style cell =
  let
    draw i =
      shift i (symbol i)

    reflected =
      list cell
        |> Collage.groupTransform (Transform2D.scaleX -1)
        |> list
        |> Collage.group

    symbol i =
      if | not style.flip -> cell
         | i % 2 == 1 -> reflected
         | otherwise -> cell
      
    shift i =
      Collage.moveX (toFloat i * style.xShift)

  in
    Array.initialize 10 draw
      |> Array.toList
      |> Collage.group


p1 : Float -> FriezeStyle
p1 xShift =
  { xShift = xShift
  , flip = False
  }


p2 : Float -> FriezeStyle
p2 xShift =
  { xShift = xShift
  , flip = True
  }

     
type alias FriezeStyle =
  { xShift : Float
  , flip : Bool
  }


list : a -> List a
list a = [ a ]
