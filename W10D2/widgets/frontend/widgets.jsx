import React from 'react';
import ReactDom from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

const tabsArr = [
  { title: "tab1", content: "this is the first tab" },
  { title: "tab2", content: "this is the second tab" },
  { title: "tab3", content: "this is the third tab" }
]
const Root = function() {
  return (
    <div>
      <Clock/>
      <Tabs tabs={ tabsArr }/>
    </div>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDom.render(<Root/>, root);
})