var StarButton = React.createClass({
  propTypes: {
    numberValue: React.PropTypes.number,
    intialState: React.PropTypes.bool
  },

  getInitialState: function() {
    return { favourite: this.props.initialState };
  },

  updateRecord: function(newState) {
    var baseUrl = 'numbers/' + this.props.numberValue;

    if (newState) {
      $.post(baseUrl + '/add_favourite');
    } else {
      $.ajax({ url: baseUrl + '/remove_favourite', type: 'DELETE' });
    }
  },

  handleClick: function() {
    var newState = !this.state.favourite;

    this.setState({ favourite: newState });
    this.updateRecord(newState);
  },

  render: function() {
    var className = this.state.favourite ? 'glyphicon glyphicon-star' : 'glyphicon glyphicon-star-empty';

    return(
      <div onClick={this.handleClick} className="pointer">
        <span className={className}></span>
      </div>
    );
  }
});
