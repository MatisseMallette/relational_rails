require 'rails_helper'

RSpec.describe 'Apartment index' do 
  before :each do 
    @apartment = Apartment.create(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
  end

  it 'displays a list of all apartments' do 
    visit '/apartments'
    binding.pry
    expect(page).to have_content("Sierra Foothills")
  end
end