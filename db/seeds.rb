# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
last_post = Post.last
first_post = Post.first
# create variations of last_post
[1, 2, 3].each do |inst|
  new_post = last_post.dup
  new_post.save
  new_post.image = last_post.image
  new_post.save
end

[1, 2, 3, 4, 5].each do |inst|
  new_post = first_post.dup
  new_post.save
  new_post.image = first_post.image
  new_post.save
end
