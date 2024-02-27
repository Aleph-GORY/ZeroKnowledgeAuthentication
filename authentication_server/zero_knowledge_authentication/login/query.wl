queryFunction[params_Association] := Module[
    {username=params["Username"]},
    cipherProblem = Uncompress@BinaryDeserialize@ByteArray[
        Global`ZeroKnowledgeUsers[username]["CipherProblem"]
    ];
    query = GenerateZeroKnowledgeQuery[cipherProblem];
    Global`ZeroKnowledgeUsers[username]["CipherProblem"] = cipherProblem;
    Global`ZeroKnowledgeUsers[username]["Query"] = query;
    ExportString[BinarySerialize[query], "Byte"]
]

APIFunction[
    {
        "Username" -> "String"
    }, queryFunction, 
    "JSON"
]
