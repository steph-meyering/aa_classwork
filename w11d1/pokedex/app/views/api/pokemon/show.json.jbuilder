json.pokemon do
    json.partial! 'api/pokemon/pokemon', poke: @pokemon
    json.extract! @pokemon, :item_ids
end
json.items do
    @pokemon.items.each do |item|
        json.set! item.id do    
            json.partial! 'api/items/item', item: item
        end
    end
end