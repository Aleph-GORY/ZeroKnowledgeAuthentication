serverData = If[
    Length[classicalUsers] > 0, 
    Column@Table[
        Column[{
            Style[user["Username"], Bold, Underlined, 20],
            "Registration Date: " <> user["registrationDate"],
            "Password: " <> user["Password"],
            Style[".", 20, White],
        }],
        {user, classicalUsers}
    ], 
    "There are no users registered in the authentication server"
]

body = Column[
    {
        "In classical authentication, a private secret is trusted to the server to be used as proof of authenticity.",
        Style[".", 20, White],
        Style["User's data stored in the server", "Section", 25, Alignment -> Center],
        serverData
    }
]

FormFunction[
    {},
    HTTPRedirect["/"] &,
    AppearanceRules -> <|
        "Title" -> "Classical authentication demo",
        "Description" -> body,
        "SubmitLabel" -> "Return"
    |>,
    PageTheme -> "Red"
]
