slower := Object clone

faster := Object clone

slower start := method(wait(2); writeln("slowly"))

faster start := method(wait(1); writeln("quickly"))

writeln("slower start; faster start")
slower start; faster start


writeln("\n\nslower @@start; faster @@start; wait(3)")
slower @@start; faster @@start; wait(3)
