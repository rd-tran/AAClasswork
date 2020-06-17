import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const receiveSinglePokemon = (singlePokemon) => {
  return {
    type: RECEIVE_SINGLE_POKEMON,
    singlePokemon
  };
};

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  return APIUtil.fetchPokemon(pokemonId)
    .then( ({ pokemon, items }) => {
      return ( 
        dispatch(receiveSinglePokemon(pokemon))
      );
    }); 
};