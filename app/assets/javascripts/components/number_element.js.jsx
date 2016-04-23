var NumberElement = React.createClass({
  propTypes: {
    value: React.PropTypes.number,
    favourite: React.PropTypes.bool,
    fizzbuzz: React.PropTypes.string
  },

  render: function() {
    return (
      <tr>
        <td>{this.props.value}</td>
        <td>{this.props.fizzbuzz}</td>
        <td>{this.props.favourite}</td>
      </tr>
    )
  }
});
