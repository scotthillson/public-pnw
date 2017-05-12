class ReviewProspectApplication extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'approve',
      'sign',
      'pay',
      'photo',
      'create',
      'destroy',
      'updateApplication'
    );
    this.state = {
      application: {},
      fields: {}
    }
  }

  componentDidMount() {
    this.setState({ fields: this.props.fields, application: this.props.application });
  }

  updateApplication(application) {
    $.ajax( {
      type: 'patch',
      url: `/prospect_applications/${this.props.application.id}`,
      context: this,
      data: application,
      dataType: 'json',
      success: (data) => {
        this.setState({ application: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  now() {
    return moment(Date.now()).utcOffset(0).format('YYYY-MM-DDTHH:mm:ss');
  }

  approve() {
    let application = _.clone(this.state.application);
    application.approved_at = this.now();
    this.updateApplication(application);
  }

  sign() {
    let application = _.clone(this.state.application);
    application.waiver_signed_at = this.now();
    this.updateApplication(application);
  }

  pay() {
    let application = _.clone(this.state.application);
    application.dues_paid_at = this.now();
    this.updateApplication(application);
  }

  photo() {
    let application = _.clone(this.state.application);
    application.photo_taken_at = this.now();
    this.updateApplication(application);
  }

  create() {
    let application = _.clone(this.state.application);
    application.d4h = this.now();
    this.updateApplication(application);
  }

  destroy() {
    let application = _.clone(this.state.application);
    return true;
  }

  approved() {
    if (this.state.application.approved_at) {
      return (
        <div className="btn-sm btn-default">
          {`Approved ${moment(this.state.application.approved_at).format('YYYY-MM-DD-HHmm')}`}
        </div>
      );
    }
    return (
      <div
        onClick={this.approve}
        className="btn-sm btn-success btn-space">
        Approve
      </div>
    );
  }

  signed() {
    if (this.state.application.waiver_signed_at) {
      return (
        <div className="btn-sm btn-default">
          {`Waiver signed ${moment(this.state.application.waiver_signed_at).format('YYYY-MM-DD-HHmm')}`}
        </div>
      );
    }
      return (
      <div
        onClick={this.sign}
        className="btn-sm btn-info btn-space">
        Waiver Signed
      </div>
    );
  }

  paid() {
    if (this.state.application.dues_paid_at) {
      return (
        <div className="btn-sm btn-default">
          {`Dues paid ${moment(this.state.application.dues_paid_at).format('YYYY-MM-DD-HHmm')}`}
        </div>
      );
    }
    return (
      <div
        onClick={this.pay}
        className="btn-sm btn-success btn-space">
        Dues Paid
      </div>
    );
  }

  taken() {
    if (this.state.application.photo_taken_at) {
      return (
        <div className="btn-sm btn-default">
          {`Photo taken ${moment(this.state.application.photo_taken_at).format('YYYY-MM-DD-HHmm')}`}
        </div>
      );
    }
    return (
      <div
        onClick={this.photo}
        className="btn-sm btn-info btn-space">
        Photo Taken
      </div>
    );
  }

  created() {
    if (this.state.application.d4h) {
      return (
        <div className="btn-sm btn-default">
          {`D4H created ${moment(this.state.application.d4h).format('YYYY-MM-DD-HHmm')}`}
        </div>
      );
    }
    return (
      <div
        onClick={this.create}
        className="btn-sm btn-success btn-space">
        D4H created
      </div>
    );
  }

  deleted() {
    return (
      <div className="btn-sm btn-default">
      </div>
    );
  }

  render(){
    return (
      <div className="form-container regular-form">
        <div className="col-md-12">
          <p className="lead text-center">New Membership Application</p>
        </div>
        <form className="col-md-12 form-horizontal" role="form">
          <div className="row form-group">
            <div className="col-md-6">
              <label>Your Name</label>
              <div>
                <input
                  name="name"
                  className="form-control"
                  placeholder="first and last name"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['name']}
                />
              </div>
            </div>
            <div className="col-md-6">
              <label>Date of Birth</label>
              <div>
                <input
                  name="birthday"
                  className="form-control"
                  type="date"
                  readOnly="true"
                  value={this.props.fields['birthday']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-12">
              <label>Your email</label>
              <div>
                <input
                  name="email"
                  className="form-control"
                  placeholder="moreinfo@pnwsar.org"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['email']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-4">
              <label>Mobile Phone</label>
              <div>
                <input
                  name="mobilePhone"
                  className="form-control"
                  type="text"
                  placeholder="555-555-5555"
                  readOnly="true"
                  value={this.props.fields['mobilePhone']}
                />
              </div>
            </div>
            <div className="col-md-4">
              <label>Home Phone</label>
              <div>
                <input
                  name="homePhone"
                  className="form-control"
                  type="text"
                  placeholder="555-555-5555"
                  readOnly="true"
                  value={this.props.fields['homePhone']}
                />
              </div>
            </div>
            <div className="col-md-4">
              <label>Work Phone</label>
              <div>
                <input
                  name="workPhone"
                  className="form-control"
                  type="text"
                  placeholder="555-555-5555"
                  readOnly="true"
                  value={this.props.fields['workPhone']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-7">
              <label>Address</label>
              <div>
                <input
                  name="address"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['address']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>City</label>
              <div>
                <input
                  name="city"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['city']}
                />
              </div>
            </div>
            <div className="col-md-1">
              <label>State</label>
              <div>
                <input
                  name="addressState"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['addressState']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>ZIP</label>
              <div>
                <input
                  name="postal"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['postal']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-6">
              <label>Employer</label>
              <div>
                <input
                  name="employer"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['employer']}
                />
              </div>
            </div>
            <div className="col-md-6">
              <label>Job Title</label>
              <div>
                <input
                  name="job"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['job']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-4">
              <label>Emergency Contact</label>
              <input
                name="emergencyOne"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyOne']}
              />
            </div>
            <div className="col-md-4">
              <label>Phone Number</label>
              <input
                name="emergencyPhoneOne"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyPhoneOne']}
              />
            </div>
            <div className="col-md-4">
              <label>Relationship</label>
              <input
                name="emergencyRelationshipOne"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyRelationshipOne']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-4">
              <label>Emergency Contact</label>
              <input
                name="emergencyTwo"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyTwo']}
              />
            </div>
            <div className="col-md-4">
              <label>Phone Number</label>
              <input
                name="emergencyPhoneTwo"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyPhoneTwo']}
              />
            </div>
            <div className="col-md-4">
              <label>Relationship</label>
              <input
                name="emergencyRelationshipTwo"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['emergencyRelationshipTwo']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-8">
              <label>Personal Reference</label>
              <div>
                <input
                  name="referenceOne"
                  className="form-control"
                  placeholder="first and last name"
                  readOnly="true"
                  value={this.props.fields['referenceOne']}
                  type="text"
                />
              </div>
            </div>
            <div className="col-md-4">
              <label>Phone Number</label>
              <input
                name="referencePhoneOne"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['referencePhoneOne']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-7">
              <label>Address</label>
              <div>
                <input
                  name="referenceAddressOne"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceAddressOne']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>City</label>
              <div>
                <input
                  name="referenceCityOne"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceCityOne']}
                />
              </div>
            </div>
            <div className="col-md-1">
              <label>State</label>
              <div>
                <input
                  name="referenceStateOne"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceStateOne']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>ZIP</label>
              <div>
                <input
                  name="referencePostalOne"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referencePostalOne']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-8">
              <label>Personal Reference</label>
              <div>
                <input
                  name="referenceTwo"
                  className="form-control"
                  placeholder="first and last name"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceTwo']}
                />
              </div>
            </div>
            <div className="col-md-4">
              <label>Phone Number</label>
              <input
                name="referencePhoneTwo"
                className="form-control"
                type="text"
                readOnly="true"
                value={this.props.fields['referencePhoneTwo']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-7">
              <label>Address</label>
              <div>
                <input
                  name="referenceAddressTwo"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceAddressTwo']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>City</label>
              <div>
                <input
                  name="referenceCityTwo"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceCityTwo']}
                />
              </div>
            </div>
            <div className="col-md-1">
              <label>State</label>
              <div>
                <input
                  name="referenceStateTwo"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceStateTwo']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>ZIP</label>
              <div>
                <input
                  name="referencePostalTwo"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referencePostalTwo']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-8">
              <label>Personal Reference</label>
              <div>
                <input
                  name="referenceThree"
                  className="form-control"
                  placeholder="first and last name"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceThree']}
                />
              </div>
            </div>
            <div className="col-md-4">
              <label>Phone Number</label>
              <input
                name="referencePhoneThree"
                className="form-control"
                type="text"
                readOnly="true"
                  value={this.props.fields['referencePhoneThree']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-7">
              <label>Address</label>
              <div>
                <input
                  name="referenceAddressThree"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceAddressThree']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>City</label>
              <div>
                <input
                  name="referenceCityThree"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceCityThree']}
                />
              </div>
            </div>
            <div className="col-md-1">
              <label>State</label>
              <div>
                <input
                  name="referenceStateThree"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referenceStateThree']}
                />
              </div>
            </div>
            <div className="col-md-2">
              <label>ZIP</label>
              <div>
                <input
                  name="referencePostalThree"
                  className="form-control"
                  type="text"
                  readOnly="true"
                  value={this.props.fields['referencePostalThree']}
                />
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-md-2">
              <SharedBoolean
                currentValue={this.props.fields['physicalShape']}
                readOnly="true"
              />
            </div>
            <div className="col-md-10 height-control">
              <label>Do you have any relevant medical conditions?</label>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-12">
              <label>If yes, please explain</label>
              <div>
                <input
                  name="explainPhysical"
                  type="text"
                  className="form-control"
                  readOnly="true"
                  value={this.props.fields['explainPhysical']}
                />
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-md-2">
              <SharedBoolean
                currentValue={this.props.fields['firstAid']}
                readOnly="true"
              />
            </div>
            <div className="col-md-3 height-control">
              <label>Do you have a first aid/CPR card?</label>
            </div>
            <div className="col-md-2 height-control">
              <label>If yes, who issued it?</label>
            </div>
            <div className="col-md-5">
              <input
                name="firstAidIssued"
                type="text"
                className="form-control"
                readOnly="true"
                  value={this.props.fields['firstAidIssued']}
              />
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-12">
              <label>Do you have any other EMS certifications?</label>
              <div>
                <input
                  name="certifications"
                  type="text"
                  className="form-control"
                  readOnly="true"
                  value={this.props.fields['certifications']}
                />
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-md-2">
              <SharedBoolean
                currentValue={this.props.fields['license']}
                readOnly="true"
              />
            </div>
            <div className="col-md-10 height-control">
              <label>{"Do you have a valid driver's license?"}</label>
            </div>
          </div>
          <div className="row">
            <div className="col-md-2">
              <SharedBoolean
                currentValue={this.props.fields['felony']}
                readOnly="true"
              />
            </div>
            <div className="col-md-10 height-control">
              <label>Have you ever been arrested for a felony?</label>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-2">
              <SharedBoolean
                currentValue={this.props.fields['felonyConviction']}
                readOnly="true"
              />
            </div>
            <div className="col-md-10 height-control">
              <label>Have you ever been convicted of a felony?</label>
            </div>
          </div>
          <div className="form-group">
            <div className="col-md-12">
              <label>What is your primary reason for volunteering to join search and rescue?</label>
              <div>
                <textarea
                  name="primaryReason"
                  className="form-control"
                  readOnly="true"
                  value={this.props.fields['primaryReason']}
                />
              </div>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-1">
              <input
                type="checkbox"
                readOnly="true"
                checked={this.props.fields['liability']}
              />
            </div>
            <div className="col-md-11">
              <label>I am responsible for my own safety and insurance.</label>
            </div>
          </div>
          <div className="row form-group">
            <div className="col-md-1">
              <input
                type="checkbox"
                readOnly="true"
                checked={this.props.fields['acknowledge']}
                />
            </div>
            <div className="col-md-11">
              <label>I am telling the truth.</label>
            </div>
          </div>
        </form>
        <div className="col-md-12">
          {this.approved()}
          {this.signed()}
          {this.paid()}
          {this.taken()}
          {this.created()}
          <div
            onClick={this.destroy}
            className="btn-sm btn-danger btn-space">
            Delete
          </div>
        </div>
      </div>
    );
  }
}

window.ReviewProspectApplication = ReviewProspectApplication;
