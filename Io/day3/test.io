OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		arg println
		r doMessage(arg)
	)
	r
)

Map atPutNumber := method(arg0, arg1,
	self atPut(arg0, arg1)
)

r := Map clone
r doMessage("123123:123123")
r doMessage("45334535:23435")


r keys println
r values println