class Members extends ViewComponent {

  constructor() {
    super();
    this.state = {
      groups: [],
      members: [],
      loading: true,
      error: false
    };
  }

  componentDidMount() {
    this.loadMembers();
  }

  loadMembers() {
    $.ajax({
      method: 'get',
      url: '/members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data }, this.updateMembers);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateMembers() {
    $.ajax({
      method: 'get',
      url: '/update_members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data, loading: false }, this.loadGroups);
      },
      error: (jqXHR) => {
        this.setState({ error: true });
        console.log(jqXHR);
      }
    });
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

  render() {
    if (location.pathname == '/callout') {
      return (
        <Callout
          groups={this.state.groups}
          members={this.state.members}
        />
      );
    }
    return (
      <MemberRows
        error={this.state.error}
        loading={this.state.loading}
        members={this.state.members}
      />
    );
  }
}

window.Members = Members;
