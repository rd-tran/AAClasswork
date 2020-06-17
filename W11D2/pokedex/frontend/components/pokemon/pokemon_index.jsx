import React from 'react';
import { Route } from 'react-router-dom';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    
    if (!pokemon.length) return null;

    return (
      <section className="pokedex">
        <ul className="pokemon-index-list">
          {
            pokemon.map(pokemon => (
              <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
            ))
          }
        </ul>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer}/>
      </section>
    )
  }
}

export default PokemonIndex