class Patron

attr_reader(:name, :book_id, :patron_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @patron_id = attributes.fetch(:patron_id)
    @book_id = attributes.fetch(:book_id)
  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch('name')
      patron_id = patron.fetch('patron_id').to_i()
      book_id = patron.fetch('book_id').to_i()
      patrons.push(Patron.new({:name => name, :patron_id => patron_id, :book_id => book_id}))
    end
    patrons
  end

  define_method(:==) do |another_patron|
    self.name() == another_patron.name() && self.patron_id() == another_patron.patron_id()
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patrons (name, book_id) VALUES ('#{@name}', #{@book_id}) RETURNING patron_id;")
    @patron_id = result.first().fetch("patron_id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_patron = nil
    Patron.all().each() do |patron|
      if patron.patron_id == id
        found_patron = patron
      end
    end
    found_patron
  end

end
