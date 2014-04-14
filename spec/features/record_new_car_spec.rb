require 'spec_helper'

feature 'add a new car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

#Acceptance Criteria
# I must specify the color, year, and mileage of the car.
# Only years from 1980 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded.
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected so that I can create another car.

  before :each do
    visit root_path
    click_on "Add a New Car"
  end

  scenario 'car salesperson inputs valid information and successfully adds a car' do

    fill_in "Color", with: "yellow"
    fill_in "Mileage", with: 1000
    select 1987, from: "Year"
    click_on "Submit New Car"

    expect(page).to have_content("Car successfully submitted!")
    expect(current_path).to eql(new_car_path)
    expect(Car.count).to eql(1)
  end

  scenario 'car salesperson inputs invalid information' do
    fill_in "Color", with: ""
    fill_in "Mileage", with: 1000
    select 1987, from: "Year"
    click_on "Submit New Car"

    expect(page).to_not have_content("Car successfully submitted!")
    expect(Car.count).to eq(0)
  end
end
