# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{name:"blog"},
															{name:"experiments"}])

roles = Role.create([{name:"super_admin"},
										 {name:"moderator"},
										 {name:"guest"}])

# create test user
test_user  = User.create(name:"test",email:"test@me.com", password:"password",password_confirmation:"password", role_id:1)
test_mod   = User.create(name:"test_moderator", email:"test_moderator@me.com", password:"password", password_confirmation:"password", role_id:2)
test_guest = User.create(name:"test_guest", email:"test_guest@me.com", password:"password", password_confirmation:"password", role_id:3)

# test posts

post_1 = Post.create(title:"test post 1", description:"first post to test the features of my blog", content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fermentum laoreet massa id euismod. Etiam ipsum ligula, tempor et vehicula tempus, lobortis a ligula. Aenean eget auctor velit. Aliquam ut fermentum nisl. Duis fringilla vulputate placerat. Sed volutpat dapibus dui. Aliquam et tortor id nibh luctus mattis. Duis ac orci nisi, et fermentum orci. Suspendisse ut urna non dolor vestibulum dapibus sit amet non justo. Praesent id purus tellus. Integer et massa non massa scelerisque dapibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed nisl nibh, fringilla in lacinia a, tincidunt et nunc.

Nulla sit amet purus eros, vel viverra sapien. Praesent odio risus, dictum nec suscipit sit amet, blandit ut turpis. Aenean felis urna, faucibus nec tristique vitae, venenatis vel augue. Praesent augue justo, interdum id iaculis molestie, suscipit et magna. Praesent posuere tristique ullamcorper. Etiam commodo elit sit amet diam dictum nec imperdiet sem sodales. Nunc egestas hendrerit dui eu egestas. Suspendisse at justo dolor.",
						user_id:test_user.id)
post_2 = Post.create(title:"test post 2", description:"second post to test thte features of my blog", content:"Pellentesque dolor erat, pulvinar vitae blandit sit amet, suscipit eget libero. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi non ullamcorper velit. Proin rhoncus suscipit eros quis eleifend. Sed posuere, risus at condimentum vehicula, leo nibh tincidunt ligula, a pulvinar ipsum est ac sem. Vestibulum eget neque risus. Vestibulum posuere adipiscing dictum. Pellentesque nisi massa, laoreet at pellentesque ut, lobortis pulvinar metus. Cras blandit velit vel est facilisis ultricies. Ut tristique lobortis diam, sed mattis purus aliquet vitae. Vivamus tincidunt semper metus in placerat. Praesent pulvinar mattis ipsum id imperdiet. Sed sed tellus elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
						user_id:test_user.id)
experiment_1 = Post.create(title:"test experiment 1", description:"first experiment post", content:"Suspendisse euismod posuere arcu, et aliquam sapien gravida in. Praesent viverra, eros et eleifend suscipit, sem erat hendrerit enim, quis cursus odio tortor vitae mauris. Etiam dapibus rutrum feugiat. Etiam hendrerit dolor vitae nisl adipiscing vitae suscipit diam consequat. Fusce at turpis velit, ut scelerisque enim. Praesent ultrices, nisi rutrum tempus scelerisque, tellus lectus mattis dui, vitae pellentesque nulla enim eget elit. Nunc eget arcu erat, id consequat tortor. Quisque vel ligula felis, quis rutrum lectus. Mauris vestibulum malesuada nisl, vitae auctor ipsum cursus quis. Quisque viverra tincidunt sapien at egestas. Cras aliquam consectetur dui non elementum. Donec dolor urna, posuere vel hendrerit sit amet, eleifend eu justo.",
						user_id:test_user.id)

CategorizedPost.create(category_id:categories[0], post_id:post_1.id)
CategorizedPost.create(category_id:categories[0], post_id:post_2.id)
CategorizedPost.create(category_id:categories[1], post_id:experiment_1.id)