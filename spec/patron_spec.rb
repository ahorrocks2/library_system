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
      test_patron = Patron.new({:name => 'Ricky Bobby', :patron_id => nil, :book_id => 1})
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end

  describe('#update') do
    it('allow user to update a patrons information') do
      test_patron = Patron.new({:name => 'Ricky Bobby', :patron_id => nil, :book_id => 1})
      test_patron.save()
      test_patron.update({:name => 'Shake N Bake', :patron_id => nil, :book_id => 1})
      expect(test_patron.name()).to(eq('Shake N Bake'))
    end
  end

  describe('.find') do
    it('return a patron by their id') do
      test_patron1 = Patron.new(:name => 'Ricky Bobby', :patron_id => nil, :book_id => 1)
      test_patron2 = Patron.new(:name => 'Madonna', :patron_id => nil, :book_id => 1)
      test_patron1.save()
      test_patron2.save()
      expect(Patron.find(test_patron1.patron_id().to_i)).to(eq(test_patron1))
    end
  end


end
