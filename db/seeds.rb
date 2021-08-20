# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Cleaning database..."
VideoGenre.destroy_all
Genre.destroy_all
RentalRequest.destroy_all
Wishlist.destroy_all
VideoGame.destroy_all
User.destroy_all

puts "Generating default genres..."

action = Genre.create!(name: "action")
sci_fi = Genre.create!(name: "sci-fi")
horror = Genre.create!(name: "horror")
thriller = Genre.create!(name: "thriller")
mystery = Genre.create!(name: "mystery")
crime = Genre.create!(name: "crime")
animation = Genre.create!(name: "animation")
adventure = Genre.create!(name: "adventure")
fantasy = Genre.create!(name: "fantasy")
superhero = Genre.create!(name: "superhero")


puts "16 genres generated successfully!"

puts "Creating users..."
user1 = User.create(first_name: "Lolo", last_name: "Ng", email: "lo@hello.com", password: "123456", avatar: "https://media.redadn.es/imagenes/god-of-war-ps4_331995.jpg")

user2 = User.create(first_name: "Perla", last_name: "BD", email: "pe@hello.com", password: "123456", avatar: "https://i.blogs.es/728d0c/ellen1/450_1000.jpg")

user3 = User.create(first_name: "Juan", last_name: "HG", email: "ju@hello.com", password: "123456", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB2LKfTmAxV_VWu60tCftQpOIMJ9TcdhVc9w&usqp=CAU")

user4 = User.create(first_name: "Lucia", last_name: "IH", email: "lu@hello.com", password: "123456", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT54NIDcr0hpyZ_Q57f8HJPBeK4BqSfwN2OCg&usqp=CAU")


puts "4 users successfully created!"

puts "Creating video games..."

video1 = VideoGame.create(title: "Detroit: Become Human", year: "2020", description: "¿Qué ocurriría si la tecnología se rebelara? ¿Si los androides empezaran a sentirse humanos? ¿Si quisieran liberarse de las cadenas impuestas por sus amos? Esa es la premisa de Detroit: Become Human, la hasta ahora obra más reciente del estudio Quantic Dream", price: 1000, cover_photo: "https://as01.epimg.net/meristation/imagenes/2020/07/25/reportajes/1595672434_811833_1595700226_sumario_normal.jpg", user_id: user1.id)


video2 = VideoGame.create(title: "Marvel's Spider-Man", year: "2020" ,description: "Un gran poder conlleva una gran responsabilidad. Eso es precisamente el peso que Insomniac Games tuvo que cargar sobre sus hombros, la responsabilidad de ofrecer un producto que contentara a los fans del trepamuros y a los desconocedores de la obra del fallecido Stan Lee", price: 1000, cover_photo: "https://as01.epimg.net/meristation/imagenes/2020/07/25/reportajes/1595672434_811833_1595700566_sumario_normal.jpg", user_id: user1.id)



video3 = VideoGame.create(title: "Shadow of the Colossus", year: "2020" ,description: "Wander está solo en el mundo. Una mujer yace muerta e inerte, por lo que nuestro protagonista tratará de revivirla a toda costa. Shadow of the Colossus se vale de la introspección, de la música, de lo que uno ve en pantalla para narrar una historia de fantasía preñada de humanidad y de sentimientos", price: 1000, cover_photo: "https://as01.epimg.net/meristation/imagenes/2020/07/25/reportajes/1595672434_811833_1595700672_sumario_normal.jpg", user_id: user1.id)



video4 = VideoGame.create(title: "Persona 5 Royal", year: "2020" ,description: "Persona 5 Royal es un juego largo, larguísimo, un viaje de fantasía ambientado en Tokio, con localizaciones reales, pero con un universo de ficción entreverado.", price: 1000, cover_photo: "https://as01.epimg.net/meristation/imagenes/2020/07/25/reportajes/1595672434_811833_1595700744_sumario_normal.jpg", user_id: user1.id)


video5= VideoGame.create(title: "Uncharted 4: El Desenlace del Ladrón", year: "2020", description: "Uncharted 4: El Desenlace del Ladrón es todo lo de los juegos anteriores pero multiplicado. Introduce partes de mundo abierto y una historia más extensa. Por todo ello, se ha convertido en uno de los preferidos de la redacción de MeriStation.", price: 1000, cover_photo: "https://as01.epimg.net/meristation/imagenes/2020/07/25/reportajes/1595672434_811833_1595700817_sumario_normal.jpg", user_id: user1.id)


puts "15 video cassettes successfully created!"

puts "Creating rental requests..."
RentalRequest.create!(message: "Hi im testing request 1", start_date: "2021-07-25", end_date: "2021-08-25", video_game_id: video1.id, user_id: user1.id)
RentalRequest.create!(message: "Hi im testing request 2", start_date: "2021-07-25", end_date: "2021-08-25", video_game_id: video2.id, user_id: user1.id)
RentalRequest.create!(message: "Hi im testing request 3", start_date: "2021-07-25", end_date: "2021-08-25", video_game_id: video3.id, user_id: user1.id)
RentalRequest.create!(message: "Hi im testing request 4", start_date: "2021-07-25", end_date: "2021-08-25", video_game_id: video4.id, user_id: user4.id)


puts "4 rental requests successfully created!"

puts "Creating wishlists..."
Wishlist.create!(user_id: user1.id, video_game_id: video1.id)
Wishlist.create!(user_id: user1.id, video_game_id: video2.id)
Wishlist.create!(user_id: user1.id, video_game_id: video3.id)
Wishlist.create!(user_id: user2.id, video_game_id: video4.id)
Wishlist.create!(user_id: user4.id, video_game_id: video5.id)


puts "12 wishlists successfully created!"

puts "Linking genres to game..."

VideoGenre.create!(genre: action, video_game_id: video2.id)
VideoGenre.create!(genre: fantasy, video_game_id: video3.id)

VideoGenre.create!(genre: adventure, video_game_id: video5.id)

VideoGenre.create!(genre: fantasy, video_game_id: video4.id)


VideoGenre.create!(genre: mystery, video_game_id: video1.id)




puts "Linking genres to game successful!"


puts "All seeds are done! "
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?