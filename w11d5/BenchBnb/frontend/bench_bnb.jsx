import React from "react";
import ReactDOM from "react-dom";
import { login, logout, signup } from "./actions/sessions_actions";

import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () => {
  window.login = login;
  window.logout = logout;
  window.signup = signup;
  const store = configureStore()
  window.getState = store.getState
  window.dispatch = store.dispatch
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);

});
