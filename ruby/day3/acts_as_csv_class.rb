class ActsAsCsv
	@@SEP = ','

	def read
		puts "try to read file : #{self.class.to_s.downcase + '.txt'}"
		file = File.new(self.class.to_s.downcase + '.txt')
		@headers = file.gets.chomp.split(@@SEP)

		file.each do |row|
			@result << row.chomp.split(@@SEP)
		end
	end

	def headers
		@headers
	end

	def csv_contests
		@result
	end

	def initialize
		@result = []
		read
	end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new

puts m.headers.inspect
puts m.csv_contests.inspect
