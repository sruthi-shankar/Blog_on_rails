Post.delete_all()
Comment.delete_all()
User.delete_all()



NUM_OF_POSTS=100
NUM_OF_USERS=200
PASSWORD="supersecret"

super_user = User.create(
    first_name: "Jon",
    last_name: "Snow",
    email: "js@winterfell.gov",
    password: PASSWORD, 
    #is_admin: true
)

NUM_OF_USERS.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end
users=User.all

NUM_OF_POSTS.times do
    created_at = Faker::Date.backward(days: 365)
    p= Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: created_at, 
        updated_at: created_at,
        user: users.sample
      
    )
    if p.valid?
        p.comments=rand(0..15).times.map do
            Comment.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
            )
        end

    end
end

posts=Post.all 
comments=Comment.all 

puts Cowsay.say("Generated #{posts.count} posts", :stegosaurus)
puts Cowsay.say("Generated #{comments.count} comments", :sheep)
puts Cowsay.say("Generated #{users.count} users", :sheep)



