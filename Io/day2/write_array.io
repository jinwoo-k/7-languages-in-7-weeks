List save := method(path,
	str := ""
	self foreach(i, v, str := str .. i .. " ")

	f := File with(path)
	f remove
	f openForUpdating
	f write(str)
	f close
)

List load := method(path,
	f := File with(path)
	f openForReading

	f readLine split
)

list(1,2,3,4) save("array.txt")
List load("array.txt") println