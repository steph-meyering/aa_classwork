import React from 'react';
import ReactDOM from "react-dom";
import configureStore from './store/store';
import {requestAllPokemon} from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => { 
    const root = document.getElementById("root");
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, root);

});

