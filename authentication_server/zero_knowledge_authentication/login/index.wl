verifyFunction[params_Association] := Module[
    {
        username = params["Username"],
        response = BinaryDeserialize@ByteArray@ImportString[
            params["Response"], "Byte"
        ]
    },
    user = Global`ZeroKnowledgeUsers[username];
    If[
        And@@VerifyZeroKnowledgeProof[
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
        "Response" -> "String"
    }, verifyFunction, 
    "JSON"
]
