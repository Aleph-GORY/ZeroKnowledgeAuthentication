verifyFunction[params_Association] := Module[
    {
        username = params["Username"],
        response = Uncompress@BinaryDeserialize@ByteArray@ImportString[
            params["Response"], "Byte"
        ]
    },
    user = Global`ZeroKnowledgeUsers[username];
    (* {
        ExportForm[response, "PNG"],
        ExportForm[user["PublicProblem"], "PNG"], *)
    VerifyZeroKnowledgeProof[
        user["PublicProblem"],
        user["CipherProblem"],
        "query" -> user["Query"],
        "response" -> response
    ]
]

APIFunction[
    {
        "Username" -> "String",
        "Response" -> "String"
    }, verifyFunction, 
    "JSON"
]
