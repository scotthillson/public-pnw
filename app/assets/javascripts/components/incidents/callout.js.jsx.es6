class Callout extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'getIncident',
      'newIncident'
    );
    this.state = {
      incident: { incident_members: [] },
      incidents: [],
      members: [],
      message: '',
      operational: false,
    };
  }

  componentDidMount() {
    this.loadMembers();
    this.loadIncidents();
  }

  loadMembers() {
    $.ajax({
      method: 'get',
      url: '/members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  loadIncidents() {
    $.ajax({
      method: 'get',
      url: 'incidents/active',
      dataType: 'json',
      success: (data) => {
        this.setState({ incidents: data }, this.firstIncident);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  newIncident() {
    $.ajax({
      method: 'post',
      url: 'incidents/create',
      dataType: 'json',
      success: (data) => {
        if (!data.incident_members){
          data.incident_members = [];
        }
        this.setState({ incident: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  getIncident() {
    if (!this.state.incident.id) {
      return;
    }
    $.ajax({
      method: 'get',
      url: `incidents/${this.state.incident.id}`,
      dataType: 'json',
      success: (data) => {
        this.setState({ incident: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  firstIncident() {
    if (this.state.incidents.length > 0) {
      this.setState({ incident: this.state.incidents[0] });
    }
  }

  fieldChange(e) {
    this.setState({ message: e.target.value })
  }

  render() {
    console.log(this.state.incident)
    return (
      <div className="callout">
        <Incident
          getIncident={this.getIncident}
          incident={this.state.incident}
          members={this.state.members}
          newIncident={this.newIncident}
        />
        <div className="row bottom-margin">
          <div className="col-md-12">
            <textarea
              rows={3}
              className="form-control top-margin"
              value={this.state.message}
              onChange={this.fieldChange.bind(this)}
            />
          </div>
        </div>
        <div className="row bottom-margin">
          <p>{150-this.state.message.length} characters remaining</p>
          <p>{this.state.incident.incident_members.length} recipients</p>
        </div>
          <Recipients
            getIncident={this.getIncident}
            incident={this.state.incident}
            members={this.state.members}
          />
      </div>
    );
  }
}

window.Callout = Callout;
