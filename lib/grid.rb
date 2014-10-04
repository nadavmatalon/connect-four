require_relative 'circle'

class Grid

	attr_reader :circles

	def initialize
		@circles = generate_circles
	end
 
	def generate_circles
 		circles, index, row, column, color = [], nil, nil, nil, nil
 		for i in 'A'..'G' do
 			for j in '0'..'5' do
 				index = i + j
 				row = j
 				column = i
 				color = ''
 				circles << Circle.new(index, row, column, color)
 			end
 		end
		circles		
 	end

end