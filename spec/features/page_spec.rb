describe 'Connect Four page', type: :feature  do

	subject { page }

	before (:each) do 
		visit '/'
	end

	it "should have title 'Connect Four'" do
		should have_content	'Connect Four'
	end

	it 'should have score of Black' do
		within '#black-container' do
			should have_content	'Black'
			should have_content	'0'
		end
	end

	it 'should have score of Red' do
		within '#red-container' do
			should have_content	'Red'
			should have_content	'0'
		end
	end

	it "should have 'New Game' button" do
		should have_button 'New Game'
	end

	it 'should have grid with 42 containers' do
		should have_selector('.square', count: 42)
	end

end

