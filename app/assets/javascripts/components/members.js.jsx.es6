class Members extends ViewComponent {

  constructor() {
    super();
    this.state = {
      members: [],
      loading: true
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
        console.log(jqXHR);
      }
    });
  }

  memberRow(member) {
    let onCall = '';
    if (member.on_call && member.status_id == 1){
      onCall = <i className="fa fa-check" aria-hidden="true"></i>;
    }
    return (<tr key={member.d4h_id}>
      <td>{member.name}</td>
      <td>{member.mobile_phone}</td>
      <td>{member.email}</td>
      <td>{member.reference}</td>
      <td className="text-center">{onCall}</td>
      </tr>);
  }

  loading() {
    if (this.state.loading) {
      return (
        <img src="loading.gif" alt="loading" />
      ); 
    }
    return (
      'Operational On Call'
    )
  }

  render() {
    let members = [];
    //let onCall = _.filter(this.state.members, {on_call: true, status_id: 1}).length;
    for (var member of this.state.members){
      members.push(this.memberRow(member));
    }
    return (
      <table className="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Position</th>
            <th className="text-center">{this.loading()}</th>
          </tr>
        </thead>
        <tbody>
          {members}
        </tbody>
      </table>
    );
  }
}

window.Members = Members;
