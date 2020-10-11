require 'rails_helper'

describe "welcome index page", type: :feature do
  it "can see header and link to shelter page" do
    visit "/"

    expect(page).to have_content(Time.new)
    expect(page).to have_content('Shelters')
  end
end
