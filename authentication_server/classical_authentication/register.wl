apiFunction[params_Association] := Module[{},
    If[KeyExistsQ[Global`classicalUsers, params["Username"]],
        "Username " <> params["Username"] <> " already exists.",
        Global`classicalUsers = Append[Global`classicalUsers,
            params["Username"] -> <|
            "Username" -> params["Username"],
            "Password" -> params["Password"],
            "registrationDate" -> DateString[]
        |>];
        "Successfully created new user " <> params["Username"] <> " in the authentication server."
    ]
];

APIFunction[
    {"Username" -> "String", "Password" -> "String"}, apiFunction, 
    "JSON"
]
