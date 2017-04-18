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

  approved(application) {
    if (application.approved_at) {
      return (application.approved_at);
    }
    return (
      <div
      className="btn btn-xs btn-success"
      >approve
      </div>
    );
  }

  signed(application) {
    if (application.approved_at) {
      return (application.waiver_signed_at);
    }
    return (
      <div
      className="btn btn-xs btn-info"
      >signed
      </div>
    );
  }

  paid(application) {
    if (application.dues_paid_at) {
      return (application.dues_paid_at);
    }
    return (
      <div
      className="btn btn-xs btn-success"
      >paid
      </div>
    );
  }

  taken(application) {
    if (application.photo_taken_at) {
      return (application.photo_taken_at);
    }
    return (
      <div
      className="btn btn-xs btn-info"
      >taken
      </div>
    );
  }

  application(application) {
    return (
        <tr className="text-center" key={ application.id }>
          <td><a href={`/prospect_applications/${application.id}`}>{ application.name }</a></td>
          <td>{ application.email }</td>
          <td>{ application.created_at }</td>
          <td>{ application.status }</td>
          <td>{ this.approved(application) }</td>
          <td>{ this.signed(application) }</td>
          <td>{ this.paid(application) }</td>
          <td>{ this.taken(application) }</td>
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
