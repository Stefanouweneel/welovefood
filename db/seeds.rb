# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Like.delete_all
Favorite.delete_all
Post.delete_all
User.delete_all

frank = User.create( email: 'frank@ex.com', password: 'abcd1234' )
alice = User.create( email: 'paul@work.net', password: 'abcd1234' )
anton = User.create( email: 'john@work.com', password: 'abcd1234' )

post1 = Post.create(title: "Hello We love food", description: "Eet smakelijk", user: frank)
post1.likes << Like.create(user: anton)

frank.followers << Follower.find(alice.id)
