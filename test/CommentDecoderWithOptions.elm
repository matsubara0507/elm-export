module CommentDecoderWithOptions exposing (..)

import CommentType exposing (..)
import Dict
import Exts.Json.Decode exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Tuple


decodeComment : Decoder Comment
decodeComment =
    Json.Decode.succeed Comment
        |> required "commentPostId" int
        |> required "commentText" string
        |> required "commentMainCategories" (map2 Tuple.pair (index 0 string) (index 1 string))
        |> required "commentPublished" bool
        |> required "commentCreated" decodeDate
        |> required "commentTags" (map Dict.fromList (list (map2 Tuple.pair (index 0 string) (index 1 int))))
