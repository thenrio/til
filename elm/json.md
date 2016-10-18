JSON support in core library
============================
start with [official documentation](https://guide.elm-lang.org/interop/json.html)

so the basics is to build a decoder value that will build a type from a string
then compose.

this is a pain with alias type :)

that is not that a big deal... and still __boilerplate__.
In contrast js and even backend languages do not have such a step.

refinement
==========
http://package.elm-lang.org/packages/NoRedInk/elm-decode-pipeline/latest


```elm
type alias User =
  { id : Int
  , email : Maybe String
  , name : String
  , percentExcited : Float
  }

userDecoder : Decoder User
userDecoder =
  decode User
    |> required "id" int
    |> required "email" (nullable string) -- `null` decodes to `Nothing`
    |> optional "name" string "(fallback if name is `null` or not present)"
    |> hardcoded 1.0
```

related
=======

* [tutorial](https://gist.github.com/yang-wei/0a1cea1194a244aa9be6) though outdated elm
and points to interesting discussion [Is a decoder the right level of abstraction for parsing JSON?](https://groups.google.com/forum/#!msg/elm-discuss/XW-SRfbzQ94/aKufhX0LBgAJ)
