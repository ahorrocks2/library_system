require('spec_helper')

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

  describe('.find') do
    it('will return a book given the id') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book1.save()
      test_book2.save()
      expect(Book.find(test_book1.book_id.to_i)).to(eq(test_book1))
    end
  end

  describe('#update') do
    it('will update the database of books') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book1.save()
      test_book1.update({:book_title => 'The Great Gatsby : Collectors Ed.', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      expect(test_book1.book_author()).to(eq('F. Scott Fitzgerald'))
    end
  end

  describe('#delete') do
    it('allow user to delete a book from the system') do
      test_book1 = Book.new({:book_title => 'The Great Gatsby', :book_author => 'F. Scott Fitzgerald', :book_genre => 'Fiction', :book_id => nil})
      test_book1.save()
      test_book2 = Book.new({:book_title => 'The Bell Jar', :book_author => 'Sylvia Plath', :book_genre => 'Non-Fiction', :book_id => nil})
      test_book2.save()
      test_book1.delete()
      expect(Book.all()).to(eq([test_book2]))
    end
  end


end
