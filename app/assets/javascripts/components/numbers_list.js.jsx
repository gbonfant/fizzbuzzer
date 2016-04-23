var NumbersList = React.createClass({
  getInitialState: function() {
    return {
      numbers: []
    };
  },

  componentDidMount: function() {
    this.serverRequest = $.get('numbers', function(result) {
      this.setState({ numbers: result.numbers });
    }.bind(this));
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return(
      <table className="table">
        <thead>
          <tr>
            <th>Number</th>
            <th>FizzBuzz?</th>
            <th>Favourite</th>
          </tr>
        </thead>
        <tbody>
          {this.state.numbers.map(function(number) {
            return <NumberElement key={number.value} value={number.value}
              favourite={number.favourite} fizzbuzz={number.fizz_buzz} />;
          })}
        </tbody>
      </table>
    )
  }
});
