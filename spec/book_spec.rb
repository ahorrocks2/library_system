require('rspec')
require('book')
require('pg')

DB = PG.connect({:dbname => "library_system_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end

describe(Book) do
  describe('#book_title') do
    it('will return a books title') do
      test_book = Book.new({:book_title => 'Moby Dick', :book_author => 'Herman Melville', :book_genre => 'Fiction', :book_id => nil})
      expect(test_book.book_title()).to(eq('Moby Dick'))
      expect(test_book.book_author()).to(eq('Herman Melville'))
      expect(test_book.book_genre()).to(eq('Fiction'))
      expect(test_book.book_id().to_i).to(be_instance_of(Fixnum))
    end
  end
end
