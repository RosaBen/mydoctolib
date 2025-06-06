class City < ApplicationRecord
  has_many :doctors
  has_many :patients
  has_many :appointments
  validates :name, uniqueness: true
end
