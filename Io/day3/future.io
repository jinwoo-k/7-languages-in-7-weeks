futureResult := URL with("http://google.com/") @fetch

writeln("do someting immediately")

writeln("this will block until the result is available")

writeln("fetched ", futureResult size, " bytes")
