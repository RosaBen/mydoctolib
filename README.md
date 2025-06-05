# mydoctolib

there are 2 exercices on same app
to try each uncomment the block above "#---------------------"
or/and comment the block below "#---------------------"
## EXO1
### step1
install gems with :
```bash
bundle install
```

### step2
create diagram of relations
[exo1diagram](exo1.drawio)

### step3
check status of migrations
```bash
rails db:migrate:status
```

#### is migration down?
DO
```bash
rails db:migrate
```

#### is migration up?
check schema.rb to check if all tables are created and their foreign keys
add seeds
```bash
rails db:seeds
```

### step4
access rails console
```bash
rails c
```
#### add new doctor, new patient, new appointment
```bash
Doctor.new(last_name: "Abracadabra++", first_name:"Houdini++", specialty: "GP", zip_code: "92100").save
Patient.new(last_name: "rosa++", first_name:"Louloulou").save
Appointment.new(date: "2025-06-13 09:00:00", doctor_id: 1, patient_id: 1).save
```
#### check All classes
enter tp + Class.all
Ex:
```bash
tp Doctor.all
```

## EXO2
make sure all previous code are commented
### step1
create diagram of relations
[exo2diagram](exo2.drawio)

### step2
check status of migrations
```bash
rails db:migrate:status
```

#### is migration up?
DO 3 times
```bash
rails db:rollback
```
then do once
```bash
rails db:migrate:status
```
and check schema.rb is empty (should have only "ActiveRecord::Schema[8.0].define(version: 0) do
end")

#### is all migration down?
go to step3

### step3

access rails console
```bash
rails c
```
### add new doctor, new patient, new appointment, new city, new specialty,new doctorspeciality
```bash
City.create!(name: "Marseille")
Specialty.create!(name: "Psychiatrist")
Doctor.create!(first_name: "Albert", last_name: "1er", city_id: 1)
Patient.create!(first_name: "Jeanne", last_name: "Morose", city_id: 1)
Appointment.create!(date: "2025-06-13 09:00:00", doctor_id: 1, patient_id: 1, city_id:1)
DoctorSpecialty.create!(doctor_id:2, specialty_id:1)
```

#### check All classes
enter tp + Class.all
Ex:
```bash
tp Doctor.all
```

### step4
add seeds
```bash
rails db:seeds
```