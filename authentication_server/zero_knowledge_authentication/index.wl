FormFunction[
    {"LogInOptions" -> {
        "register", "show_user_information", "login"
    }},
    HTTPRedirect["zero_knowledge_authentication/" <> #LogInOptions <> ".wl"] &,
    AppearanceRules -> <|
        "Title" -> "Zero knowledge authentication demo",
        "Description" -> "In ZeroKnowledgeAuthentication no private secret is trusted to the server, instead a computationally hard problem that only the user knows the answer to is created and shared to be validated later."
    |>,
    PageTheme -> "Blue"
]
