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

end
