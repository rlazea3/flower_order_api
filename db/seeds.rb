# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(username: 'user1', password: 'pass')
user2 = User.create(username: 'user2', password: 'pass')

Order.create([
    {
        user: user1,
        status: 'pending',
        quantity: 2,
        address: 'address1'
    },
    {
        user: user1,
        status: 'canceled',
        quantity: 2,
        address: 'address2'
    },
    {
        user: user2,
        status: 'delivered',
        quantity: 2,
        address: 'address3'
    },
    {
        user: user2,
        status: 'pending',
        quantity: 2,
        address: 'address2'
    }
])
