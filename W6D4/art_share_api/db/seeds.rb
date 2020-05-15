# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

candice = User.create(username: 'Candice')
ryan = User.create(username: 'Ryan')
vincent = User.create(username: 'Vincent van Gogh')
pablo = User.create(username: 'Pablo Picasso')
salvador = User.create(username: 'Salvador Dali')
michelangelo = User.create(username: 'Michelangelo')

horse = Artwork.create(
  title: 'horse',
  image_url: 'https://bit.ly/2Z4UuCq',
  artist_id: candice.id
)
ArtworkShare.create(artwork_id: horse.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: horse.id, viewer_id: salvador.id)
ArtworkShare.create(artwork_id: horse.id, viewer_id: michelangelo.id)
comment1 = Comment.create(body: "Beautiful horse", user_id: ryan.id, artwork_id: horse.id)
Like.create(user_id: ryan.id, likeable_id: horse.id, likeable_type: :Artwork)
Like.create(user_id: pablo.id, likeable_id: comment1.id, likeable_type: :Comment)
comment2 = Comment.create(body: "What a nice horse", user_id: pablo.id, artwork_id: horse.id)
Like.create(user_id: pablo.id, likeable_id: horse.id, likeable_type: :Artwork)
Like.create(user_id: ryan.id, likeable_id: comment2.id, likeable_type: :Comment)
Like.create(user_id: candice.id, likeable_id: comment2.id, likeable_type: :Comment)


tanjiro = Artwork.create(
  title: 'tanjiro',
  image_url: 'https://bit.ly/3fGXYkx',
  artist_id: ryan.id
)
ArtworkShare.create(artwork_id: tanjiro.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: tanjiro.id, viewer_id: vincent.id)
ArtworkShare.create(artwork_id: tanjiro.id, viewer_id: pablo.id)
ArtworkShare.create(artwork_id: tanjiro.id, viewer_id: michelangelo.id)

starry_night = Artwork.create(
  title: 'starry_night',
  image_url: 'https://bit.ly/2WSsXS1',
  artist_id: vincent.id
)
ArtworkShare.create(artwork_id: starry_night.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: starry_night.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: starry_night.id, viewer_id: salvador.id)

sunflowers = Artwork.create(
  title: 'sunflowers',
  image_url: 'https://bit.ly/3cxeodh',
  artist_id: vincent.id
)
ArtworkShare.create(artwork_id: sunflowers.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: sunflowers.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: sunflowers.id, viewer_id: michelangelo.id)

jacqueline = Artwork.create(
  title: 'jacqueline',
  image_url: 'https://bit.ly/3cHDjdW',
  artist_id: pablo.id
)
ArtworkShare.create(artwork_id: jacqueline.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: jacqueline.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: jacqueline.id, viewer_id: salvador.id)

memory = Artwork.create(
  title: 'memory',
  image_url: 'https://mo.ma/2T39rRE',
  artist_id: salvador.id
)
ArtworkShare.create(artwork_id: memory.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: memory.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: memory.id, viewer_id: pablo.id)

adam = Artwork.create(
  title: 'adam',
  image_url: 'https://bit.ly/3dLLdmG',
  artist_id: michelangelo.id
)
ArtworkShare.create(artwork_id: adam.id, viewer_id: candice.id)
ArtworkShare.create(artwork_id: adam.id, viewer_id: ryan.id)
