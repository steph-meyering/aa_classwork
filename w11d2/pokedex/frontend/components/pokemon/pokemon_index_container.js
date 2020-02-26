import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';
import { selectAllPokemon } from '../../reducers/selectors';

const mapStateToProps = (state) => {
    return ({
        pokemon: selectAllPokemon(state)
    });
};

const mapDispatchToProps = (dispatch) => {
    return {
      requestAllPokemon: () => dispatch(requestAllPokemon())
    };
};
// debugger
export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);