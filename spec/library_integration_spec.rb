require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe('the book path', {:type => :feature}) do
  it('allows the user to see a list of all books') do
    visit('/')
    expect(page).to have_content('Welcome to the Library')
  end

  it('allows the user to add a book to the list') do
    visit('/')
    fill_in('new_title', :with => 'The Great Gatsby')
    fill_in('new_author', :with => 'F. Scott Fitzgerald')
    fill_in('new_genre', :with => 'Fiction')
    click_button('Add book!')
    expect(page).to have_content('The Great Gatsby')
  end

end
