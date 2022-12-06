require 'rails_helper'

RSpec.describe 'Apartment show' do 
  before :each do 
    @apartment1 = Apartment.create(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @apartment2 = Apartment.create(name: "Blah Blah", rent: 20, rent_controlled: true, address: "123 Cityberg Statesville")
  end

  it 'displays the information of an apartment with a certain id' do 
    visit "/apartments/#{@apartment1.id}"
    save_and_open_page
    expect(page).to have_content("Sierra Foothills")
    expect(page).to have_content("100")  
    expect(page).to have_content("48301 W 44th St Phoenix Arizona")
  end
end