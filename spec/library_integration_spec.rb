require('capybara/rspec')
require('./app')
require('spec_helper')
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

  it('allows the user to go to an individual books page') do
    visit('/')
    fill_in('new_title', :with => 'The Great Gatsby')
    fill_in('new_author', :with => 'F. Scott Fitzgerald')
    fill_in('new_genre', :with => 'Fiction')
    click_button('Add book!')
    click_link('The Great Gatsby')
    expect(page).to have_content('F. Scott Fitzgerald')
  end

  it('allows user to update a books information') do
    visit('/')
    fill_in('new_title', :with => 'The Great Gatsby')
    fill_in('new_author', :with => 'F. Scott Fitzgerald')
    fill_in('new_genre', :with => 'Fiction')
    click_button('Add book!')
    click_link('The Great Gatsby')
    fill_in('new_title', :with => 'The Great Gatsby Special Edition')
    click_button('Edit Book')
    expect(page).to have_content('The Great Gatsby Special Edition')
  end

end

describe('the patrons path', {:type => :feature}) do
  it('allows the user to see a list of patrons and add new patrons') do
    visit('/')
    click_on('Patrons Page')
    expect(page).to have_content('Expecto Patronus')
  end

  it('allows the user to add a patron') do
      visit('/patron')
      fill_in('new_name', :with => 'Hermione Granger')
      click_button('Add A Patron!')
      expect(page).to have_content('Hermione Granger')
  end

  it('allows the user to look at a specific patron') do
    visit('/patron')
    fill_in('new_name', :with => 'Ronald Weasley')
    click_button('Add A Patron!')
    click_link('Ronald Weasley')
    expect(page).to have_content('Ronald Weasley')
  end

end
