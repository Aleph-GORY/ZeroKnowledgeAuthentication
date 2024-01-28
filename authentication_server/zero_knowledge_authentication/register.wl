apiFunction[params_Association] := Module[{},
    If[
        KeyExistsQ[Global`ZeroKnowledgeUsers, params["Username"]],
        "Username " <> params["Username"] <> " already exists.",
        Global`ZeroKnowledgeUsers = Append[Global`ZeroKnowledgeUsers,
            params["Username"] -> <|
            "Username" -> params["Username"],
            (* "PublicProblem" -> params["PublicProblem"], *)
            "PublicProblem" -> BinaryDeserialize@ByteArray@ImportString[params["PublicProblem"], "Byte"],
            "registrationDate" -> DateString[]
        |>];
        "Successfully created new user " <> params["Username"] <> " in the authentication server."
    ]
];

APIFunction[
    {"Username" -> "String", "PublicProblem" -> "String"}, apiFunction, 
    "JSON"
]
