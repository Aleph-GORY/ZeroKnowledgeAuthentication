serverData = If[
    Length[classicalUsers] > 0, 
    Column@Table[
        Style[user["Username"], Bold],
        (* Column[
            Style[user["Username"], Bold],
            user["Username"]
        ], *)
        {user, classicalUsers}
    ], 
    "There are no users registered in the authentication server"
]

body = Column[
    {
        "In classical authentication, a private secret is trusted to the server to be used as proof of authenticity.",
        Style[".", 20, White],
        Style["User's data stored in the server", "Section", 25],
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
