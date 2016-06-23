# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Like.delete_all
Post.delete_all
User.delete_all

joy = User.create( email: 'joy@ex.com', password: 'joy123455' )
paul = User.create( email: 'paul@work.net', password: 'paul123455' )
john = User.create( email: 'john@work.com', password: 'john123455' )
dk = User.create( email:   'dk@work.com', password: 'dk123455' )

post1 = Post.create(title: "Hello We love food", description: "Eet smakelijk", user: joy)
post1.likes << Like.create(user: anton)

joy.followers << Follower.find(paul.id)
