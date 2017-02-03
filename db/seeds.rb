require 'faker'


10.times do
  User.create!( :username => Faker::Ancient.god,
                :password   => 'password' )
end

30.times do
  Question.create!( :title => Faker::Hipster.sentence,
                    :description => Faker::Hipster.paragraph,
                    :user_id => rand(1..10)
                 )
end

30.times do
  Answer.create!( :description => Faker::Hacker.say_something_smart,
                  :user_id => rand(1..10),
                  :question_id => rand(1..30),
                 )
end
