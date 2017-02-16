class Members extends ViewComponent {

  constructor() {
    super();
    this.state = {
      members: []
    };
  }

  componentDidMount() {
    $.ajax({
      method: 'get',
      url: '/members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data });
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
  
  render() {
    if (this.state.members.length > 0){
      let members = [];
      let onCall = _.filter(this.state.members, {on_call: true, status_id: 1}).length;
      for (var member of this.state.members){
        members.push(this.memberRow(member));
      }
      return (<table className="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Position</th>
            <th className="text-center">Operational On Call</th>
          </tr>
        </thead>
        <tbody>
          {members}
        </tbody>
      </table>);
    }
    else {
      return(<h3>Loading!</h3>);
    }
  }
}

window.Members = Members;
