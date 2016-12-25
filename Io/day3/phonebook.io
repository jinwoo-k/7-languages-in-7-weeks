OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)

Map atPutNumber := method(arg0, arg1, 
	self atPut(
		arg0 asMutable removePrefix("\"") removeSuffix("\""),
		arg1
	)
)

s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println