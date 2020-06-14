import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveTodos, receiveTodo } from './actions/todo_actions';
import Root from './components/root';
import allTodos from './reducers/selectors'
import { fetchTodos } from './util/todo_api_util'

window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');
  const store = configureStore();
  window.store = store
  ReactDOM.render(<Root store={store}/>, root);
});