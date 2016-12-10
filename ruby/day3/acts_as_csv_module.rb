module ActsAsCsv

	class CsvRow
		def initialize(headers, contents)
			@headers = headers
			@contents = contents
		end

		def method_missing(name, *args)
			position = @headers.index name.to_s
			@contents[position] if position
		end
	end

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		attr_accessor :headers, :csv_contents

		def read
			@@SEP = ','
			@csv_contents = []
			file = File.new(self.class.to_s.downcase + '.txt')
			@headers = file.gets.chomp.split(@@SEP)

			file.each do |row|
				csv_contents << row.chomp.split(@@SEP)
			end
		end
		
		def initialize
			read
		end

		def each(&block)
			csv_contents.each do |contents|
				block.call CsvRow.new(headers, contents)
			end
		end
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

m = RubyCsv.new
m.each {|row| puts "#{row.one}"}
