class ActsAsCsv
	@@SEP = ','

	define_method 'read' do
		puts "try to read file : #{self.class.to_s.downcase + '.txt'}"
		file = File.new(self.class.to_s.downcase + '.txt')
		@headers = file.gets.chomp.split(@@SEP)

		file.each do |row|
			@result << row.chomp.split(@@SEP)
		end
	end

	define_method 'headers' do
		@headers
	end

	define_method 'csv_contests' do
		@result
	end

	define_method 'initialize' do
		@result = []
		read
	end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new

puts m.headers.inspect
puts m.csv_contests.inspect
