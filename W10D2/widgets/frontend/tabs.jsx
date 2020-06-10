import React from 'react';
import Header from './header'

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selected: 0
    };

  }

  selectTab(index) {
    return () => this.setState({selected: index});
  }

  render() {
    const currentTab = this.props.tabs[this.state.selected];

    return (
      <div>
        <h1>Tabs</h1>

        <div>
          <Header
            tabs={this.props.tabs}
            selected={this.state.selected}
            selectTab={this.selectTab.bind(this)}/>

          <article id="tab-content">
            {currentTab.content}
          </article>
        </div>
      </div>
    )
  }
}