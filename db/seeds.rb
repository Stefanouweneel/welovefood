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

joy = User.create( name:"Joy DenHag" , email: 'joy@ex.com', password: 'joy123455' )
paul = User.create( name:"Paul Van Amsterdam", email: 'paul@work.net', password: 'paul123455' )
john = User.create( name:"John van Rotterdam", email: 'john@work.com', password: 'john123455' )
dk = User.create( name:"DK van Kaas", email:'dk@work.com', password: 'dk123455' )



post1 = Post.create(title: "Hello We love food", description: "Eet smakelijk", user: joy)
post1.likes << Like.create(user: paul)

joy.followers << Follower.find(paul.id)
