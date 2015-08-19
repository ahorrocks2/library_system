class Patron

attr_reader(:name, :book_id, :patron_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @patron_id = attributes.fetch(:patron_id)
    @book_id = attributes.fetch(:book_id)
  end




end
