# Questscript
# 
# app.rb
# Sinatra server for Questscript
#
# Built by Vivek Patel and Devon Peticolas

require 'sinatra'
require 'mongo'
require 'coffee-script'

# DATABASE CONNECTION ---------------------------------
#@conn	= Mongo::Connection.new
#@db		= @conn['questscript']
#@coll	= @db['games']

# RENDERING -------------------------------------------

get '/javascript/*.js' do
  filename = "coffeescript/#{params[:splat].first}"
  coffee filename.to_sym
end

# HELPERS ---------------------------------------------
def check(code)
	# TODO: Perform check
	true
end

# Error saving
error 500 do
	"Error in attempting to save"
end

# ROUTES ----------------------------------------------
# Main handler
get '/' do
	erb :index
end

# Save game handler
post '/save' do
	game = params[:game]
	if !check(game)
		500
	end

	# store code hash in mongo db
	# this assumes the correct fields
	# "author", "title", and "code"
	doc = {"author" => game["author"],
		   "title" => game["title"],
		   "code" => game["code"]}
	#@coll.insert(doc)
end	
