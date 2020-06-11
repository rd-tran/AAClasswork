import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('main');
  ReactDOM.render(<Game/>, root);
});

// const root = document.getElementById('main');
// ReactDOM.render(<Game/>, root);
//using the defer method (tagged in html)