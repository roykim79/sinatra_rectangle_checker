require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the rectangle path', :type => :feature do
  it 'processes the user entry and returns whether it is a square or not' do
    visit '/'
    fill_in 'length', :with => '5'
    fill_in 'width', :with => '5'
    click_button 'Go!'
    expect(page).to have_content 'This is a square.'
  end

  it 'processes the user entry and returns whether it is a square or not' do
    visit '/'
    fill_in 'length', :with => '5'
    fill_in 'width', :with => '10'
    click_button 'Go!'
    expect(page).to have_content 'This is not a square.'
  end
end
