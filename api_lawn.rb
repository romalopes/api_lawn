require 'sinatra'
require 'json'
require 'sinatra/activerecord'
# require './config/environments' #database configuration
# require './models/lawn'
# require './models/mower'

# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'mysql://root@localhost/api_lawn_mowing_development')

# ActiveRecord::Base.establish_connection(
#   :adapter  => "mysql2",
#   :host     => "host",
#   :username => "root",
#   :password => "",
#   :database => "api_lawn_mowing_development"
# )

# get '/roma' do
#   Lawn.establish_connection(
#     :adapter => "mysql2",
#     :database => "mysql://root@localhost/api_lawn_mowing_development"
#   )
#   Lawn.first.title
# end


get '/' do
  "Hello World #{params[:name]}".strip
end

# # list all
# get '/lawns' do
#   Lawn.all.to_json
# end

# # view one
# get '/lanw/:id' do
#   lawn = Lawn.find(params[:id])
#   return status 404 if lawn.nil?
#   lawn.to_json
# end

# # create
# post '/lawn' do
#   lawn = Lawn.new(params['lawn'])
#   lawn.save
#   status 201
# end

# # update
# put '/lawn/:id' do
#   lawn = Lawn.find(params[:id])
#   return status 404 if lawn.nil?
#   lawn.update(params[:lawn])
#   lawn.save
#   status 202
# end

# delete '/lawn/:id' do
#   lawer = Lawn.find(params[:id])
#   return status 404 if lawn.nil?
#   lawn.delete
#   status 202
# end


#  def execute
#  		lawer = Lawn.find(params[:id])
#  		result = lawer.execute
#  		result.to_jason
#   end





# # list all
# get '/lawn/:id/mowers' do
#   Mower.all.to_json
# end

# # view one
# get '/lawn/:id/mower/:mower_id' do
#   lawn = Lawn.find(params[:id])
#   mower = lawn.find(params[:mower_id])
#   return status 404 if lawn.nil?
#   mower.to_json
# end

# # create
# post '/lawn/:id/mower' do
#   lawn = Lawn.find(params[:id])
# 	return status 404 if lawn.nil?
# 	mower = lawn.mower.create(params[:mower])
#   if mower.errrors.empty?
#   	return status 201
#   else
#   	mower.errrors.to_json
#   end
# end

# # update
# put '/lawn/:id/mower/:mower_id' do
# 	lawn = Lawn.find(params[:id])
# 	return status 404 if lawn.nil?
#   mower = Lawn.mowers.find(params[:mower])
#   return status 404 if mower.nil?
#   if mower.update(params[:mower])
#   	mower.to_json
#   else	
#   	mower.errors.to_json
#   end
# end


# #delete
# delete '/lawn/:id/mower/:mower_id' do
#   lawn = Lawn.find(params[:id])
#   return status 404 if lawn.nil?
#   mower = lawn.mowers.find(params[:mower_id])
#   mower.delete
#   status 202
# end
