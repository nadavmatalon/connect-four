require_relative 'grid'
require_relative 'game'

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
	current_circle = session[:grid].circles.find {|circle| circle.row == circle_number && circle.column == circle_column }
	current_circle.color = circle_color
	if circle_color == 'black'
		black_update = session[:black_count] = check_state('black')
	else
		red_update = session[:red_count] = check_state('red')
	end
	margin_top = 312 - (51 * session[(selected_column.to_sym)])
	session[(selected_column.to_sym)] += 1
	margin_top.to_s + 'px'
end

post '/new_game' do
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
end

post '/black_count' do
	session[:black_count].to_s
end

post '/red_count' do
	session[:red_count].to_s
end

