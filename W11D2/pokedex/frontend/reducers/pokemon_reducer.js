import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {} , action) => {
  Object.freeze(state);
  const newState = Object.assign( {}, state );

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_SINGLE_POKEMON:
      newState[action.singlePokemon.id] = action.singlePokemon;
      return newState; 
    default:
      return state;
  }
};

export default pokemonReducer;
