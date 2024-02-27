FormFunction[
    {"AuthenticationMethod" -> {
        "classical_authentication", 
        "zero_knowledge_authentication"
    }},
    HTTPRedirect[#AuthenticationMethod] &,
    AppearanceRules -> <|
        "Title" -> "Welcome to ZeroKnowledgeAuthentication server",
        "Description" -> TemplateApply[
            "This is a demo of ArmandoCruz/ZeroKnowledgeProofs ``, running on a `` Kernel.",
            {
                Information[PacletObject["ArmandoCruz/ZeroKnowledgeProofs"], "Version"],
                $VersionNumber
            }
        ], 
        "SubmitLabel" -> "Start demo!"
    |>
]
