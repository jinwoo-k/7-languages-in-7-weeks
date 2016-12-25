Builder := Object clone
Builder depth := 0
Builder tab := method("\t" repeated(depth))

Builder forward := method(
	writeln(tab, "<", call message name, ">")
	depth = depth + 1
	call message arguments foreach (
		arg,
		content := self doMessage(arg);
		if (content type == "Sequence", writeln(tab, content)))
	depth = depth - 1
	writeln(tab, "</", call message name, ">")
)
	
Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)