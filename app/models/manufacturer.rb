class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :country, presence: true
  validates_uniqueness_of :name

  has_many :cars, dependent: :nullify
end
