var NumberElement = React.createClass({
  propTypes: {
    value: React.PropTypes.number,
    favourite: React.PropTypes.bool,
    fizzbuzz: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <span>{this.props.value}</span>
        <span>{this.props.fizzbuzz}</span>
        <span>{this.props.favourite}</span>
      </div>
    )
  }
});
