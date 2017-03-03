class Groups extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'saveEquipment',
      'table',
      'setDetail',
      'setPrint',
      'setTeam'
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

  groups() {
    return (
      <div></div>
    );
  }

  render() {
    return (
      <div>
        {this.groups()}
      </div>
    );
  }

}

window.Groups = Groups;
