require('spec_helper')

describe(Patron) do
  describe('#name') do
    it("returns the name of the patron") do
    test_patron = Patron.new(:name => 'Ricky Bobby', :patron_id => nil, :book_id => 1)
    expect(test_patron.name()).to(eq('Ricky Bobby'))
    end
  end

  describe('.all') do
    it('returns an empty array at first') do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('overright the equal comparator') do
      test_patron1 = Patron.new(:name => 'Ricky Bobby', :patron_id => 1, :book_id => 1)
      test_patron2 = Patron.new(:name => 'Ricky Bobby', :patron_id => 1, :book_id => 1)
      expect(test_patron1).to(eq(test_patron2))
    end
  end

  describe('#save') do
    it('allow a patron to be saved in list') do
      test_patron = Patron.new(:name => 'Ricky Bobby', :patron_id => nil, :book_id => 1)
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end

end
