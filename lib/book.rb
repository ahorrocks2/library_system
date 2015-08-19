class Book

  attr_reader(:book_title, :book_author, :book_genre, :book_id)

  define_method(:initialize) do |attributes|
    @book_title = attributes.fetch(:book_title)
    @book_author = attributes.fetch(:book_author)
    @book_genre = attributes.fetch(:book_genre)
    @book_id = attributes.fetch(:book_id)
  end

  
end
