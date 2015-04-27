// an example JSX file for easy testing - run 'JsxCompile' to compile to JS

var Grid = React.createClass({
  render: function() {
    return <div>
      <GridCell>First</GridCell>
      <GridCell>Second</GridCell>
      <GridCell>Third</GridCell>
    </div>
  }
});

var GridCell = React.createClass({
  render: function() {
    return <div>{ this.props.children }</div>
  }
});
