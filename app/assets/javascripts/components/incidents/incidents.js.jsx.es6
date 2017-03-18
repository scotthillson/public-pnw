class Incidents extends ViewComponent {

  constructor() {
    super();
    this.state = {
      operational: true
    };
  }

  componentDidMount() {
    this.loadIncidents();
  }

  loadIncidents() {
    $.ajax({
      method: 'get',
      url: 'incidents/active',
      dataType: 'json',
      success: (data) => {
        this.props.setIncidents(data);
      },
      error: (jqXHR) => {
        this.props.error();
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
        this.props.setIncident(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

  selectIncident(e) {
    return;
    this.props.setIncident(e);
  }

  addTeam(e) {
    let group = this.props.groups.find(team => team.id == e.target.value);
    if (!group) {
      return;
    }
    let recipients = [];
    for (var member of group.members) {
      if (!_.find(this.props.recipients, { id: member.id })) {
        if (this.state.operational) {
          if (member.status_id == 1) {
            recipients.push(member);
          }
        } else {
          recipients.push(member);
        }
      }
    }
    this.props.addRecipients(recipients);
  }

  loading() {
    if (this.props.error) {
      return (
        <span>
          <span>
            <i
              className="fa fa-exclamation-triangle"
              aria-hidden="true"
              title="problems updating">
            </i>
          </span>
          <span>error</span>
        </span>
      );
    }
    else if (this.props.groups.length < 1) {
      return (
        <span>
          <span>
            <i
              className="fa fa-spinner fa-pulse fa-fw"
              title="checking for updates">
            </i>
          </span>
          <span>loading</span>
        </span>
      );
    }
  }

  incidents() {
    if (this.props.incidents.length < 1) {
      return;
    }
    let incidents = [];
    for (var i of this.props.incidents) {
      incidents.push(
        <option key={i.id} value={i.reference} />
      );
    }
    return (
      <span className="col-md-4 pull-right">
        <select
          className="form-control"
          onChange={this.props.selectIncident.bind(this)}>
          {incidents}
        </select>
      </span>
    );
  }

  render() {
    return (
      <div>
        <IncidentSelect
          incidents={this.props.incidents}
          newIncident={this.newIncident}
          selectIncident={this.selectIncident}
        />
        <IncidentMembers
          error={this.props.error}
          members={this.props.members}
          recipients={this.props.recipients}
          operational={this.state.operational}
          setMembers={this.props.setMembers}
        />
        <IncidentGroups
          addRecipients={this.props.addRecipients}
          groups={this.props.groups}
          operational={this.props.operational}
          recipients={this.props.recipients}
          setGroups={this.props.setGroups}
        />
      </div>
    );
  }
}

window.Incidents = Incidents;
