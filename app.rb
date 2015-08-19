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
