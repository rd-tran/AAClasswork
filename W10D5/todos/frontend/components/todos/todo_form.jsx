import React from 'react';
import uniqueId from '../../util/unique_id'

class TodoForm extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        id: uniqueId(),
        title: '',
        body: '',
        done: false
      };
      this.handleInput = this.handleInput.bind(this);
      this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(e) {
      switch (e.target.name) {
        case 'title':
          this.setState({title: e.target.value})
          break;
        case 'body':
          this.setState({ body: e.target.value })
          break;
        case 'done':
          this.setState({ done: e.target.checked } )
          break;                 
      }
    }

    handleSubmit(e) {
      e.preventDefault();
      this.props.receiveTodo(this.state);
      this.setState({
        id: uniqueId(),
        title: '',
        body: '',
        done: false
      });
    }

    render() {
      return (
        <form onSubmit={this.handleSubmit}>
          <label>Title
            <input
              type="text"
              name="title"
              onChange={this.handleInput}
              value={this.state.title}
            />
          </label>
          <br/>

          <label>Body
            <input 
              type="text" 
              name="body"
              onChange={this.handleInput}
              value={this.state.body}
            />
          </label>
          <br/>
          
          <label>Done
            <input 
              type="checkbox"
              name="done" 
              onChange={this.handleInput}
              checked={this.state.done}
            />
          </label>
          <br/>

          <button>Create Todo!</button>
        </form>
      )
    }
}

export default TodoForm;