require_relative 'grid'

require 'sinatra'

set :views, Proc.new {File.join(root, '..', "views")}
set :public_dir, Proc.new {File.join(root, '..', "public")}

enable :sessions

set :session_secret, ENV['CONNECT_FOUR_SECRET']

set :logging, false

get '/' do
	session[:grid] = Grid.new
	session[:current_turn] = 'black'
	session[:total] = 0
	session[:column_A] = 0
	session[:column_B] = 0
	session[:column_C] = 0
	session[:column_D] = 0
	session[:column_E] = 0
	session[:column_F] = 0
	session[:column_G] = 0
	session[:black_count] = 0
	session[:red_count] = 0
	session[:circle_number] = ''
	session[:circle_color] = ''
	erb :index
end

post '/selected_circle' do
	black_update = 0
	red_update = 0
	session[:total] += 1
	selected_column = params[:mode]
	circle_number = params[:number]
	circle_color = params[:color]
	circle_column = selected_column.slice(7)
	puts '-------'
	puts 'circle colum: ' + params[:mode]
	puts 'circle number: ' + params[:number]
	puts 'circle color: ' + params[:color]
	puts 'circle column: ' + circle_column
	current_circle = session[:grid].circles.find {|circle| circle.row == circle_number && circle.column == circle_column }
	current_circle.color = circle_color
	if circle_color == 'black'
		black_update = session[:black_count] = check_state('black')
	else
		red_update = session[:red_count] = check_state('red')
	end
	puts 'black_update: ' + black_update.to_s
	puts 'red_update: ' + red_update.to_s

	margin_top = 312 - (52 * session[(selected_column.to_sym)])
	session[(selected_column.to_sym)] += 1
	puts session[:grid]
	margin_top.to_s + 'px'
end

post '/black_count' do
	session[:black_count].to_s
end

post '/red_count' do
	session[:red_count].to_s
end

def check_state color
	check_rows(color) + check_columns(color) + check_diagonals(color)
	# red_count = check_rows + check_columns + check_diagonals
	# puts 'black count: ' + black_count.to_s
	# puts 'red count: ' + red_count.to_s

	# black = session[:grid].circles.select {|circle| circle.color == 'black'}.count.to_s
	# red = session[:grid].circles.select {|circle| circle.color == 'red'}.count.to_s

end

def check_rows color
	result = 0
	success = [color, color, color, color]
	for i in 0..5 do
		row_color = []
		row = session[:grid].circles.select {|circle| circle.row == i.to_s }
		row.each {|circle| row_color << circle.color}
		puts 'row ' + i.to_s + ': ' + row_color.join(',')
		for j in 0..3 do
			current_state = [row_color[j], row_color[j+1], row_color[j+2], row_color[j+3]]
			result += 1 if current_state == success
		end
	end
	result
end

def check_columns color
	0
end

def check_diagonals color
	0
end











