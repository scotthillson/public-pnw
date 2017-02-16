class ProspectApplications extends ViewComponent{

  constructor() {
    super();
    this.state = {
      prospectApplications: []
    };
  }

  componentDidMount() {
    this.loadApplications();
  }

  loadApplications() {
    $.ajax({
      type: 'get',
      url: '/prospect_applications',
      context: this,
      dataType: 'json',
      success: (data) => {
        console.log(data);
        this.setState({ prospectApplications: data});
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
      });
  }

  listApplications() {
    let prospectApplications = [];
    for (var application of this.state.prospectApplications){
      prospectApplications.push(
        <tr className="text-center" key={application.id}>
          <td>{application.name}</td>
          <td>{application.email}</td>
          <td>{application.created_at}</td>
          <td>{application.status}</td>
          <td>{application.approved_at}</td>
          <td>{application.waiver_signed_at}</td>
          <td>{application.dues_paid_at}</td>
          <td>{application.photo_taken_at}</td>
          <td><div className="btn btn-xs btn-success">approve</div></td>
          <td><div className="btn btn-xs btn-success">approve</div></td>
        </tr>
      );
    }
    return prospectApplications;
  }

  render() {
    if (this.state.prospectApplications){
      return (
        <table className="table">
          <thead>
            <tr>
              <th className="text-center">Name</th>
              <th className="text-center">Email</th>
              <th className="text-center">Created</th>
              <th className="text-center">Status</th>
              <th className="text-center">Approved</th>
              <th className="text-center">Waiver Signed</th>
              <th className="text-center">Dues Paid</th>
              <th className="text-center">Photo Taken</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {this.listApplications()}
          </tbody>
        </table>
      );
    }
    return (
      <div>Loading!</div>
    );
  }
}

window.ProspectApplications = ProspectApplications;
