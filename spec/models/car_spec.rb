require 'spec_helper'

describe Car do
  it{should validate_presence_of(:mileage)}
  it{should validate_presence_of(:year)}
  it{should validate_presence_of(:color)}
  it{should ensure_inclusion_of(:year).in_range(1980..2014)}
  it{should belong_to(:manufacturer)}
end
