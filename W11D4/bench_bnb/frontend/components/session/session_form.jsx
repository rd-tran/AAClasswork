import React from 'react';
import { Redirect, Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(type) {
    return e => (
      this.setState({
        [type]: e.target.value
      })
    );
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    const type = (this.props.formType === 'login') ? 'Log In' : 'Sign Up';
    
    const sessionForm = (
      <form onSubmit={this.handleSubmit}>
        <label>Username:
          <input
            type="text"
            value={this.state.username}
            onChange={this.handleChange('username')}
          />
        </label>
        <br/>

        <label>Password:
          <input
            type="password"
            value={this.state.password}
            onChange={this.handleChange('password')}
          />
        </label>
        <br/>
        
        <button>Submit</button>
      </form>
    );

    const errors = (
      <ul>
        { this.props.errors.map( (error, idx) => <li key={idx}>{error}</li> )  }
      </ul>
    );
    
    return (
      <div className="session-form">
        { type }
        { sessionForm }
        { errors }
      </div>
    );
  }
}

export default SessionForm;