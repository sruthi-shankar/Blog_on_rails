# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all()
User.delete_all()

NUM_OF_POSTS=50
NUM_OF_USERS=20
PASSWORD='supersecret'

super_user = User.create(
    first_name: "Tom",
    last_name: "hank",
    email: "th@madrid.gov",
    password: PASSWORD,
    is_admin: true 
   
)
NUM_OF_USERS.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    u=User.create(
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
        updated_at: created_at
    )

end
post=Post.all



puts Cowsay.say("Generated #{users.count} users", :sheep)
puts Cowsay.say("Generated #{post.count} posts", :stegosaurus)
