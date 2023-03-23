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
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A true and mighty investigator, with a big mouth and a lot of teeth',
    fee: 69.69,
    rating: 5
  },
  {
    name: 'Investi Cat',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'Small and cute, but with a big heart and a big appetite. Mainly for fish.',
    fee: 45.66,
    rating: 4
  },
  {
    name: 'Investi Dog',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'With his tail wagging, he will sniff out the truth for you.',
    fee: 53.98,
    rating: 5
  },
  {
    name: 'Investi Goat',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'The G.O.A.T. of investigators with a nose for the truth. He will eat anything, but he will not eat your lies.',
    fee: 36.88,
    rating: 5
  },
  {
    name: 'Investi Ghost',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A ghostly investigator who will haunt you until you tell the truth.',
    fee: 77.66,
    rating: 4
  },
  {
    name: 'Investi Moth',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A moth who will fly into the darkest corners of your mind to find the truth.',
    fee: 22.22,
    rating: 4
  },
  {
    name: 'Investi Raptor',
    photo: 'hhttps://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A raptor who will hunt you down until you tell the truth.',
    fee: 38.99,
    rating: 5
  },
  {
    name: 'Investi Grass Owl',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A grass owl who will hide in the grass and wait for you to tell the truth. Not super effective.',
    fee: 19.99,
    rating: 3
  },
  {
    name: 'Investi Gecko',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A gecko who will climb the walls of your mind to find the truth. He will also eat your flies (not your files)',
    fee: 46.22,
    rating: 5
  },
  {
    name: 'Investi Gazelle',
    photo: 'https://cdn.pixabay.com/photo/2021/02/21/18/05/cat-6037355_1280.png',
    description: 'A gazelle who will run circles around you until you tell the truth. She is tireless.',
    fee: 72.19,
    rating: 5
  }
])

p "Created #{Investigator.count} Investigator records on the database"
