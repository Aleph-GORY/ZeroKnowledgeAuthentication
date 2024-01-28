serverData = If[
    Length[ZeroKnowledgeUsers] > 0, 
    Column@Table[
        Column[{
            Style[user["Username"], Bold, Underlined, 20],
            "Registration Date: " <> user["registrationDate"],
            "PublicProblem: ",
            ExportForm[user["PublicProblem"], "PNG"],
            Style[".", 20, White]
        }],
        {user, ZeroKnowledgeUsers}
    ], 
    "There are no users registered in the authentication server"
]

body = Column[
    {
        "In ZeroKnowledgeAuthentication no private secret is trusted to the server, instead a computationally hard problem that only the user knows the answer to is created and shared to be validated later.",
        Style[".", 20, White],
        Style["User's data stored in the server", "Section", 25, Alignment -> Center],
        serverData
    }
]

FormFunction[
    {},
    HTTPRedirect["/"] &,
    AppearanceRules -> <|
        "Title" -> "Zero knowledge authentication demo",
        "Description" -> body,
        "SubmitLabel" -> "Return"
    |>,
    PageTheme -> "Blue"
]
