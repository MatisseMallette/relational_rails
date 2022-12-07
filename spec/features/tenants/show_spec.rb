require 'rails_helper'

RSpec.describe 'Tenant show' do 
  before :each do 
    @apartment = Apartment.create!(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @tenant = @apartment.tenants.create!(name: "Bob", number_of_pets: 1, has_job: false)
  end

  it 'displays the information of an apartment with a certain id' do 
    visit "/tenants/#{@tenant.id}"
    save_and_open_page
    expect(page).to have_content("Bob")
    expect(page).to have_content("1")  
    expect(page).to have_content("false")
  end
end