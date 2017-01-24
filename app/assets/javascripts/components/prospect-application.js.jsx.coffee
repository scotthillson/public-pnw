window.ProspectApplication = React.createClass

  getInitialState: ->
    {
      name: null
      email: null
      birthday: null
      mobilePhone: null
      homePhone: null
      workPhone: null
      address: null
      city: null
      addressState: null
      postal: null
      employer: null
      job: null
      emergencyOne: null
      emergencyTwo: null
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
      physicalShape: false
      explainPhysical: null
      firstAid: false
      firstAidIssued: null
      certifications: null
      specialSkills: null
      license: false
      felony: true
      felonyConviction: true
      primaryReason: null
      liability: false
      acknowledge: false
      checkField: null
      checkType: null
      errorMessage: null
    }
  
  hangePhysicalShape: (value) ->
    @setState(physicalShape: value)
  
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
  
  changeAcknowledge: (e) ->
    @setState(acknowledge: e.target.value)
  
  fieldChange: (field, type, e) ->
    newState = {}
    newState[field] = e.target.value
    newState.checkField = field
    newState.checkType = type
    @setState(newState, @sanityChecks)
  
  showErrors: (name) ->
    field = document.getElementsByName(name)[0]
    className = field.className
    unless className.indexOf('error-danger') > -1
      field.className += " error-danger"
  
  fixErrors: (name) ->
    field = document.getElementsByName(name)[0]
    className = field.className
    fix = className.replace(' error-danger','')
    field.className = fix
  
  sanityChecks: ->
    this[@state.checkType](@state.checkField)
  
  wordChecks: (field) ->
    if /^[a-zA-z\s]+$/.test(@state[field])
      @fixErrors(field)
    else
      @showErrors(field)
  
  numberChecks: (field) ->
    if /^[\d-]+$/.test(@state[field])
      @fixErrors(field)
    else
      @showErrors(field)
  
  emailChecks: (field) ->
    if /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(@state[field])
      @fixErrors(field)
    else
      @showErrors(field)
  
  dateChecks: (field) ->
    true
  
  mixChecks: (field) ->
    true
    
  stateChecks: (field) ->
    true
  
  startSubmit: ->
    @wordChecks('name')
    @emailChecks('email')
    @numberChecks('homePhone')
    @numberChecks('workPhone')
    @numberChecks('mobilePhone')
    @dateChecks('birthday')
    @mixChecks('address')
    document.documentElement.scrollTop = 0
    #@finishSubmit()
  
  finishSubmit: ->
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
              <input
                name="name"
                className="form-control"
                placeholder="first and last name"
                type="text"
                value={this.state.name}
                onChange={this.fieldChange.bind(this, 'name', 'wordChecks')}
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
                value={this.state.birthday}
                onChange={this.fieldChange.bind(this, 'birthday', 'dateChecks')}
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
                value={this.state.email}
                onChange={this.fieldChange.bind(this, 'email', 'emailChecks')}
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
                value={this.state.mobilePhone}
                onChange={this.fieldChange.bind(this, 'mobilePhone', 'numberChecks')}
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
                value={this.state.homePhone}
                onChange={this.fieldChange.bind(this, 'homePhone', 'numberChecks')}
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
                value={this.state.workPhone}
                onChange={this.fieldChange.bind(this, 'workPhone', 'numberChecks')}
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
                value={this.state.address}
                onChange={this.fieldChange.bind(this, 'address', 'mixChecks')}
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
                value={this.state.city}
                onChange={this.fieldChange.bind(this, 'city', 'wordChecks')}
              />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input
                name="state"
                className="form-control"
                type="text"
                value={this.state.addressState}
                onChange={this.fieldChange.bind(this, 'addressState', 'stateChecks')}
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
                value={this.state.postal}
                onChange={this.fieldChange.bind(this, 'postal', 'numberChecks')}
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
                value={this.state.employer}
                onChange={this.fieldChange.bind(this, 'employer', 'wordChecks')}
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
                value={this.state.job}
                onChange={this.fieldChange.bind(this, 'job', 'wordChecks')}
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
              value={this.state.emergencyOne}
              onChange={this.fieldChange.bind(this, 'emergencyOne', 'wordChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneOne"
              className="form-control"
              type="text"
              value={this.state.emergencyPhoneOne}
              onChange={this.fieldChange.bind(this, 'emergencyPhoneOne', 'numberChecks')} />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipOne"
              className="form-control"
              type="text"
              value={this.state.emergencyRelationshipOne}
              onChange={this.fieldChange.bind(this, 'emergencyRelationshipOne', 'wordChecks')}
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
              value={this.state.emergencyTwo}
              onChange={this.fieldChange.bind(this, 'emergencyTwo', 'wordChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneTwo"
              className="form-control"
              type="text"
              value={this.state.emergencyPhoneTwo}
              onChange={this.fieldChange.bind(this, 'emergencyPhoneTwo', 'numberChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipTwo"
              className="form-control"
              type="text"
              value={this.state.emergencyRelationshipTwo}
              onChange={this.fieldChange.bind(this, 'emergencyRelationshipTwo', 'wordChecks')}
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
                value={this.state.referenceOne}
                type="text"
                onChange={this.fieldChange.bind(this, 'referenceOne', 'wordChecks')}
              />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="referencePhoneOne"
              className="form-control"
              type="text"
              value={this.state.referencePhoneOne}
              onChange={this.fieldChange.bind(this, 'referencePhoneOne','numberChecks')}
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
                value={this.state.referenceAddressOne}
                onChange={this.fieldChange.bind(this, 'referenceAddressOne', 'mixChecks')}
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
                value={this.state.referenceCityeOne}
                onChange={this.fieldChange.bind(this, 'referenceCityOne', 'wordChecks')}
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
                value={this.state.referenceStateOne}
                onChange={this.fieldChange.bind(this, 'referenceStateOne', 'stateChecks')}
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
                value={this.state.referencePostalOne}
                onChange={this.fieldChange.bind(this, 'referencePostalOne', 'numberChecks')}
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
                placeholder="first and last name" type="text"
                onChange={this.fieldChange.bind(this, 'referenceTwo', 'wordChecks')}
              />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="referencePhoneTwo"
              className="form-control"
              type="text"
              value={this.state.referencePhoneTwo}
              onChange={this.fieldChange.bind(this, 'referencePhoneTwo', 'numberChecks')}
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
                value={this.state.referenceAddressTwo}
                onChange={this.fieldChange.bind(this, 'referenceAddressTwo', 'mixChecks')}
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
                value={this.state.referenceCityTwo}
                onChange={this.fieldChange.bind(this, 'referenceCityTwo', 'wordChecks')}
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
                value={this.state.referenceStateTwo}
                onChange={this.fieldChange.bind(this, 'referenceStateTwo', 'stateChecks')}
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
                value={this.state.referencePostalTwo}
                onChange={this.fieldChange.bind(this, 'referencePostalTwo', 'numberChecks')}
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
                value={this.state.referenceThree}
                onChange={this.fieldChange.bind(this, 'referenceThree', 'wordChecks')}
              />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="referencePhoneThree"
              className="form-control"
              type="text"
              value={this.state.referencePhoneThree}
              onChange={this.fieldChange.bind(this, 'referencePhoneThree', 'numberChecks')}
            />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-7">
            <label>Address</label>
            <div>
              <input name="referenceAddressThree" className="form-control" type="text" value={this.state.referenceAddressThree} onChange={this.fieldChange.bind(this, 'referenceAddressThree', 'mixChecks')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>City</label>
            <div>
              <input name="referenceCityThree" className="form-control" type="text" value={this.state.referenceCityThree} onChange={this.fieldChange.bind(this, 'referenceCityThree', 'wordChecks')} />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input name="referenceStateThree" className="form-control" type="text" value={this.state.referenceStateThree} onChange={this.fieldChange.bind(this, 'referenceStateThree', 'stateChecks')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>ZIP</label>
            <div>
              <input name="referencePostalThree" className="form-control" type="text" value={this.state.referencePostalThree} onChange={this.fieldChange.bind(this, 'referencePostalThree', 'numberChecks')} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean currentValue={this.state.physicalShape} setValue={this.changePhysicalShape} />
          </div>
          <div className="col-md-10 height-control">
            <label>Search and Rescue Work is physically demanding!
              Our minimum expectation is that you can hike 6 miles carrying a 25 pound pack maintaining at least a 2mph pace.
              Do you have any medical conditions that may limit your ability to participate in Search and Rescue field operations?
            </label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>If yes, please explain</label>
            <div>
              <input name="explainPhysical" type="text" className="form-control" value={this.state.explainPhysical} onChange={this.fieldChange} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean currentValue={this.state.firstAid} setValue={this.changeFirstAid} />
          </div>
          <div className="col-md-5 height-control">
            <label>Do you have a first aid/CPR card?</label>
          </div>
          <div className="col-md-5">
            <input name="firstAidIssued" type="text" placeholder="who issued it?" className="form-control" value={this.state.firstAidIssued} onChange={this.fieldChange.bind(this, 'firstAidIssued')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>Do you have any other EMS certifications?</label>
            <div>
              <input name="certifications" type="text" className="form-control" value={this.state.certifications} onChange={this.fieldChange.bind(this, 'certifications')} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean currentValue={this.state.license} setValue={this.changeLicense} />
          </div>
          <div className="col-md-10 height-control">
            <label>{"Do you have a valid driver's license?"}</label>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean currentValue={this.state.felony} setValue={this.changeFelony} />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been arrested for a felony?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-2">
            <SharedBoolean currentValue={this.state.felonyConviction} setValue={this.changeFelonyConviction} />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been convicted of a felony?</label>
          </div>
        </div>
        <div className="form-group">
          <div className="col-md-12">
            <label>What is your primary reason for volunteering to join search and rescue?</label>
            <div>
              <textarea name="primaryReason" className="form-control" value={this.state.primaryReason} onChange={this.fieldChange.bind(this, 'primaryReason')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input name="liability" type="checkbox" value={this.state.liability} onChange={this.changeLiability} />
          </div>
          <div className="col-md-11">
            <label>Pacific Northwest Search and Rescue does not provide medical, liability or disability insurance for any members or visitors at group functions. I acknowledge that I am responsible for my own safety and any personal insurance I deem necessary.</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input name="acknowledge" type="checkbox" value={this.state.acknowledge} onChange={this.changeAcknowledge} />
          </div>
          <div className="col-md-11">
            <label>By submitting this application I certify that the information set forth in this application is true and complete to the best of my knowledge.</label>
          </div>
        </div>
        <input className="btn btn-primary" value="Submit Application" type="button" onClick={this.startSubmit} />
        <p>Pacific Northwest Search and Rescue, Inc. does not discriminate against race, religion, sex, or national origin. Pacific Northwest Search and Rescue, Inc. is a non-profit volunteer search and rescue organization (501(c)(3), ID# 93-119739)</p>
      </form>
    </div>`
