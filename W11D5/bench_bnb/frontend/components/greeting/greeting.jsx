import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  const display =  currentUser ? (
    <div>
      <h2>Welcome {currentUser.username}</h2>
      <button onClick={logout}>Log Out</button>
    </div>
  ) : (
    <div>
      <Link to="/signup" className="button">Sign Up</Link>
      <Link to="/login" className="button">Log In</Link>
    </div>
  );
  
  return (
    <div className="greeting">
      {display}
    </div>
  );
};

export default Greeting;