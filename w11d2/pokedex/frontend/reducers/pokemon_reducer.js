import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions";

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            nextState = action.pokemon;
            return nextState;
        default:
            return nextState;
    }
};



export default pokemonReducer;