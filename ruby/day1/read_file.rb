
def read_directly
	File.open("hello.rb", "r") do |infile|
		counter = 1
    	while (line = infile.gets)
        	puts "#{counter}: #{line}"
        	counter = counter + 1
    	end
	end
end


def read_block
    def open(&block)
        File.open("hello.rb", "r") {|lines| block.call lines}
    end
    
    open {|lines| 
        lines.each {|line| puts "#{lines.lineno}: #{line}"}
    }
end



read_directly
read_block
