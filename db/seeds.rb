# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a couple of users
User.destroy_all
Investigator.destroy_all
Appointment.destroy_all

User.create!([
  {
    name: 'John Doe',
    email: 'jdoe@mail.com',
    admin: true,
    password: 'Password123#'
  },
  {
    name: 'Jack Doe',
    email: 'jackd@mail.com',
    password: 'Password123#'
  },
  {
    name: 'Jack Black',
    email: 'blackj@mail.com',
    password: 'Password123#'
  }
])

p "Created #{User.count} User records on the database"

Investigator.create!([
  {
    name: 'Investi Gator',
    photo: 'https://example.com/photo1.jpg',
    derscription: 'A true and mighty investigator, with a big mouth and a lot of teeth',
    fee: 69.69,
    rating: 5
  },
  {
    name: 'Investi Cat',
    photo: 'https://example.com/photo2.jpg',
    derscription: 'Small and cute, but with a big heart and a big appetite. Mainly for fish.',
    fee: 45.66,
    rating: 4
  },
  {
    name: 'Investi Dog',
    photo: 'https://example.com/photo3.jpg',
    derscription: 'With his tail wagging, he will sniff out the truth for you.',
    fee: 53.98,
    rating: 5
  }
])

p "Created #{Investigator.count} Investigator records on the database"
