user = <|
    "username" -> None,
    "password" -> None
|>

demo = FormPage[
    {"LogIn options" -> {
        "register", "login", "show_user_information"
    }},
    pageFunction,
    AppearanceRules -> <|
        "Title" -> "Classical Authentication demo",
        "Description" -> "In classical authentication, a private secret is trusted to the server for comparison."
    |>,
    PageTheme -> "Red"
];

pageFunction[choice_Association] := Module[{page},
    page = choice["LogIn options"];
    Switch[page,"register",registerPage]
];

registerPage = Module[{input1 = "", input2 = ""},
    ExportForm[
        DynamicModule[{input1 = "", input2 = ""},
            Column[{
                "Input 1:",
                InputField[Dynamic[input1], String],
                "Input 2:",
                InputField[Dynamic[input2], String],
                Dynamic["Current Values: " <> input1 <> ", " <> input2]
            }]
        ], "HTMLFragment"]
];


demo