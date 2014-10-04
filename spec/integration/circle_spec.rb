describe Circle do

	let (:circle) { Circle.new }

 	it 'can be initialized' do
 		expect{Circle.new}.not_to raise_error
 	end

 	it 'is initialized without index value' do
 		expect(circle.index).to eq nil
 	end

	it 'is initialized without row value' do
 		expect(circle.row).to eq nil
 	end

	it 'is initialized without column value' do
 		expect(circle.column).to eq nil
 	end

	it 'is initialized without color value' do
 		expect(circle.color).to eq nil
 	end

 	it 'is can be initialized with index value' do
 		circle = Circle.new('A0')
 		expect(circle.index).to eq 'A0'
 	end

 	it 'is can be initialized with row value' do
 		circle = Circle.new('A0', '0')
 		expect(circle.row).to eq '0'
 	end

 	it 'is can be initialized with column value' do
 		circle = Circle.new('A0', '0', 'A')
 		expect(circle.column).to eq 'A'
 	end

 	it 'is can be initialized with color value' do
 		circle = Circle.new('A0', '0', 'A', 'black')
 		expect(circle.color).to eq 'black'
 	end
end








