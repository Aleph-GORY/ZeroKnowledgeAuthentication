Delayed[{classicalUser}, "JSON"];

(* APIFunction[{"user" -> "Association" -> classicalUser}, #user &] *)

APIFunction["user" -> Association -> classicalUser, Identity, "JSON"]
