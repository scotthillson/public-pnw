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

  updateApplication(application) {
    $.ajax( {
      type: 'patch',
      url: `/prospect_applications/${application.id}`,
      context: this,
      data: application,
      dataType: 'json',
      success: (data) => {
        this.updateApplications(data);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateApplications(data) {
    let applications = _.clone(this.state.prospectApplications);
    let application = _.find(this.state.prospectApplications, {id: data.id});
    application = data;
    this.setState({ prospectApplications: applications });
  }

  now() {
    return moment(Date.now()).utcOffset(0).format('YYYY-MM-DDTHH:mm:ss');
  }

  approve(application) {
   application.approved_at = this.now();
   this.updateApplication(application);
 }

  sign(application) {
    application.waiver_signed_at = this.now();
    this.updateApplication(application);
  }

  pay(application) {
    application.dues_paid_at = this.now();
    this.updateApplication(application);
  }

  photo(application) {
    application.photo_taken_at = this.now();
    this.updateApplication(application);
  }

  create(application) {
    application.d4h = this.now();
    this.updateApplication(application);
  }

  approved(application) {
    if (application.approved_at) {
      return (
        moment(application.approved_at).format('YYYY-MM-DD-HHmm')
      );
    }
    return (
      <div
      className="btn btn-xs btn-success"
      onClick={this.approve.bind(this, application)}
      >approve
      </div>
    );
  }

  signed(application) {
    if (application.waiver_signed_at) {
      return (
        moment(application.waiver_signed_at).format('YYYY-MM-DD-HHmm')
      );
    }
    return (
      <div
      className="btn btn-xs btn-info"
      onClick={this.sign.bind(this, application)}
      >signed
      </div>
    );
  }

  paid(application) {
    if (application.dues_paid_at) {
      return (
        moment(application.dues_paid_at).format('YYYY-MM-DD-HHmm')
      );
    }
    return (
      <div
      className="btn btn-xs btn-success"
      onClick={this.pay.bind(this, application)}
      >paid
      </div>
    );
  }

  taken(application) {
    if (application.photo_taken_at) {
      return (
        moment(application.photo_taken_at).format('YYYY-MM-DD-HHmm')
      );
    }
    return (
      <div
      className="btn btn-xs btn-info"
      onClick={this.photo.bind(this, application)}
      >taken
      </div>
    );
  }

  created(application) {
    if (application.d4h) {
      return (
        moment(application.d4h).format('YYYY-MM-DD-HHmm')
      );
    }
    return (
      <div
      className="btn btn-xs btn-success"
      onClick={this.create.bind(this, application)}
      >taken
      </div>
    );
  }

  application(application) {
    return (
        <tr className="text-center" key={ application.id }>
          <td><a href={`/prospect_applications/${application.id}`}>{ application.name }</a></td>
          <td>{ application.email }</td>
          <td>{ moment(application.created_at).format('YYYY MM DD HHmm') }</td>
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
