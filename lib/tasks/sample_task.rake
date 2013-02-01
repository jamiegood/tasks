namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_tasks
  end
end

def make_users
    10.times do |n|
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!( email: email,
                   password: 'foobar')
    end
end


def make_tasks  
  users = User.all(limit: 6)
  10.times do
    name = Faker::Lorem.sentence(5)
    users.each { |user| user.tasks.create!(name: name) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end
