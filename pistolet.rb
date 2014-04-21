require 'sinatra'
require 'sinatra/activerecord'
require 'erubis'
require File.join(File.dirname(__FILE__), 'config/environment')
require File.join(File.dirname(__FILE__), 'models/membre')

set :erb, :escape_html => true
set :bind, '0.0.0.0'
set :port, 80

get '/' do
  @membres = Membre.all
  erb :'index.html'
end

post '/submit' do
  @membre = Membre.new(params[:membre])
  if @membre.save
    "#{@membre.full_name} vient de nous rejoindre"
  else
    "Sorry, there was an error!"
  end
end

delete '/remove_member' do
  puts "params=#{params.inspect}"
  Membre.delete(params[:membre]['id'])
  params[:membre]['id']
end
