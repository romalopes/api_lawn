#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
# configure :production, :development do
# 	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

# 	ActiveRecord::Base.establish_connection(
# 			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
# 			:host     => db.host,
# 			:username => db.user,
# 			:password => db.password,
# 			:database => db.path[1..-1],
# 			:encoding => 'utf8'
# 	)
# end


# require 'sinatra'

# env = ENV["RACK_ENV"]

# YAML::load(File.open('config/database.yml'))[env].symbolize_keys.each do |key, value|
#   set key, value
# end

# ActiveRecord::Base.establish_connection(
#   adapter: "mysql2", 
#   host: settings.db_host,
#   database: settings.db_name,
#   username: settings.db_username,
#   password: settings.db_password)


configure :development do
 set :database, 'mysql://root@localhost/api_lawn_mowing_development'
 set :show_exceptions, true
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/api_lawn_mowing_development')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end