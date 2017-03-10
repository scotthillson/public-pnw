class Incident extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'addMemberByName',
      'keyUp',
      'operational',
      'operationalButton'
    );
    this.state = {
      groups: [],
      name: '',
      operational: true
    };
  }

  componentDidMount() {
    this.loadGroups()
  }

  loadGroups() {
    $.ajax({
      method: 'get',
      url: '/groups',
      dataType: 'json',
      success: (data) => {
        this.setState({ groups: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  addRecipients(member_ids) {
    if (!this.props.incident.id) {
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
    let group = this.state.groups.find(team => team.id == e.target.value);
    if (!group) {
      return;
    }
    let recipients = [];
    for (var member of group.members) {
      if (!this.props.incident.incident_members.includes(member.id)) {
        if (this.state.operational) {
          if (member.status_id == 1) {
            recipients.push(member.id);
          }
        } else {
          recipients.push(member.id);
        }
      }
    }
    this.addRecipients(recipients);
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
    else if (this.state.groups.length < 1) {
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
    for (var team of this.state.groups) {
      options.push(
        <option key={team.id}
          value={team.id}>
          {team.name}
        </option>
      );
    }
    return options;
  }

  members() {
    let options = [];
    for (var member of this.props.members) {
      let recipient = _.find(this.props.incident.incident_members, {id: member.id});
      if (!recipient) {
        if (this.state.operational) {
          if (member.status_id == 1) {
            options.push(
              <option key={member.id} value={member.name} />
            );
          }
        } else {
          options.push(
            <option key={member.id} value={member.name} />
          );
        }
      }
    }
    return (
      <datalist id="members">
        {options}
      </datalist>
    );
  }

  addMemberByName() {
    let name = this.state.name;
    let member = _.find(this.props.members, { name: name })
    if (member) {
      this.addRecipients([member.id]);
      this.setState({ name: '' });
    }
  }

  keyUp(e) {
    if (e.key === 'Enter') {
      this.addMemberByName();
    }
  }

  nameChange(e) {
    this.setState({ name: e.target.value });
  }

  render() {
    return (
      <div>
        <div className="margin-bottom">
          <span
            className="btn btn-xs btn-primary"
            onClick={this.props.newIncident}>
            new incident period
          </span>
          {this.operationalButton()}
        </div>
        <div className="col-md-6">
          <input
            className="form-control"
            list="members"
            onChange={this.nameChange.bind(this)}
            onKeyUp={this.keyUp}
            placeholder="members"
            type="text"
            value={this.state.name}
          />
        </div>
        {this.members()}
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

window.Incident = Incident;
