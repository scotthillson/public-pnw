class IncidentGroups extends ViewComponent {

  componentDidMount() {
    this.loadGroups();
  }

  loadGroups() {
    $.ajax({
      method: 'get',
      url: '/groups',
      dataType: 'json',
      success: (data) => {
        this.props.setGroups(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

  addTeam(e) {
    let group = this.props.groups.find(team => team.id == e.target.value);
    if (!group) {
      return;
    }
    let recipients = [];
    for (var member of group.members) {
      if (!_.find(this.props.recipients, { id: member.id })) {
        if (this.props.operational) {
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

  groups() {
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

  render() {
    return (
      <span className="col-md-4">
        <select
          className="form-control"
          onChange={this.addTeam.bind(this)}
          value={0}>
          {this.groups()}
        </select>
      </span>
    );
  }

}

window.IncidentGroups = IncidentGroups;
