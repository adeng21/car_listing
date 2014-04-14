require 'spec_helper'

describe Manufacturer do
  it{should validate_presence_of(:name)}
  it{should validate_presence_of(:country)}
  it{should have_many(:cars).dependent(:nullify)}


  it 'should have a unique name' do
    FactoryGirl.create(:manufacturer)
    should validate_uniqueness_of(:name)
  end

end
