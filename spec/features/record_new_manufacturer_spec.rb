require 'spec_helper'

feature 'add a new manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

#ACCEPTANCE CRITERIA
# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information,
#the manufacturer is recorded and I am redirected to enter another new manufacturer.

  before :each do
    visit root_path
    click_on "Add a New Manufacturer"
  end

  scenario 'required information is submitted and new manufacturer is successfully added' do
    fill_in 'Name', with: "Honda"
    select 'Japan', from: "Country"
    click_on 'Add New Manufacturer'

    expect(page).to have_content("New Manufacturer Successfully Submitted!")
    expect(current_path).to eql(new_manufacturer_path)
    expect(Manufacturer.count).to eql(1)
  end

  scenario 'required information is not submitted, and no new manufacturer is added' do
    fill_in 'Name', with: ""
    select 'Japan', from: "Country"
    click_on 'Add New Manufacturer'

    expect(page).to_not have_content("New Manufacturer Successfully Submitted!")
    expect(Manufacturer.count).to eql(0)
  end

  scenario 'existing manufacturer already exists in database' do
    manufacturer = FactoryGirl.create(:manufacturer)
    fill_in 'Name', with: manufacturer.name
    select 'Japan', from: "Country"
    click_on 'Add New Manufacturer'

    expect(page).to_not have_content("New Manufacturer Successfully Submitted!")
    expect(Manufacturer.count).to eql(1)
  end
end
