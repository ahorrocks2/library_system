require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/book")
require("./lib/patron")
require("pg")

DB = PG.connect({:dbname => "library_system_test"})

get('/') do
  @books = Book.all()

  erb(:index)
end

post('/new_book') do
  book_title = params.fetch('new_title')
  book_author = params.fetch('new_author')
  book_genre = params.fetch('new_genre')
  new_book = Book.new({:book_title => book_title, :book_author => book_author, :book_genre => book_genre, :book_id => nil})
  new_book.save()

  redirect('/')
end
