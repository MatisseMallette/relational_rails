require 'rails_helper'

RSpec.describe 'Apartment index' do 
  before :each do 
    @apartment = Apartment.create!(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @tenant = @apartment.tenants.create!(name: "Bob", number_of_pets: 1, has_job: true)
    @tenant2 = @apartment.tenants.create!(name: "Jeff", number_of_pets: 0, has_job: false)
  end

  it 'displays a list of all apartments' do 
    visit '/tenants'
    save_and_open_page
    expect(page).to have_content("Bob")
    expect(page).to have_content("1")
    expect(page).to have_content("true")

    expect(page).to have_content("Jeff")
    expect(page).to have_content("0")
    expect(page).to have_content("false")
  end
end