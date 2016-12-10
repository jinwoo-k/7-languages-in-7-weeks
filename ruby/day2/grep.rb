def grep(file, regex)
	File.open(file, "r") do |infile|
		infile.each { |l| 
			puts "#{infile.lineno}: #{l}" if regex === l
		 } 
	end
end

grep("grep.rb", /l$/)
