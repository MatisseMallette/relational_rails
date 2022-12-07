require 'rails_helper'

RSpec.describe 'Apartment show' do 
  before :each do 
    @apartment1 = Apartment.create(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @apartment2 = Apartment.create(name: "Blah Blah", rent: 20, rent_controlled: true, address: "123 Cityberg Statesville")
  end

  it 'displays the information of an apartment with a certain id' do 
    visit "/apartments/#{@apartment1.id}"
    # save_and_open_page
    expect(page).to have_content("Sierra Foothills")
    expect(page).to have_content("100")  
    expect(page).to have_content("48301 W 44th St Phoenix Arizona")
  end

  it 'displays a count of the number of tenants associated with each apartment' do 
    tenant1 = @apartment1.tenants.create!(name: "Bob", number_of_pets: 1, has_job: false)  
    tenant2 = @apartment1.tenants.create!(name: "Jim", number_of_pets: 100, has_job: false)
    tenant3 = @apartment2.tenants.create!(name: "Daniel", number_of_pets: 0, has_job: false)
    visit "/apartments/#{@apartment1.id}"
    # save_and_open_page
    expect(page).to have_content("Number of tenants: 2")
    visit "/apartments/#{@apartment2.id}"
    # save_and_open_page
    expect(page).to have_content("Number of tenants: 1")
  end
end