import React from 'react';

class PokemonIndex extends React.Component{
    
    constructor(props) {
       super(props);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }
    
    render() {
      let pokemon = this.props.pokemon;
        const pokemonItems = this.props.pokemon.map( poke => (
          <div>
            <h3>{poke.name}</h3>
            <img className="poke-img" src={poke.imageUrl}/>
          </div>
        ));

        return (
          <div>
            <h2>Pokemen</h2>
            <section className="pokedex">
              <ul>{pokemon}</ul>
            </section>
          </div>
        );
    }
}

export default PokemonIndex;