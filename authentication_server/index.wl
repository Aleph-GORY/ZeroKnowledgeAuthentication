classicalUser = <||>;

FormFunction[
    {"AuthenticationMethod" -> {
        "classical_authentication", 
        "zero_knowledge_authentication"
    }},
    HTTPRedirect[#AuthenticationMethod] &,
    AppearanceRules -> <|
        "Title" -> "Welcome to ZeroKnowledgeAuthentication server",
        "Description" -> TemplateApply["This is a demo of ArmandoCruz/ZeroKnowledgeProofs paclet, running on a `` Kernel.", $VersionNumber], 
        "SubmitLabel" -> "Start demo!"
    |>
]