import React from 'react';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) 
    {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  }

  render() {
    const { pokemon } = this.props;

    if (!pokemon) return null;

    return (
      <section className="pokemon-detail">
        <img src={pokemon.imageUrl}/>
        <br/>
        <h3>{pokemon.name}</h3>
        <span>Type: {pokemon.pokeType}</span>
        <span>Attack: {pokemon.attack}</span>
        <span>Defense: {pokemon.defense}</span>
        <span>Moves: {pokemon.moves.join(', ')}</span>
      </section>
    );
  }
}

export default PokemonDetail;