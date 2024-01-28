apiFunction[params_Association] := Module[{},
    If[
        And[
            KeyExistsQ[Global`classicalUsers, params["Username"]],
            Global`classicalUsers[params["Username"]]["Password"] == params["Password"]
        ],
        "Welcome back, " <> params["Username"],
        "Wrong user or password! Introduce the correct credentials of an existing user."
    ]
];

APIFunction[
    {"Username" -> "String", "Password" -> "String"}, apiFunction, 
    "JSON"
]
