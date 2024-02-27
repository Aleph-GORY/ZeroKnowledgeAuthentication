verifyFunction[params_Association] := Module[
    {
        username = params["Username"],
        response = params["Response"]
    },
    user = Global`ZeroKnowledgeUsers[username];

    (* If[
        VerifyZeroKnowledgeProof[
            user["PublicProblem"],
            user["CipherProblem"],
            "query" -> user["Query"],
            "response" -> response
        ], *)
        "Welcome back, " <> username
        (* "Zero Knowledge verification failed! Introduce the correct credentials of an existing user."
    ] *)
]

APIFunction[
    {
        "Username" -> "String",
        "Response" -> "String"
    }, verifyFunction, 
    "JSON"
]
