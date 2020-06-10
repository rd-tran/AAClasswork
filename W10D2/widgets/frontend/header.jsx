import React from 'react';

const Header = ({ tabs, selected, selectTab }) => (
  <ul id="tabs">
    {
      tabs.map( (tab, idx) => {
        return (
          <li
            key={idx}
            className={ idx === selected ? 'clicked' : 'unclicked'}
            onClick={ selectTab(idx) }>{tab.title}</li>
          )
      })
    }
  </ul>
);

export default Header;