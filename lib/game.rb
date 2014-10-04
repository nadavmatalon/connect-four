
def check_state color
	check_rows(color) + check_columns(color) + check_diagonals(color)
end

def check_rows color
	result = 0
	success = [color, color, color, color]
	for i in 0..5 do
		row_color = []
		row = session[:grid].circles.select {|circle| circle.row == i.to_s }
		row.each {|circle| row_color << circle.color}
		for j in 0..3 do
			current_state = [row_color[j], row_color[j+1], row_color[j+2], row_color[j+3]]
			result += 1 if current_state == success
		end
	end
	result
end

def check_columns color
	result = 0
	success = [color, color, color, color]
	for i in "A".."G" do
		row_color = []
		row = session[:grid].circles.select {|circle| circle.column == i }
		row.each {|circle| row_color << circle.color}
		for j in 0..3 do
			current_state = [row_color[j], row_color[j+1], row_color[j+2], row_color[j+3]]
			result += 1 if current_state == success
		end
	end
	result
end

def check_diagonals color
	result = 0
	success = [color, color, color, color]
	diagonals.each do |diagonal_set|
		selected_circles = []
		colors = []
		diagonal_set.each do |circle_index|
			selected_circles << session[:grid].circles.find {|c| c.index == circle_index }
		end
		selected_circles.each {|circle| colors << circle.color}
		result += 1 if colors == success
		end
	result
end

def diagonals
	[['A2', 'B3', 'C4', 'D5'], ['A1', 'B2', 'C3', 'D4'], ['B2', 'C3', 'D4', 'E5'],
	['A0', 'B1', 'C2', 'D3'], ['B1', 'C2', 'D3', 'E4'], ['C2', 'D3', 'E4', 'F5'],
	['B0', 'C1', 'D2', 'E3'], ['C1', 'D2', 'E3', 'F4'], ['D2', 'E3', 'F4', 'G5'],
	['C0', 'D1', 'E2', 'F3'], ['D1', 'E2', 'F3', 'G4'], ['D0', 'E1', 'F2', 'G3'],
	['A3', 'B2', 'C1', 'D0'], ['A4', 'B3', 'C2', 'D1'], ['B3', 'C2', 'D1', 'E0'],
	['A5', 'B4', 'C3', 'D2'], ['B4', 'C3', 'D2', 'E1'], ['C3', 'D2', 'E1', 'F0'],
	['B5', 'C4', 'D3', 'E2'], ['C4', 'D3', 'E2', 'F1'], ['D3', 'E2', 'F1', 'G0'],
	['C5', 'D4', 'E3', 'F2'], ['D4', 'E3', 'F2', 'G1'], ['D5', 'E4', 'F3', 'G2']]
end

