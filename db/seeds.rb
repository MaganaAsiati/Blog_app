# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
User.create(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.')

Post.create(author_id: 1, Title: 'Hello', Text: 'This my first post')
Post.create(author_id: 1, Title: 'Hello', Text: 'This my second post')
Post.create(author_id: 1, Title: 'Hello', Text: 'This my third post')
Post.create(author_id: 1, Title: 'Hello', Text: 'This my fourth post')

Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 1, author_id: 2, text: 'Hi Tom!' )

