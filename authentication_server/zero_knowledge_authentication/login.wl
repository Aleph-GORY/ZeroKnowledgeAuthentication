pageFunction[choice_Association] := Module[{user, pass},
    user = choice["Username"];
    pass = choice["Password"];
    If[
        user == Global`classicalUser[["username"]] && pass == Global`classicalUser[["password"]],
        Column[{
            Style["Welcome back " <> user, "Section"],
            "Your user information is",
            Style["Username:   " <> user, Italic],
            Style["Password:   " <> pass, Italic]
        }],
        Column[{
            Style["Wrong user or password", "Section"],
            "Introduce the credentials of an existing user."
        }]
    ]
];

FormPage[
    {"Username" -> "String", "PublicWitness" -> "String"}, 
    pageFunction, 
    AppearanceRules -> <|
        "Title" -> "Login using your password",
        "Description" -> "In classical authentication, a private secret is trusted to the server to be used as proof of authenticity."
    |>,
    PageTheme -> "Blue"
]
