require 'rails_helper'

RSpec.describe 'Global navbar' do 
  before :each do 
    @apartment = Apartment.create!(name: "Sierra Foothills", rent: 100, rent_controlled: false, address: "48301 W 44th St Phoenix Arizona")
    @tenant = @apartment.tenants.create!(name: "Bob", number_of_pets: 1, has_job: true)
  end

  it 'tenant index link appears on all pages of website' do 
    visit '/apartments'
    expect(page).to have_content('TENANTS')
    click_link 'TENANTS'
    expect(current_path).to eq('/tenants')

    visit "/apartments/#{@apartment.id}"
    expect(page).to have_content('TENANTS')
    click_link 'TENANTS'
    expect(current_path).to eq('/tenants')

    visit '/tenants'
    expect(page).to have_content('TENANTS')
    click_link 'TENANTS'
    expect(current_path).to eq('/tenants')

    visit "/tenants/#{@tenant.id}"
    expect(page).to have_content('TENANTS')
    click_link 'TENANTS'
    expect(current_path).to eq('/tenants')

    visit "/apartments/#{@apartment.id}/tenants"
    expect(page).to have_content('TENANTS')
    click_link 'TENANTS'
    expect(current_path).to eq('/tenants')
  end

  it 'apartments index link appears on all pages of website' do 
    visit '/apartments'
    expect(page).to have_content('APARTMENTS')
    click_link 'APARTMENTS'
    expect(current_path).to eq('/apartments')

    visit "/apartments/#{@apartment.id}"
    expect(page).to have_content('APARTMENTS')
    click_link 'APARTMENTS'
    expect(current_path).to eq('/apartments')

    visit '/tenants'
    expect(page).to have_content('APARTMENTS')
    click_link 'APARTMENTS'
    expect(current_path).to eq('/apartments')

    visit "/tenants/#{@tenant.id}"
    expect(page).to have_content('APARTMENTS')
    click_link 'APARTMENTS'
    expect(current_path).to eq('/apartments')

    visit "/apartments/#{@apartment.id}/tenants"
    expect(page).to have_content('APARTMENTS')
    click_link 'APARTMENTS'
    expect(current_path).to eq('/apartments')
  end
end