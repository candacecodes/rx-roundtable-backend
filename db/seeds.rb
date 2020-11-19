
User.destroy_all
Rx.destroy_all
Selectedrx.destroy_all
Comment.destroy_all

#   create_table "users", force: :cascade do |t|
#     t.string "username"
#     t.string "password_digest"

User.create(username: "Username1", password_digest: "pw1")
User.create(username: "Username2", password_digest: "pw2")
User.create(username: "Username3", password_digest: "pw3")
User.create(username: "Username4", password_digest: "pw4")
User.create(username: "Username5", password_digest: "pw5")
User.create(username: "Username6", password_digest: "pw6")


#   create_table "rxes", force: :cascade do |t|
#     t.string "name"
Rx.create(name: 'rx1')
Rx.create(name: 'rx2')
Rx.create(name: 'rx3')
Rx.create(name: 'rx4')
Rx.create(name: 'rx5')
Rx.create(name: 'rx6')


#   create_table "comments", force: :cascade do |t|
#     t.string "description"
#     t.integer "user_id"
#     t.integer "rx_id"

Comment.create(description: 'Comment1', user_id: 1, rx_id: 1)
Comment.create(description: 'Comment2', user_id: 2, rx_id: 2)
Comment.create(description: 'Comment3', user_id: 3, rx_id: 3)
Comment.create(description: 'Comment4', user_id: 4, rx_id: 4)
Comment.create(description: 'Comment5', user_id: 5, rx_id: 5)


#   create_table "selectedrxes", force: :cascade do |t|
#     t.integer "user_id"
#     t.integer "rx_id"

Selectedrx.create(user_id: 1, rx_id: 1)
Selectedrx.create(user_id: 2, rx_id: 2)
Selectedrx.create(user_id: 3, rx_id: 2)
Selectedrx.create(user_id: 2, rx_id: 2)
Selectedrx.create(user_id: 5, rx_id: 2)

puts 'seeds done'