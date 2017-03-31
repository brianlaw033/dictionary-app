require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('Go to Add new word', {:type => :feature}) do
    it('redirect the user to /new_word') do
      visit('/')
      click_button('Add New Word')
      expect(page).to have_content('Add New Word')
    end
  end

  describe('Add new word', {:type => :feature}) do
    it('redirect the user to /new_word') do
      visit('/new_word')
      fill_in('word', :with => 'Gabriel')
      click_button('Submit')
      expect(page).to have_content('Success')
    end
  end

  describe('Check Word Added', {:type => :feature}) do
    it('check if the word is added or not') do
      visit('/new_word')
      fill_in('word', :with => 'Gabriel')
      click_button('Submit')
      click_on('Go back to main page')
      expect(page).to have_content('Gabriel')
    end
  end

  describe('Go to Word page', {:type => :feature}) do
    it('redirect the user to /word/1') do
      visit('/new_word')
      fill_in('word', :with => 'Gabriel')
      click_button('Submit')
      visit('/word/1')
      expect(page).to have_content('Add New Definition')
    end
  end
