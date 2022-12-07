require 'rails_helper'

RSpec.describe 'Apartment tenants index' do 
  before :each do 
    @apartment1 = Apartment.create!(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @tenant1 = @apartment1.tenants.create!(name: "Bob", number_of_pets: 1, has_job: true)
    @apartment2 = Apartment.create!(name: "Blah Blah", rent: 20, rent_controlled: true, address: "123 Cityberg Statesville")
    @tenant2 = @apartment2.tenants.create!(name: "Jeff", number_of_pets: 0, has_job: false)
    @tenant3 = @apartment2.tenants.create!(name: "Todd", number_of_pets: 2, has_job: true)
  end

  it 'displays a list of all apartments' do 
    visit "/apartments/#{@apartment2.id}/tenants"
    expect(page).to have_content("Blah Blah")
    expect(page).to have_content("Jeff")
    expect(page).to have_content("0")
    expect(page).to have_content("false")
    expect(page).to have_content("Todd")
    expect(page).to have_content("2")
    expect(page).to have_content("true")
    # save_and_open_page
  end
end