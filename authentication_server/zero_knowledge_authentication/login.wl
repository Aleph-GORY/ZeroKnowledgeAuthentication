apiFunction[params_Association] := Module[{},
    If[
        params["Response"] === Null,
        queryFunction[params["Username"],params["CipherProblem"]],
        verifyFunction[params["Username"],params["Response"]]
    ]
];

queryFunction[username_, cipherProblem_] := Module[{},
    query = GenerateZeroKnowledgeQuery[cipherProblem];
    Global`ZeroKnowledgeUsers[username] = Append[
        Global`ZeroKnowledgeUsers[username],
        "Query" -> query
    ];
    ExportString[BinarySerialize[query], "Byte"]
]

verifyFunction[username_, response_] := Module[{},
    user = Global`ZeroKnowledgeUsers[username];
    If[
        VerifyZeroKnowledgeProof[
            user["PublicProblem"],
            user["CipherProblem"],
            "query" -> user["Query"],
            "response" -> response
        ],
        "Welcome back, " <> username,
        "Zero Knowledge verification failed! Introduce the correct credentials of an existing user."
    ]
]

APIFunction[
    {
        "Username" -> "String", 
        "CipherProblem" -> "String" -> Null,
        "Response" -> "String" -> Null
    }, apiFunction, 
    "JSON"
]
