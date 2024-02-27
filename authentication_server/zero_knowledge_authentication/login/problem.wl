apiFunction[params_Association] := Module[{},
    If[params["Reset"], 
        resetFunction[params["Username"]],
        problemFunction[params["Username"],params["CipherProblem"]]
    ]
];

resetFunction[username_] := Module[{},
    Global`ZeroKnowledgeUsers[username]["CipherProblem"] = {};
    username <> " cipher problem reset"
]

problemFunction[username_, cipherProblem_] := Module[
    {
        prob = Normal@ByteArray@ImportString[cipherProblem, "Byte"]
    },
    Global`ZeroKnowledgeUsers[username]["CipherProblem"] = Join[
        Global`ZeroKnowledgeUsers[username]["CipherProblem"],
        prob
    ];
    l = Length[Global`ZeroKnowledgeUsers[username]["CipherProblem"]];
    username <> " cipher problem size is " <> ToString[l]
]

APIFunction[
    {
        "Username" -> "String", 
        "CipherProblem" -> "String" -> Null,
        "Reset" -> "Boolean"  ->False
    }, apiFunction, 
    "JSON"
]
