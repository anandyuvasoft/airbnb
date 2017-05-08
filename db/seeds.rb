# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





AdminUser.where(email: 'admin@example.com').first_or_create do |admin_user|
  puts "creating admin user"
  AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end


degrees = ["D.Au.",  "D.B.H.",   "D.C.",   "D.C.M."   "D.P.M.",   "D.S.M.",  "D.W.S.",   "D.C.Sc.",   "D.D.S.",   "D.M.D.",   "D.Env.Sc.",   "D.H.A.",   "D.H.Sc."   ,"D.H.S.",   "D.M.",   "D.Min.",   "D.P.Th.",   "D.B.S.",    "DCOUN.",   "DEDMIN",   "D.N.P.",   "D.N.A.P.",   "D.O.",   "D.O.T.",   "D.P.A.",   "D.P.M.",   "D.P.S.",   "D.P.T.",   "D.Psy",   "Psy.D",    "Psy.D",   "D.S.L.P.",
"D.S.W.",   "D.V.M.",   "V.M.D.",   "J.D.",   "D.Jur.",   "M.D.",   "N.D.",   "N.M.D",   "O.D.",
"Pharm.D" ]

degrees.each do |degree|
  Degree.find_or_create_by(name: degree)
end

categories = ["Acupuncturist", "Allergist",  "Audiologist",  "Cardiologist",  "Chiropractor",  "Dentist",
 "Dermatologist",  "Dietitian",  "Doctor",  "Ear, Nose & Throat Doctor",  "Emergency Medicine Physician",
 "Endocrinologist",  "Endodontist",  "Eye Doctor",  "Family Physician",  "Gastroenterologist",  "Hand Surgeon",  "Hearing Specialist",  "Hematologist",  "Infectious Disease Specialist",  "Infertility  Specialist",  "Internist","Internist"  "Naturopathic Doctor",  "Nephrologist",  "Neurologist",
 "Neurosurgeon",  "Nurse Practitioner",  "Nutritionist",  "OB-GYN",  "Oncologist","Oncologist", 
 "Ophthalmologist",  "Optometrist",  "Oral Surgeon",  "Orthodontist",  "Orthopedic Surgeon",  "Pain Management Specialist",  "Pediatric Dentist",  "Pediatric Urgent Care Specialist",  "Pediatrician",
 "Periodontist",  "Physiatrist",  "Physical Therapist",  "Plastic Surgeon",  "Podiatrist",  "Prosthodontist",  "Psychiatrist",  "Psychologist",  "Psychotherapist",  "Pulmonologist",  "Radiologist",  "Rheumatologist",  "Sleep Medicine Specialist",  "Sports Medicine Specialist",  "Surgeon",
 "Therapists / Counselor",  "Travel Medicine Specialist"  "Urgent Care Specialist",  "Urologist", "Other"]

 categories.each do |category|
  Category.find_or_create_by(name: category)
end


relations = ['Mother', 'Father' ,'Brother' ,'Sister' ,'Son' ,'Daughter','Grandfather','Grandmother',
'Friend','Wife','Husband','Boyfriend','Girlfriend','Cousin','Aunt','Uncle','Grandson','Granddaughter',
'Stepson','Stepdaughter','Nephew','Niece','Patient','Other']


 relations.each do |relation|
  Relation.find_or_create_by(name: relation)
end