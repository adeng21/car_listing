require 'spec_helper'

feature 'associate a car with manufacturer', %Q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do

# #Acceptance Criteria
# When recording a car listing, I want to optionally associate it with its manufacturer.
# If I delete a manufacturer,
# the manufacturer and its primary key should no longer be associated with any car listings.

  scenario 'create a car listing and select an associated manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit root_path
    click_on 'Add a New Car'
    car_count = Car.count
    fill_in "Color", with: "yellow"
    fill_in "Mileage", with: 1000
    select 1987, from: "Year"
    select manufacturer.name, from: "Manufacturer"
    click_on "Submit New Car"


    expect(page).to have_content("Car successfully submitted!")
    expect(Car.count).to eql(car_count + 1)
    expect(manufacturer.cars.count).to eql(1)
  end

  scenario 'deleting a manufacturer does not delete associated cars' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer_id: manufacturer.id)
    manufacturer.destroy

    expect(car.manufacturer).to eql(nil)
  end
end
