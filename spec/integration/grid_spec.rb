describe Grid do

	let (:grid) { Grid.new }

 	it 'can be initialized' do
 		expect{Grid.new}.not_to raise_error
 	end

 	it 'is initialized with 42 circles' do
 		expect(grid.circles.count).to eq 42
 	end

 	it 'is initialized with index values for circles' do
 		expect(grid.circles.first.index).to eq 'A0'
 		expect(grid.circles.last.index).to eq 'G5'
 	end

	it 'is initialized with row values for circles' do
 		expect(grid.circles.first.row).to eq '0'
 		expect(grid.circles.last.row).to eq '5'
 	end

	it 'is initialized with column values for circles' do
 		expect(grid.circles.first.column).to eq 'A'
 		expect(grid.circles.last.column).to eq 'G'
 	end

	it 'is initialized without color values for circles' do
 		expect(grid.circles.first.color).to eq ''
 		expect(grid.circles.last.color).to eq ''
 	end

end

