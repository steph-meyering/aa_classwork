import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js'
import Root from './components/root'
import allTodos from './reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");

    const store = configureStore();
    window.store = store;
    window.allTodos = allTodos
    
    ReactDOM.render(<Root store = {store} />, root);
});
