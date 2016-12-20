window.ProspectApplication = React.createClass

  getInitialState: ->
    {
      name: null
      email: null
      birthday: null
      mobilePhone: null
      homePhone: null
      WorkPhone: null
      address: null
      city: null
      state: null
      zip: null
      employer: null
      job: null
      emergencyNameOne: null
      emergencyNameTwo: null
      emergencyPhoneOne: null
      emergencyPhoneTwo: null
      emergencyRelationshipOne: null
      emergencyRelationshipTwo: null
      referenceOne: null
      referencePhoneOne: null
      referenceAddressOne: null
      referenceCityOne: null
      referenceStateOne: null
      referencePostalOne: null
      referenceTwo: null
      referencePhoneTwo: null
      referenceAddressTwo: null
      referenceCityTwo: null
      referenceStateTwo: null
      referencePostalTwo: null
      referenceThree: null
      referencePhoneThree: null
      referenceAddressThree: null
      referenceCityThree: null
      referenceStateThree: null
      referencePostalThree: null
      phisycalShape: false
      explainPhysical: null
      firstAid: false
      firstAidIssued: null
      certifications: null
      specialSkills: null
      license: false
      felony: true
      felonyConviction: true
      primaryReason: null
      liability: null
      acknowledge: false
    }
  
  fieldChange: (e, field) ->
    state = {}
    state[field] = e.target.value
    @setState(state)
  
  changePhysicalShape: (value) ->
    @setState(phisicalShape: value)
  
  changeFirstAid: (value) ->
    @setState(firstAid: value)
  
  changeLicense: (value) ->
    @setState(license: value)
  
  changeFelony: (value) ->
    @setState({felony: value})
  
  changeFelonyConviction: (value) ->
    @setState({felonyConviction: value})
  
  changeLiability: (e) ->
    @setState(liability: e.target.value)
  
  acknowledge: (e) ->
    @setState(acknowledge: e.target.value)
  
  submit: ->
    $.ajax
      type: 'post'
      url: "/submit_new_member_application"
      data: @state
      success: (data) ->
        console.log data
      error: (jqXHR, textStatus, errorThrown) ->
        console.log errorThrown
  
  render: ->
    `<div className="form-container regular-form">
      <div className="col-md-12">
        <p className="lead text-center">New Membership Application</p>
      </div>
      <form className="col-md-12 form-horizontal" role="form">
        <div className="row form-group">
          <div className="col-md-6">
            <label>Your Name</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" />
            </div>
          </div>
          <div className="col-md-6">
            <label>Date of Birth</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>Your email</label>
            <div>
              <input className="form-control" placeholder="moreinfo@pnwsar.org" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Mobile Phone</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-4">
            <label>Home Phone</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-4">
            <label>Work Phone</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>City State</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Employer</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-6">
            <label>Job Title</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Emergency Contact</label>
            <input className="form-control" type="text" />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input className="form-control" type="text" />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Emergency Contact</label>
            <input className="form-control" type="text" />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input className="form-control" type="text" />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>City State</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>City State</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>City State</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
          <div className="col-md-3">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              value={this.state.physicalShape}
              setValue={this.changePhysicalShape}
            />
          </div>
          <div className="col-md-10 height-control">
            <label>Search and Rescue Work is physically demanding! Our minimum expectation is that you can hike 6 miles carrying a 25 pound pack maintaining at least a 2mph pace. Do you have any medical conditions that may limit your ability to participate in Search and Rescue field operations?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>If yes, please explain</label>
            <div>
              <input type="text" className="form-control" value={this.state.explainPhysical} onChange={this.changeExplainPhysical} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              value={this.state.firstAid}
              setValue={this.changeFirstAid}
            />
          </div>
          <div className="col-md-5 height-control">
            <label>Do you have a first aid/CPR card?</label>
          </div>
          <div className="col-md-5">
            <input type="text" placeholder="who issued it?" className="form-control" value={this.state.firstAidIssued} onChange={this.changefirstAidIssued} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>Do you have any other EMS certifications?</label>
            <div>
              <input type="text" className="form-control" value={this.state.certifications} onChange={this.changeCertifications} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              value={this.state.license}
              setValue={this.changeLicense}
            />
          </div>
          <div className="col-md-10 height-control">
            <label>{"Do you have a valid driver's license?"}</label>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              value={this.state.felony}
              setValue={this.changeFelony}
            />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been arrested for a felony?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-2">
            <SharedBoolean
              value={this.state.felonyConviction}
              setValue={this.changeFelonyConviction}
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
              <textarea className="form-control" value={this.state.primaryReason} onChange={this.changePrimaryReason} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input type="checkbox" value={this.state.liability} onChange={this.changeLiability} />
          </div>
          <div className="col-md-11">
            <label>Pacific Northwest Search and Rescue does not provide medical, liability or disability insurance for any members or visitors at group functions. I acknowledge that I am responsible for my own safety and any personal insurance I deem necessary.</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input type="checkbox" value={this.state.acknowledge} />
          </div>
          <div className="col-md-11">
            <label>By submitting this application I certify that the information set forth in this application is true and complete to the best of my knowledge.</label>
          </div>
        </div>
        <input className="btn btn-primary" type="submit" value="Submit Application" onClick={this.submit} />
        <p>Pacific Northwest Search and Rescue, Inc. does not discriminate against race, religion, sex, or national origin. Pacific Northwest Search and Rescue, Inc. is a non-profit volunteer search and rescue organization (501(c)(3), ID# 93-119739)</p>
      </form>
    </div>`
