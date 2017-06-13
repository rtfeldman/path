module Path exposing ((+/), Abs, Path, Rel, absolute, appendTo, hasInvalidCharacters, parse, relative, resolve)


type Path a
    = Path (List String)


type Rel
    = Rel


type Abs
    = Abs


type ParsedPath
    = Absolute (Path Abs)
    | Relative (Path Rel)
    | Invalid String


parse : String -> ParsedPath
parse str =
    Debug.crash "TODO"


appendTo : Path a -> Path Rel -> Path a
appendTo (Path firstSegments) (Path secondSegments) =
    Path (firstSegments ++ secondSegments)


hasInvalidCharacters : Path a -> Bool
hasInvalidCharacters path =
    -- If any path segments include a separator character...invalid!
    -- This is because we store whether it's absolute or not as part of the type,
    -- not as one of the path strings, and relative paths should never contain
    -- a preceding / anyway.
    Debug.crash "TODO"


{-| Resolve all the .. segments. Results in an error if any segments contain
invalid characters, or if it would try to resolve to a parent of the root.
-}
resolve : Path Abs -> Result String (Path Abs)
resolve path =
    Debug.crash "TODO"


absolute : Path Abs
absolute =
    Path []


relative : Path Rel
relative =
    Path []


(+/) : Path a -> String -> Path a
(+/) (Path first) str =
    Path (first ++ [ str ])
