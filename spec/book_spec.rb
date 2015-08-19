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

  describe('.all') do
    it('will return an empty array at first') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the books in the library_system database') do
      test_book = Book.new({:book_title => 'Moby Dick', :book_author => 'Herman Melville', :book_genre => 'Fiction', :book_id => nil})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end

  describe('.==') do
    it('will override the equal operator') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      expect(test_book1).to(eq(test_book2))
    end
  end

  describe('.find_title') do
    it('will return a book given the title') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book1.save()
      test_book2.save()
      expect(Book.find_title('The Bell Jar')).to(eq(test_book2))
    end
  end

  describe('.find_author') do
    it('will return a books given the author') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book1.save()
      test_book2.save()
      expect(Book.find_author('F. Scott Fitzgerald')).to(eq(test_book1))
    end
  end

  describe('.find_genre') do
    it('will return books given the genre') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book1.save()
      test_book2.save()
      expect(Book.find_genre('Fiction')).to(eq(test_book1))
    end
  end

  describe('.find_book_id') do
    it('will return a book given the id') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book1.save()
      test_book2.save()
      expect(Book.find_book_id(test_book1.book_id.to_i)).to(eq(test_book1))
    end
  end
end
