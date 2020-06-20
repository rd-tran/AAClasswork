import React from 'react';

class BenchIndex extends React.Component {
  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    const { benches } = this.props;
    if (!Object.keys(benches).length) return null;
    
    return (
      <div>
        {
          benches.map( bench => {
            return (
              <ul key={bench.id}>
                <li>Description: {bench.description}</li>
                <li>Latitude: {bench.lat}</li>
                <li>Longitude: {bench.lng}</li>
              </ul>
            )
          })
        }
      </div>
    );
  }
}

export default BenchIndex;