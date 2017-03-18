class Incident extends ViewComponent {

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
      let recipient = _.find(this.props.recipients, {id: member.id});
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
      this.addMembers([member.id]);
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
        <Responders
          error={this.props.error}
          members={this.props.members}
          messages={this.props.messages}
          operational={this.operational}
          recipients={this.props.recipients}
          setMembers={this.props.setMembers}
        />
      </div>
    );
  }
}

window.Incident = Incident;
