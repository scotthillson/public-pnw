class IncidentDashboard extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'addRecipients',
      'dropRecipient',
      'getIncident',
      'newIncident'
    );
    this.state = {
      error: false,
      groups: [],
      incident: { incident_members: [] },
      incidents: [],
      members: [],
      messages: [],
      recipients: []
    };
  }

  setMembers(members) {
    this.setState({ members: members });
  }

  setIncidents(incidents) {
    this.setState({ incidents: incidents });
  }

  setGroups(groups) {
    this.setState({ groups: groups });
  }

  sendMessageResult(data) {
    console.log(data);
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

  setMessages(messages) {
    this.setState({ messages: data, loading: false });
  }

  error() {
    this.setState({ error: true });
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
    if (this.state.incident.id) {
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

  render() {
    return (
      <div className="callout">
        <Incidents
          addRecipients={this.addRecipients}
          error={this.error}
          getIncident={this.getIncident}
          incident={this.state.incident}
          incidents={this.state.incidents}
          members={this.state.members}
          newIncident={this.newIncident}
          selectIncident={this.selectIncident}
          setGroups={this.setGroups}
          setIncidents={this.setIncidents}
        />
        <IncidentMembers
          error={this.error}
          setMembers={this.setMembers}
        />
        <NewMessage
          error={this.error}
          sendMessageResult={this.sendMessageResult}
        />
        <Messages
          error={this.error}
          setMessages={this.setMessages}
        />
        <Recipients
          dropRecipient={this.dropRecipient}
          recipients={this.state.recipients}
        />
      </div>
    );
  }
}

window.IncidentDashboard = IncidentDashboard;
