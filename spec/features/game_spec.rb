describe 'Game', type: :feature  do

	before (:each) do 
		visit '/'
	end

	it 'knows if 4 circles are connected in a column' do
		click_button 'New Game'
		for i in 0..1 do
			for j in 0..1 do
				button_identifier = '#' + j.to_s
				page.execute_script('$(button_identifier).trigger("click")')
			end
		end
		expect(page).to have_content '4'
	end

	it 'knows if 4 circles are connected in a row' do
		click_button 'New Game'
			for i in 0..3 do
				button_identifier = '#' + i.to_s
				2.times do
					page.execute_script('$(button_identifier).trigger("click")')
				end
			end		
		expect(page).to have_content '1'
	end

	it 'knows if 4 circles are connected in diagonal' do
		click_button 'New Game'
		for i in 0..3 do
			for j in 0..6 do
				button_identifier = '#' + j.to_s
				page.execute_script('$(button_identifier).trigger("click")')
			end
		end
		expect(page).to have_content '4'
	end

end