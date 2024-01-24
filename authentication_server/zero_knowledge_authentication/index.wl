AskFunction[Module[{bracket, tax, income},
    AskDisplay[Column[{
        Style["Zero knowledge authentication demo", "Title"],
        Style["In ZeroKnowledgeAuthentication, no private secret is trusted to the server, instead a computationally hard problem that only the user knows the answer to is created and shared to be validated later.", 20],
    }]];
    Ask[{
        {"username", "Enter a Username"} -> "String",
        {"password", "Enter a Password"} -> "String"
    }];
    AskTemplateDisplay[Column[{
        Style["User information stored in the server", "Section"],
        Style["Username: " <> username, 20],
        Style["Password: " <> password, 20],
    }]]
]]
