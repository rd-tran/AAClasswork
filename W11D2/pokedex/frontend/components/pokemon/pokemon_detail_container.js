import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';


const mapStateToProps = (state, ownProps) => {
  const pokemon = state.entities.pokemon[ownProps.match.params.pokemonId];

  return {
    pokemon
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    requestSinglePokemon: (pokemonId) => (
      dispatch(requestSinglePokemon(pokemonId))
    )
  }
}


export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);