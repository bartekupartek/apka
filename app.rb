require 'rubygems'
require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/katalog'

def directory_exists? dir
  Dir.exists? dir
end

def dir_entries dir
  content = ''
  Dir.foreach dir do |item|
    next if item == '.' or item == '..'
    content << "<p>#{item}</p>"
  end
  content
end

get '/' do
  "<h2>jestem!</h2>"
end

get '/katalog' do
  dir_entries settings.public_folder
end

get '/katalog/:dir' do
  dir = File.join settings.public_folder, params[:dir]
  if directory_exists? dir
    if Dir[File.join dir, '*'].count > 0
      dir_entries dir
    else
      "pusto..."
    end
  else
    status 404
    erb :oops
  end
end
