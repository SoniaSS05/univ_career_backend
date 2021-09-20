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


Medicine = Career.create!(career_name: "Medicine")
Accounting = Career.create!(career_name: "Accounting")
Mechanical_Engineering = Career.create!(career_name: "Mechanical Engineering")
Systems_Engineering = Career.create!(career_name: "Systems Engineering")
Chiropractic = Career.create!(career_name: "Chiropractic")
Nursing = Career.create!(career_name: "Nursing")
Information_Technology = Career.create!(career_name: "Information Technology")
Electrical_Engineering = Career.create!(career_name: "Electrical Engineering")
Artificial_Intelligence = Career.create!(career_name: "Artificial Intelligence")
Medical_Dental = Career.create!(career_name: "Medical Dental")
Education = Career.create!(career_name: "Education")
Social_Work = Career.create!(career_name: "Social Work")
Psychology = Career.create!(career_name: "Psychology")
Communication = Career.create!(career_name: "Communication")
Elementary_Education = Career.create!(career_name: "Elementary Education")

allcareers = [Medicine, Accounting, Mechanical_Engineering, Systems_Engineering, Chiropractic, Nursing,
            Information_Technology, Electrical_Engineering, Artificial_Intelligence, Medical_Dental,
            Education, Social_Work, Psychology, Nursing, Communication, Elementary_Education ]

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







