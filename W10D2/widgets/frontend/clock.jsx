import React from 'react';

export default class Clock extends React.Component {
  constructor() {
    super();
    this.state = {time: new Date()}
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  render() {
    const hours = this.state.time.getHours();
    const minutes = this.state.time.getMinutes();
    const seconds = this.state.time.getSeconds();
    const date = this.state.time.toDateString();

    return (
      <div id="clock">
        <h1>Clock:</h1>
        <br/>

        <p key="time">
          <span>Time:</span>
          <span>{hours}:{minutes}:{seconds}</span>
        </p>
        
        <p key="date">
          <span>Date:</span>
          <span>{date}</span>
        </p>
      </div>
    );
  }
}