require 'bundler'
Bundler.require()


# ** Connection **
db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/kinder')
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)


require './connection'
require './models/user'
require './models/kitten'
require './models/judgement'

require './helpers/application_helper.rb'

enable :sessions

get '/' do
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect '/'
end

get '/login' do
  erb :'sessions/login'
end

post '/sessions' do
  redirect '/' unless user = User.find_by({username: params[:username]})
  if user.password == params[:password]
    session[:current_user] = user.id
    redirect '/judgements'
  else
    redirect '/'
  end
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/'
end

get '/history' do
  authenticate!
  erb :'users/history'
end

get '/judgements' do
  authenticate!
  @kitten = Kitten.all.sample
  erb :judgement
end

post '/judgements' do
  authenticate!
  kitten = Kitten.find(params[:kitten_id])
  is_meow = params[:is_meow]
  Judgement.create({user: current_user, kitten: kitten, is_meow: is_meow})
  redirect '/judgements'
end
