require("sinatra")
require("sinatra/reloader")
require("./lib/book")
require("./lib/patron")
require("pg")
require('pry')

also_reload("lib/**/*.rb")

DB = PG.connect({:dbname => "library_system_test"})

get('/') do
  @books = Book.all()
  erb(:index)
end

get('/book/:book_id') do
  @book = Book.find(params.fetch('book_id').to_i())
  erb(:book)
end

patch('/book/:book_id') do
  book_title = params.fetch('new_title')
  book_author = params.fetch('new_author')
  book_genre = params.fetch('new_genre')
  @book = Book.find(params.fetch('book_id').to_i())
  @book.update({:book_title => book_title, :book_author => book_author, :book_genre => book_genre, :book_id => nil})

  redirect('/')
end


get('/patron') do
  @patrons = Patron.all()
  erb(:patrons)
end

get('/patron/:patron_id') do
  @patron = Patron.find(params.fetch('patron_id').to_i())
  erb(:single_patron)
end

post('/new_book') do
  book_title = params.fetch('new_title')
  book_author = params.fetch('new_author')
  book_genre = params.fetch('new_genre')
  new_book = Book.new({:book_title => book_title, :book_author => book_author, :book_genre => book_genre, :book_id => nil})
  new_book.save()

  redirect('/')
end

post('/new_patron') do
  name = params.fetch('new_name')
  new_patron = Patron.new({:name => name, :book_id => 1, :patron_id => nil})
  new_patron.save()

  redirect('/patron')
end
