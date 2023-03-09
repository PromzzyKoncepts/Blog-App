# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://avatars.githubusercontent.com/u/69632681?v=4', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Promise Okechukwu', photo: 'https://avatars.githubusercontent.com/u/69632681?v=4', bio: 'Software developer | UI/UX | Graphics designer')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'Good bye', text: 'I cant believe i am counting')
third_post = Post.create(author: first_user, title: 'My First Blog', text: 'Mind your business')
fourth_post = Post.create(author: second_user, title: 'How to lambano Gods Blessings', text: 'Okay, I am done')
fifth_post = Post.create(author: third_user, title: 'Becoming a Full-Stack Developer in 6months', text: 'I am going to teach you how you can become a software developer in just 6months, covering HTML, CSS, JS, React, Ruby, Rails')
sixth_post = Post.create(author: third_user, title: 'How to overcome depression', text: 'Heres five ways to do so')

Comment.create(post: first_post, author: first_user, text: 'Hi Tom!, I am trying to reach out to you' )
Comment.create(post: second_post, author: second_user, text: 'How come you are obsessed with me' )
Comment.create(post: third_post, author: first_user, text: 'I am not moved, I dont care at all' )
Comment.create(post: Post.first, author: User.first, text: 'I am not moved, I dont care at all' )
