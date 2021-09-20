# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


Program.delete_all
Review.delete_all
User.delete_all
Program.delete_all
Career.delete_all
University.delete_all

allstates = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 
                       'Dakota del Norte', 'Dakota del Sur', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 
                       'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 
                       'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska',
                       'Nevada', 'New Jersey', 'New York', 'New Hampshire', 'New México', 'North Carolina', 'Ohio',
                       'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'Tennessee', 'Texas', 
                       'Utah', 'Vermont', 'Virginia', 'Washington', 'Wisconsin', 'Wyoming'];  


medicine = Career.create!(career_name: "Medicina")
accounting = Career.create!(career_name: "Accounting")
mechanical_Engineering = Career.create!(career_name: "Mechanical Engineering")
systems_Engineering = Career.create!(career_name: "Systems Engineering")
chiropractic = Career.create!(career_name: "Chiropractic")
nursing = Career.create!(career_name: "Nursing")
information_Technology = Career.create!(career_name: "Information Technology")
electrical_Engineering = Career.create!(career_name: "Electrical Engineering")
artificial_Intelligence = Career.create!(career_name: "Artificial Intelligence")
medical_Dental = Career.create!(career_name: "Medical Dental")
education = Career.create!(career_name: "Education")
social_Work = Career.create!(career_name: "Social Work")
psychology = Career.create!(career_name: "Psychology")
communication = Career.create!(career_name: "Communication")
elementary_Education = Career.create!(career_name: "Elementary Education")

allcareers = [medicine, accounting, mechanical_Engineering, systems_Engineering, chiropractic, nursing, information_Technology,
              electrical_Engineering, artificial_Intelligence, medical_Dental, education, social_Work,psychology, communication,
              elementary_Education]

user = User.create!(username: "SSS", password_digest: "123")

20.times do
   university  = University.create!(
      name: Faker::University.name, 
      location: allstates.sample(),
    )
    university.careers << allcareers.sample()
    university.careers << allcareers.sample()
    university.careers << allcareers.sample()

    5.times do
        review = Review.create!(
            comment:Faker::Lorem.paragraph,
            user_id: user.id,
            university_id: university.id
        )
    end

end







