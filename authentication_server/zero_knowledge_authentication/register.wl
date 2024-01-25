pageFunction[choice_Association] := Module[{user, pass},
    user = choice["Username"];
    prob = choice["PublicProblem"];
    Global`zkUser = <|
        "username" -> user,
        "publicproblem" -> prob,
        "registrationDate" -> DateString[]
    |>;
    Column[{
        Style["New user created", "Section"],
        "Registered new user",
        Style["Username:   " <> user, Italic],
        Style["PublicProblem:   " <> prob, Italic],
        "the server has zero knowledge about the user's PrivateSSolution."
    }]
];

FormPage[
    {"Username" -> "String", "PublicProblem" -> "String"}, 
    pageFunction, 
    AppearanceRules -> <|
        "Title" -> "Register new user",
        "Description" -> "In ZeroKnowledgeAuthentication no private secret is trusted to the server, instead a computationally hard problem that only the user knows the answer to is created and shared to be validated later."
    |>,
    PageTheme -> "Blue"
]