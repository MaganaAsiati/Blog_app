# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
User.create!(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.')

Post.create!(author_id: 1, Title: '1 Post ', Text: 'This is my first post Justo sit dolor gubergren magna rebum amet gubergren')
Post.create!(author_id: 1, Title: '2 post', Text: 'This is my second post asd sadipscing dolores lorem at rebum amet dolore ..')
Post.create!(author_id: 2, Title: '3 post', Text: 'This is my third post asd sadipscsadipscing dolores lorem at rebum amet dolore consetetur ')
Post.create!(author_id: 2, Title: '4 post', Text: 'This is my fourth post asd sadipscing dolores lorem at rebum amet dolore ')

Comment.create!(post_id: 1, author_id: 2, text: 'Hi Tom! nice post')
Comment.create!(post_id: 1, author_id: 1, text: 'Hi Lilly! This is awesome')
Comment.create!(post_id: 2, author_id: 1, text: 'Hi Lilly! I can\'t see the share button')
Comment.create!(post_id: 2, author_id: 2, text: 'Hi Tom! when are you publishing the next one')
Comment.create!(post_id: 3, author_id: 1, text: 'Hi Lilly! this is so inspiring')
Comment.create!(post_id: 3, author_id: 2, text: 'Hi Tom! I like this')
Comment.create!(post_id: 4, author_id: 1, text: 'Hi Lilly! Amazing work')
Comment.create!(post_id: 4, author_id: 2, text: 'Hi Tom! I need more of such writings') 



