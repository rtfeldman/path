module Path exposing ((+/), Abs, Path, Rel, absolute, appendTo, hasInvalidCharacters, parse, relative, resolve)


type Path a
    = Path AbsOrRel (List String)


type Rel
    = Rel


type Abs
    = Abs


{-| Internal use only.
-}
type AbsOrRel
    = AbsPath
    | RelPath


type ParsedPath
    = Absolute (Path Abs)
    | Relative (Path Rel)
    | Invalid String


parse : String -> ParsedPath
parse str =
    Debug.crash "TODO"


appendTo : Path a -> Path Rel -> Path a
appendTo (Path absOrRel firstSegments) (Path _ secondSegments) =
    Path absOrRel (firstSegments ++ secondSegments)


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
    Path AbsPath []


relative : Path Rel
relative =
    Path RelPath []


(+/) : Path a -> String -> Path a
(+/) (Path absOrRel first) str =
    Path absOrRel (first ++ [ str ])


toString : Path a -> String
toString (Path absOrRel segments) =
    let
        {- TODO: this definitely needs to accept an OS-specific separator char of some sort,
           and possibly a root as well.
        -}
        separator =
            "/"

        str =
            String.join separator segments
    in
    case absOrRel of
        AbsPath ->
            separator ++ str

        RelPath ->
            str
