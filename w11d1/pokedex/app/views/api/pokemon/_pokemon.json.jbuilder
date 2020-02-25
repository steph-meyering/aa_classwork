json.extract! poke, :name, :attack, :defense, :poke_type, :moves
json.image_url asset_path("pokemon_snaps/#{poke.image_url}")

