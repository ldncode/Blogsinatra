#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init_db
	@db = SQLite3::Database.new 'Blog.db'
	@db.results_as_hash = true
end

before do
	init_db
end

configure do
	init_db
	@db.execute 'create table if not exists Posts (id integer primary key autoincrement, create_date data, content text )'
end

get '/' do
	@results = @db.execute 'select * from Posts order by id desc'
	erb :index		
end

get '/new' do
  erb :new
end

post '/new' do
  content = params[:content]
  if content.length <= 0
  	@error = 'Type post text'
  	return erb :new
  end	

   @db.execute 'insert into Posts (content, create_date) values (?, datetime())', [content]

   redirect to '/'

end