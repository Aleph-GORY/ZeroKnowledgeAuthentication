classical_user = <|
    "user" -> None,
    "pass" -> None
|>;

pageFunction[choice_Association] := Module[{user, pass},
    user = choice["Username"];
    pass = choice["Password"];
    classical_user = <|
        "user" -> user,
        "pass" -> pass
    |>;
    Column[{
        Style["New user created", "Section"],
        "Registered new user",
        Style["Username:   " <> user, Italic],
        Style[
            "Password:   " <>
            StringTake[pass,1] <>
            StringRepeat["*", StringLength[pass]-2] <>
            StringTake[pass,-1], 
            Italic
        ],
        "In the authentication server."
    }]
];

FormPage[
    {"Username" -> "String", "Password" -> "String"}, 
    pageFunction, 
    AppearanceRules -> <|
        "Title" -> "Register new user",
        "Description" -> "In classical authentication, a private secret is trusted to the server to be used as proof of authenticity."
    |>,
    PageTheme -> "Red"
]
