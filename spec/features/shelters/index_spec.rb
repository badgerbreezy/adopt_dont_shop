require 'rails_helper'

describe Shelter, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :pets}
  end
end

describe "shelters index page", type: :feature do
  it "can be accessed by welcome index" do
    visit "/"
    click_link('Shelters')




    expect(page).to have_content('Our Wonderful Network of Shelters')
  end

  it "has links to shelters" do
    shelter_1 = Shelter.create(name: "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city: "Boulder",
                               state: "CO",
                               zip: "80301")
    visit "/shelters"

    expect(page).to have_link("Humane Society of Boulder Valley")
  end
end
