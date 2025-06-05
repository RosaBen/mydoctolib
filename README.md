# mydoctolib

## step1
install gems with :
```bash
bundle install
```

## step2
create diagram of relations
[exo1diagram](exo1.drawio)

## step3
check status of migrations
```bash
rails db:migrate:status
```

### is migration down?
DO
```bash
rails db:migrate
```

### is migration up?
access rails console
```bash
rails c
```

## step4
check tables are working fine with rails c
```bash
rails c
```

### check All classes
enter tp + Class.all
Ex:
```bash
tp Doctor.all
```
### add new doctor, new patient, new appointment
```bash
Doctor.new(last_name: "Abracadabra", first_name:"Houdini", specialty: "GP", zip_code: "92100").save
Patient.new(last_name: "rosa", first_name:"Loulou").save
Appointment.new(date: "2025-06-13 17:00:00", doctor_id: 1, patient_id: 1).save
```