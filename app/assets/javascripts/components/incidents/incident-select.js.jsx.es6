class IncidentButtons extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'setOperational'
    )
  }

  setOperational() {
    let operational = true;
    if (this.props.operational) {
      operational = false;
    }
    this.props.setOperational({ operational: operational });
  }

  operationalButton() {
    let btnClass = 'btn-default';
    if (this.props.operational) {
      btnClass = 'btn-primary';
    }
    return (
        <span
          className={`btn btn-xs ${btnClass}`}
          onClick={this.setOperational}>
          operational only
        </span>
    );
  }

  render() {
    return (
      <div className="bottom-margin">
        <span
          className="btn btn-xs btn-primary"
          onClick={this.props.newIncident}>
          new incident period?
        </span>
        {this.operationalButton()}
      </div>
    );
  }
}

window.IncidentButtons = IncidentButtons;
