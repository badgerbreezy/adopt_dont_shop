require 'rails_helper'

describe "shelters index page", type: :feature do
  it "can be accessed by shelters index" do
    shelter_1 = Shelter.create(name: "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city: "Boulder",
                               state: "CO",
                               zip: "80301")
    visit "/shelters"
    click_link('Humane Society of Boulder')




    expect(page).to have_content('Humane Society of Boulder Valley')
    expect(page).to have_content("#{shelter_1.name}")
    expect(page).to have_content("#{shelter_1.address}")
    expect(page).to have_content("#{shelter_1.city}")
    expect(page).to have_content("#{shelter_1.state}")
    expect(page).to have_content("#{shelter_1.zip}")
    expect(page).to have_button("Click here to edit this shelter's information")
    expect(page).to have_button("click here to delete")
  end

  it "has links to shelters" do
    skip
    visit "/shelters"

    expect(page).to have_link('', href: 'http://localhost:3000/shelters/1')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/2')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/4')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/10')
    expect(page).to have_link('', href: 'http://localhost:3000/shelters/new')
  end
end
