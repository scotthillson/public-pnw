class Callout extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'addRecipients',
      'dropRecipient',
      'getIncident',
      'newIncident'
    );
    this.state = {
      incident: { incident_members: [] },
      incidents: [],
      members: [],
      message: '',
      recipients: [],
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

  selectIncident(incident) {
    this.setState({ incident: incident });
  }

  addIncidentMembers(member_ids) {
    if (!this.state.incident.id) {
      return;
    }
    $.ajax({
      method: 'post',
      data: {member_ids: member_ids},
      url: `incidents/${this.props.incident.id}/add_members`,
      dataType: 'json',
      success: (data) => {
        this.setState({ incident: data }, this.props.getIncident);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  dropRecipient(r) {
    let newRecipients = _.clone(this.state.recipients);
    _.remove(newRecipients, {id: r.id});
    this.setState({ recipients: newRecipients });
  }

  addRecipients(recipients) {
    let newRecipients = _.clone(this.state.recipients);
    newRecipients.push.apply(newRecipients, recipients);
    this.setState({ recipients: newRecipients });
  }

  fieldChange(e) {
    this.setState({ message: e.target.value })
  }

  render() {
    return (
      <div className="callout">
        <Incidents
          addRecipients={this.addRecipients}
          getIncident={this.getIncident}
          incident={this.state.incident}
          incidents={this.state.incidents}
          members={this.state.members}
          newIncident={this.newIncident}
          recipients={this.state.recipients}
          selectIncident={this.selectIncident}
        />
        <NewMessage
        />
        <Recipients
          dropRecipient={this.dropRecipient}
          recipients={this.state.recipients}
        />
        <IncidentMembers
          getIncident={this.getIncident}
          incident={this.state.incident}
          members={this.state.members}
          recipients={this.state.recipients}
        />
      </div>
    );
  }
}

window.Callout = Callout;
