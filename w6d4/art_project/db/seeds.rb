# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Artwork.destroy_all
    Artwork.create({
        "title": "Bald Boy",
        "image_url": "https://icdn.ensonhaber.com/resimler/diger/keloglan_simdi_ne_yapiyor_173.jpg",
        "artist_id": 2
    })
    Artwork.create({
        "title": "Tintin et Milou",
        "image_url": "https://dcdn.artquid.com/img/z.gif",
        "artist_id": 4
    })