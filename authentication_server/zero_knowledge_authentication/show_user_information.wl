FormFunction[
    {},
    HTTPRedirect["/zero_knowledge_authentication"] &,
    AppearanceRules -> <|
        "Title" -> "User's data stored in the server",
        "Description" -> ExportForm[zkProof, "PNG"], 
        "SubmitLabel" -> "Back"
    |>
]

