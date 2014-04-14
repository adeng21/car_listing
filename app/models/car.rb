class Car < ActiveRecord::Base
  validates :mileage, presence: true
  validates :year, presence: true, inclusion: {in: (1980..2014)}
  validates :color, presence: true

  belongs_to :manufacturer
end
