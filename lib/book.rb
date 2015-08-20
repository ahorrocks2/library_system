class Book

  attr_reader(:book_title, :book_author, :book_genre, :book_id)

  define_method(:initialize) do |attributes|
    @book_title = attributes.fetch(:book_title)
    @book_author = attributes.fetch(:book_author)
    @book_genre = attributes.fetch(:book_genre)
    @book_id = attributes.fetch(:book_id)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    book_list = []
    returned_books.each() do |book|
      book_title = book.fetch('title')
      book_author = book.fetch('author')
      book_genre = book.fetch('genre')
      book_id = book.fetch('book_id').to_i()
      book_list.push(Book.new({:book_title => book_title, :book_author => book_author, :book_genre => book_genre, :book_id => book_id}))
    end
    book_list
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO books (author, title, genre) VALUES ('#{@book_author}', '#{@book_title}', '#{@book_genre}') RETURNING book_id;")
    @book_id = result.first().fetch("book_id").to_i()
  end

  define_method(:==) do |another_book|
    self.book_title == another_book.book_title() && self.book_author == another_book.book_author()
  end

  define_method(:update) do |attributes|
    @book_title = attributes.fetch(:book_title, @book_title)
    @book_author = attributes.fetch(:book_author,@book_author)
    @book_genre = attributes.fetch(:book_genre, @book_genre)
    @book_id = self.book_id()
    DB.exec("UPDATE books SET title = '#{@book_title}' WHERE book_id = #{@book_id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM books WHERE book_id = #{self.book_id()};")
  end

  define_singleton_method(:find_title) do |title|
    found_book = nil
    Book.all().each() do |book|
      if book.book_title() == title
        found_book = book
      end
    end
    found_book
  end

  define_singleton_method(:find_author) do |author|
    found_book = nil
    Book.all().each() do |book|
      if book.book_author() == author
        found_book = book
      end
    end
    found_book
  end

  define_singleton_method(:find_genre) do |genre|
    found_book = nil
    Book.all().each() do |book|
      if book.book_genre() == genre
        found_book = book
      end
    end
    found_book
  end

  define_singleton_method(:find_book_id) do |id|
    found_book = nil
    Book.all().each() do |book|
      if book.book_id() == id
        found_book = book
      end
    end
    found_book
  end

end
