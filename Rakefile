require 'bundler'
Bundler.require()

require 'sinatra/activerecord/rake'
require './connection'

namespace :db do
  desc 'populate db with kitten urls'
  task :kittens do

    require './models/kitten'

    200.upto(300) do |width|
      200.upto(300) do |height|
        Kitten.create({url: "http://placekitten.com/#{width}/#{height}"})
    end
    end


    end
  end
