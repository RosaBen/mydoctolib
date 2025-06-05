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

puts "Nettoyage des données..."
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF")
Appointment.delete_all
Doctor.delete_all
Patient.delete_all
City.delete_all
Specialty.delete_all
DoctorSpecialty.delete_all
ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='appointments'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='doctors'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='patients'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='specialties'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='doctor_specialties'")
# ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='appointments'")
specialty_names = [ "GP", "Oncologist", "ophthalmologist", "dentist", "gynecologist", "psychiatrist" ]
doctors=[]
patients = []
# doctor.specialties << [spec1, spec2, spec3]
# pour vérifier doctor.specialties.pluck(:name)
# ---------------------------------------------------------------------------------
# EXO1
# puts "Ajout des médecins..."
# 5.times do
#   doctors.push Doctor.create!(
#   last_name: Faker::Name.last_name,
#   first_name: Faker::Name.first_name,
#   specialty: specialties.sample,
#   zip_code: Faker::Number.leading_zero_number(digits: 5)
#   )
# end

# puts "Ajout des patients..."
# 10.times do
#   patients.push Patient.create!(
#     last_name: Faker::Name.last_name,
#     first_name: Faker::Name.first_name
#   )
# end

# puts "Ajout des rdv..."
# 10.times do
#   Appointment.create!(
#     date: Faker::Date.forward(days: 10).to_datetime + rand(9..17).hours,
#     doctor_id: doctors.sample.id,
#     patient_id: patients.sample.id
#   )
# end

# ----------------------------------------------------------------------------------

cities =[]

puts "Ajout des villes..."
10.times do
  cities.push City.create!(
    name: Faker::Address.city
  )
end

puts "Ajout des spécialités..."
specialty_names.each do |name|
  Specialty.create!(name: name)
end


puts "Ajout des médecins..."
5.times do
  doctors.push Doctor.create!(
  last_name: Faker::Name.last_name,
  first_name: Faker::Name.first_name,
  city_id: cities.sample.id
  )
end

puts "Ajout des patients..."
5.times do
  patients.push Patient.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    city_id: cities.sample.id
  )
end

puts "Ajout des rdv..."
10.times do
  Appointment.create!(
    date: Faker::Date.forward(days: 10).to_datetime + rand(9..17).hours,
    doctor_id: doctors.sample.id,
    patient_id: patients.sample.id,
    city_id: cities.sample.id
  )
end

puts "Ajout des spécialités de chaque docteur..."
specialties = Specialty.all.to_a
doctors.each do |doctor|
  specialties.sample(rand(1..3)).each do |specialty|
    doctor.specialties.push specialty unless doctor.specialties.include?(specialty)
  end
end
