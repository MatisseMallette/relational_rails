require 'rails_helper'

RSpec.describe 'Apartment index' do 
  before :each do 
    @apartment1 = Apartment.create(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @apartment2 = Apartment.create(name: "Blah Blah", rent: 20, rent_controlled: true, address: "123 Cityberg Statesville")
  end

  it 'displays a list of all apartments' do 
    visit '/apartments'
    # save_and_open_page
    expect(page).to have_content("Sierra Foothills")
    expect(page).to have_content("Blah Blah")
  end
end