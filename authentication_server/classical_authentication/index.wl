FormFunction[
    {"LogInOptions" -> {
        "register", "show_user_information", "login"
    }},
    HTTPRedirect["classical_authentication/" <> #LogInOptions <> ".wl"] &,
    AppearanceRules -> <|
        "Title" -> "Classical authentication demo",
        "Description" -> "In classical authentication, a private secret is trusted to the server to be used as proof of authenticity."
    |>,
    PageTheme -> "Red"
]
