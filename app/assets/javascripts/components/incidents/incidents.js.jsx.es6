class Incidents extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'operational',
      'operationalButton'
    );
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

  operational() {
    let operational = true;
    if (this.state.operational) {
      operational = false;
    }
    this.setState({ operational: operational });
  }

  operationalButton() {
    let btnClass = 'btn-default';
    if (this.state.operational) {
      btnClass = 'btn-primary';
    }
    return (
        <span
          className={`btn btn-xs ${btnClass}`}
          onClick={this.operational}>
          operational only
        </span>
    );
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

  teams() {
    let options = [];
    options.push(
      <option key="0"
        value="0">
        Groups
      </option>
    );
    for (var team of this.props.groups) {
      options.push(
        <option key={team.id}
          value={team.id}>
          {team.name}
        </option>
      );
    }
    return options;
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
        <div className="bottom-margin">
          <span
            className="btn btn-xs btn-primary"
            onClick={this.props.newIncident}>
            new incident period?
          </span>
          {this.operationalButton()}
          {this.incidents()}
        </div>
        <Incident
          error={this.props.error}
          members={this.props.members}
          messages={this.props.messages}
          operational={this.operational}
          recipients={this.props.recipients}
          setMembers={this.props.setMembers}
        />
        <div className="col-md-6">
          <select
            className="form-control"
            onChange={this.addTeam.bind(this)}
            value={0}>
            {this.teams()}
          </select>
        </div>
      </div>
    );
  }
}

window.Incidents = Incidents;
