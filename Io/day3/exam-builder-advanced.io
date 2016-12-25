Builder := Object clone
Builder depth := 0
Builder tab := method("\t" repeated(depth))

Builder forward := method(
	attrStr := ""
	firstMessage := call message arguments first
	if( firstMessage != nil,
		attrs := doMessage(firstMessage)
		if(attrs isKindOf(Map), attrs foreach(k, v, attrStr = attrStr .. " " .. k .. "=\"" .. v .. "\""))
	)

	writeln(tab, "<", call message name, attrStr, ">")
	depth = depth + 1
	call message arguments foreach (
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(tab, content))
	)
	depth = depth - 1
	writeln(tab, "</", call message name, ">")
)

OperatorTable addAssignOperator(":", "toAttribute")
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)

Map toAttribute := method(arg0, arg1, 
	self atPut(
		arg0 asMutable removePrefix("\"") removeSuffix("\""),
		arg1
	)
)

	
# Builder ul(
# 	li("Io"),
# 	li("Lua"),
# 	li("JavaScript")
# )

str := "Builder ul({\"class\":\"prototyped\"}, li(\"Io\"), li(\"Lua\"), li(\"Javascript\") )"
doString(str)