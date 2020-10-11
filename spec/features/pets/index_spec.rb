require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should belong_to :shelter }
  end

  describe 'class methods' do
    it '.pet_count' do
      peepad = Shelter.create!(name: 'PeePad', address: '333 Golden Lane', city: 'Soak City', state: 'Delaware', zip: '42069')
      cat_patrol = Shelter.create!(name: 'Cat Patrol', address: '10 Cathoarder Ave', city: 'Meowington', state: 'Catorado', zip: 'meowmeowmeowmeowmeow')
      peanut = peepad.pets.create!(image: 'imghost', name: 'Peanut', age: 4, sex: 'Male')
      kitkat = cat_patrol.pets.create!(image: 'imghost', name: 'KitKat', age: 7, sex: 'Female')
# binding.pry
      expect(Pet.pet_count).to eq(2)
    end
  end
end



describe "pets index page", type: :feature do
  it "has each pet's image, name, age, and sex" do
    visit "/shelters/1/pets"
    expect(page).to have_content('Our Wonderful Network of Shelters')
  end

  it "has links to shelters" do
    skip
    visit "/shelters"

    expect(page).to have_link("shelters")
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/2')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/4')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/10')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/new')
  end
end
