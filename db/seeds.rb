# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# puts "Nettoyage des données..."
# Appointment.destroy_all
# Doctor.destroy_all
# Patient.destroy_all
specialties = [ "GP", "Oncologist", "ophthalmologist", "dentist", "gynecologist", "psychiatrist" ]
doctors=[]
patients = []

puts "Ajout des médecins..."
5.times do
  doctors.push Doctor.create!(
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name,
  specialty: specialties.sample,
  zip_code: Faker::Number.leading_zero_number(digits: 5)
  )
end

puts "Ajout des patients..."
10.times do
  patients.push Patient.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name
  )
end

puts "Ajout des rdv..."
10.times do
  Appointment.create!(
    date: Faker::Date.forward(days: 10).to_datetime + rand(9..17).hours,
    doctor_id: doctors.sample.id,
    patient_id: patients.sample.id
  )
end
