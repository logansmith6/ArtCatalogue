# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create(full_name: 'bob', email: 'bob@gmail.com', password: 'pass')
bob.posts.build(title: 'test', rating: 5).image.attach(io: File.open('app/assets/images/unnamed.png'), filename: 'unnamed.png', content_type: 'image/png', artist_name: 'leo')



#painting1

