require 'sinatra'

set :views, Proc.new {File.join(root, '..', "views")}
set :public_dir, Proc.new {File.join(root, '..', "public")}

enable :sessions

set :session_secret, ENV['CONNECT_FOUR_SECRET']

set :logging, false

get '/' do
	session[:current_turn] = 'black'
	session[:total] = 0
	session[:column_A] = 0
	session[:column_B] = 0
	session[:column_C] = 0
	session[:column_D] = 0
	session[:column_E] = 0
	session[:column_F] = 0
	session[:column_G] = 0
	erb :index
end

post '/selected_circle' do
	selected_column = params[:mode];
	puts params[:mode]
	session[:total] += 1
	data = 312 - (52 * session[(selected_column.to_sym)])
	session[(selected_column.to_sym)] += 1
	data.to_s + 'px'
end



