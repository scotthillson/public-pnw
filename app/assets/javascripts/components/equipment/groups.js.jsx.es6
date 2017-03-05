class Groups extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'fieldChange',
      'newGroup',
      'saveGroup'
    );
    this.state = {
      groups: [],
      group: null
    };
  }

  componentDidMount() {
    this.loadGroups();
  }

  loadGroups(){
    $.ajax({
      method: 'GET',
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

  saveGroup() {
    let method = 'post';
    let url = '/groups';
    if (this.state.group.id) {
      method = 'patch';
      url = `/groups/${this.state.group.id}`;
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: this.state.group,
      success: (data) => {
        this.setState({ group: null }, this.loadGroups);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  destroyGroup() {
    $.ajax({
      method: 'delete',
      url: `/groups/${this.state.group.id}`,
      dataType: 'json',
      success: (data) => {
        this.setState({ group: null }, this.loadGroups);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  newGroup() {
    this.setState(
      { group: {} }
    );
  }

  cancelGroup() {
    this.setState({ group: null });
  }

  editGroup(e) {
    this.setState({ group: e });
  }

  fieldChange(field, e){
    let group = _.clone(this.state.group);
    group[field] = e.target.value;
    this.setState({ group: group });
  }

  group(group) {
    return (
      <tr key={group.id}>
        <td>{group.name}</td>
        <td>{group.local_name}</td>
        <td>
          <div
            className="btn btn-xs btn-warning"
            onClick={this.editGroup.bind(this, group)}>
            edit
          </div>
        </td>
      </tr>
    );
  }

  groups() {
    let groups = [];
    for (var group of this.state.groups) {
      groups.push(this.group(group));
    }
    return (
      groups
    );
  }

  render() {
    if (this.state.group) {
      return (
        <GroupForm
          cancel={this.cancelGroup}
          destroy={this.destroyGroup}
          fieldChange={this.fieldChange}
          group={this.state.group}
          save={this.saveGroup}
        />
      );
    }
    return (
      <table className="table">
        <thead>
          <tr>
            <th>Foreign Name</th>
            <th>Local Name</th>
            <th>
              <div
                className="btn btn-xs btn-success"
                onClick={this.newGroup}>
                new group
              </div>
            </th>
          </tr>
        </thead>
        <tbody>
          {this.groups()}
        </tbody>
      </table>
    );
  }

}

window.Groups = Groups;
