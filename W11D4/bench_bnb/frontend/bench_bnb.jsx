import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root';

// Testing ajax calls
import { signup, login, logout } from './actions/session_actions';
import { fetchBenches } from './actions/bench_actions';
window.signup = signup;
window.login = login;
window.logout = logout;
window.fetchBenches = fetchBenches;

document.addEventListener("DOMContentLoaded", () => {
  let store;
  
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      },
      session: { id: window.currentUser.id }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }
    
  // Testing Start
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // Testing End
  
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);
});