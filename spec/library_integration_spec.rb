require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe('the list path', {:type => :feature}) do
  it('allows the user to see a list of all books') do
    visit('/')
    expect(page).to have_content('Welcome to the Library')
  end
end
