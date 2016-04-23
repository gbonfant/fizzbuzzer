var StarButton = React.createClass({
  getInitialState: function() {
    return { favourite: false };
  },

  handleClick: function() {
    var newState = !this.state.favourite;

    this.setState({ favourite: newState });
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
