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
    $.ajax( {
      type: 'get',
      url: '/prospect_applications',
      context: this,
      dataType: 'json',
      success: (data) => {
        this.setState({ prospectApplications: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateApplication(applicaiton) {
    $.ajax( {
      type: 'patch',
      url: `/prospect_applications/${applicaiton.id}`,
      context: this,
      data: application,
      dataType: 'json',
      success: (data) => {
        this.setState({ prospectApplications: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  approve(application) {
    return true;
  }

  application(application) {
    let approved = <div
      onClick={this.approve}
      className="btn btn-xs btn-success"
      >approve
      </div>;
    if (application.approved_at) {
      approved = application.approved_at
    }
    return (
        <tr className="text-center" key={ application.id }>
          <td><a href={`/prospect_applications/${application.id}`}>{ application.name }</a></td>
          <td>{ application.email }</td>
          <td>{ application.created_at }</td>
          <td>{ application.status }</td>
          <td>{ approved }</td>
          <td>{ application.waiver_signed_at }</td>
          <td>{ application.dues_paid_at }</td>
          <td>{ application.photo_taken_at }</td>
        </tr>
    );
  }

  applications() {
    let prospectApplications = [];
    for (var application of this.state.prospectApplications) {
      prospectApplications.push(this.application(application));
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
            </tr>
          </thead>
          <tbody>
            {this.applications()}
          </tbody>
        </table>
      );
    }
  }
}

window.ProspectApplications = ProspectApplications;
