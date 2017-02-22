class Members extends ViewComponent {

  constructor() {
    super();
    this.state = {
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
        this.setState({ members: data, loading: false });
      },
      error: (jqXHR) => {
        this.setState({ error: true });
        console.log(jqXHR);
      }
    });
  }

  render() {
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
