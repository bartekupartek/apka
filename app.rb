require 'rubygems'
require 'sinatra'

get '/' do
  "<h2>jestem!</h2>"
end

get '/katalog' do 
  Dir.entries('katalog').reject { |d| d =~ /^\.{1,2}$/ }.map { |d| "<p><a href=\"/katalog/#{d}\">#{d}</a></p>" }
end

get "/katalog/:file" do
  if File.exists?("katalog/"+params[:file])
    return File.open("katalog/" + params[:file])
  else
   return "pusto..."
  end
end
