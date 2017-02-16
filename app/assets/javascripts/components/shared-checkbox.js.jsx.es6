class SharedCheckbox extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'clickHandler',
    );
  }

  clickHandler() {
    this.props.clickHandler(this.props.field);
  }

  render() {
    if (this.props.checked.toString() == 'true') {
      return (
        <a className="btn btn-success" onClick={this.clickHandler}>
          <i className="fa fa-check"></i>
        </a>
      );
    }
    return (
      <a className="btn btn-danger" onClick={this.clickHandler}>Click to Agree</a>
    );
  }

}

window.SharedCheckbox = SharedCheckbox;
