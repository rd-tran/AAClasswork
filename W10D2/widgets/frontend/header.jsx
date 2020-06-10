import React from 'react';

const Header = ({ tabs, selectTab }) => (
  <ul id="tabs">
    {
      tabs.map( (tab, idx) => {
        return (
          <h1
            key={idx}
            onClick={ selectTab(idx) }>{tab.title}</h1>
          )
      })
    }
  </ul>
);

export default Header;