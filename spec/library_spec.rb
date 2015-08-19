# require('rspec')
# require('library')
# require('pg')
#
# DB = PG.connect({:dbname => "library_system_test"})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM books *;")
#   end
# end
#
# describe(Library) do
#   describe('.all') do
#     it('return an empty array at first') do
#       expect(Library.all()).to(eq([]))
#     end
#   end
#
#
#
#
# end
