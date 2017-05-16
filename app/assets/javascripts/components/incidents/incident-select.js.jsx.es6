class IncidentSelect extends ViewComponent {

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

  incidents() {
    if (this.props.loading) {
      return(
        <span>Loading</span>
      );
    }
    if (this.props.incidents.length < 1 ) {
      return(
        <span>Create a new indicent period to begin a callout.</span>
      );
    }
    let incidents = [];
    for (var i of this.props.incidents) {
      incidents.push(
        <option key={i.id} value={i.id}>{i.reference}</option>
      );
    }
    return (
      <select
        className="form-control"
        onChange={this.props.selectIncident.bind(this)}>
        {incidents}
      </select>
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
        <span className="col-md-4 pull-right">
          {this.incidents()}
        </span>
      </div>
    );
  }
}

window.IncidentSelect = IncidentSelect;
