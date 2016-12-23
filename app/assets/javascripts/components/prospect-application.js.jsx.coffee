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
      zip: null
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
    }
  
  fieldChange: (field, e) ->
    newState = {}
    newState[field] = e.target.value
    @setState(newState, @checkForLetters)
  
  changePhysicalShape: (value) ->
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
  
  acknowledge: (e) ->
    @setState(acknowledge: e.target.value)
  
  checkForOnlyLetters: ->
    console.log /^[a-zA-Z]+$/.test(@state.name)
  
    checkForOnlyNumbers: ->
      true
  
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
              <input name="name" className="form-control" placeholder="first and last name" type="text" value={this.state.name} onChange={this.fieldChange.bind(this, 'name')} />
            </div>
          </div>
          <div className="col-md-6">
            <label>Date of Birth</label>
            <div>
              <input name="birthday" className="form-control" type="date" value={this.state.birthday} onChange={this.fieldChange.bind(this, 'birthday')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>Your email</label>
            <div>
              <input name="email" className="form-control" placeholder="moreinfo@pnwsar.org" type="text" value={this.state.email} onChange={this.fieldChange.bind(this, 'email')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Mobile Phone</label>
            <div>
              <input name="phone" className="form-control" type="text" placeholder="555-555-5555" value={this.state.mobilePhone} onChange={this.fieldChange.bind(this, 'mobilePhone')} />
            </div>
          </div>
          <div className="col-md-4">
            <label>Home Phone</label>
            <div>
              <input className="form-control" type="text" placeholder="555-555-5555" value={this.state.homePhone} onChange={this.fieldChange.bind(this, 'homePhone')} />
            </div>
          </div>
          <div className="col-md-4">
            <label>Work Phone</label>
            <div>
              <input className="form-control" type="text" placeholder="555-555-5555" value={this.state.workPhone} onChange={this.fieldChange.bind(this, 'workPhone')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-7">
            <label>Address</label>
            <div>
              <input name="address" className="form-control" type="text" value={this.state.address} onChange={this.fieldChange.bind(this, 'address')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>City</label>
            <div>
              <input name="city" className="form-control" type="text" value={this.state.city} onChange={this.fieldChange.bind(this, 'city')} />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input name="state" className="form-control" type="text" value={this.state.addressState} onChange={this.fieldChange.bind(this, 'addressState')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>ZIP</label>
            <div>
              <input name="zip" className="form-control" type="text" value={this.state.zip} onChange={this.fieldChange.bind(this, 'zip')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-6">
            <label>Employer</label>
            <div>
              <input name="organization" className="form-control" type="text" value={this.state.employer} onChange={this.fieldChange.bind(this, 'employer')} />
            </div>
          </div>
          <div className="col-md-6">
            <label>Job Title</label>
            <div>
              <input className="form-control" type="text" value={this.state.job} onChange={this.fieldChange.bind(this, 'job')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Emergency Contact</label>
            <input className="form-control" type="text" value={this.state.emergencyOne} onChange={this.fieldChange.bind(this, 'emergencyOne')} />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" value={this.state.emergencyPhoneOne} onChange={this.fieldChange.bind(this, 'emergencyPhoneOne')} />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input className="form-control" type="text" value={this.state.emergencyRelationshipOne} onChange={this.fieldChange.bind(this, 'emergencyRelationshipOne')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-4">
            <label>Emergency Contact</label>
            <input className="form-control" type="text" value={this.state.emergencyTwo} onChange={this.fieldChange.bind(this, 'emergencyTwo')} />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" value={this.state.emergencyPhoneTwo} onChange={this.fieldChange.bind(this, 'emergencyPhoneTwo')} />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input className="form-control" type="text" value={this.state.emergencyRelationshipTwo} onChange={this.fieldChange.bind(this, 'emergencyRelationshipTwo')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" value={this.state.referenceOne} type="text" onChange={this.fieldChange.bind(this, 'referenceOne')} />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" value={this.state.referencePhoneOne} onChange={this.fieldChange.bind(this, 'referencePhoneOne')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-7">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceAddressOne} onChange={this.fieldChange.bind(this, 'referenceAddressOne')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>City</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceCityeOne} onChange={this.fieldChange.bind(this, 'referenceCityOne')} />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceStateOne} onChange={this.fieldChange.bind(this, 'referenceStateOne')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" value={this.state.referencePostalOne} onChange={this.fieldChange.bind(this, 'referencePostalOne')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" onChange={this.fieldChange.bind(this, 'referenceTwo')} />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" value={this.state.referencePhoneTwo} onChange={this.fieldChange.bind(this, 'referencePhoneTwo')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-7">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceAddressTwo} onChange={this.fieldChange.bind(this, 'referenceAddressTwo')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>City</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceCityTwo} onChange={this.fieldChange.bind(this, 'referenceCityTwo')} />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceStateTwo} onChange={this.fieldChange.bind(this, 'referenceStateTwo')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" value={this.state.referencePostalTwo} onChange={this.fieldChange.bind(this, 'referencePostalTwo')} />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-8">
            <label>Personal Reference</label>
            <div>
              <input className="form-control" placeholder="first and last name" type="text" value={this.state.referenceThree} />
            </div>
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input className="form-control" type="text" value={this.state.referencePhoneThree} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-7">
            <label>Address</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceAddressThree} onChange={this.fieldChange.bind(this, 'referenceAddressThree')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>City</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceCityThree} onChange={this.fieldChange.bind(this, 'referenceCityThree')} />
            </div>
          </div>
          <div className="col-md-1">
            <label>State</label>
            <div>
              <input className="form-control" type="text" value={this.state.referenceStateThree} onChange={this.fieldChange.bind(this, 'referenceStateThree')} />
            </div>
          </div>
          <div className="col-md-2">
            <label>ZIP</label>
            <div>
              <input className="form-control" type="text" value={this.state.referencePostalThree} onChange={this.fieldChange.bind(this, 'referencePostalThree')} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean ident="physicalShape" currentValue={this.state.physicalShape} setValue={this.changePhysicalShape} />
          </div>
          <div className="col-md-10 height-control">
            <label>Search and Rescue Work is physically demanding! Our minimum expectation is that you can hike 6 miles carrying a 25 pound pack maintaining at least a 2mph pace. Do you have any medical conditions that may limit your ability to participate in Search and Rescue field operations?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>If yes, please explain</label>
            <div>
              <input type="text" className="form-control" value={this.state.explainPhysical} onChange={this.fieldChange} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean ident="firstAid" currentValue={this.state.firstAid} setValue={this.changeFirstAid} />
          </div>
          <div className="col-md-5 height-control">
            <label>Do you have a first aid/CPR card?</label>
          </div>
          <div className="col-md-5">
            <input type="text" placeholder="who issued it?" className="form-control" value={this.state.firstAidIssued} onChange={this.fieldChange.bind(this, 'firstAidIssued')} />
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-12">
            <label>Do you have any other EMS certifications?</label>
            <div>
              <input type="text" className="form-control" value={this.state.certifications} onChange={this.fieldChange.bind(this, 'certifications')} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean ident="license" currentValue={this.state.license} setValue={this.changeLicense} />
          </div>
          <div className="col-md-10 height-control">
            <label>{"Do you have a valid driver's license?"}</label>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean ident="felony" currentValue={this.state.felony} setValue={this.changeFelony} />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been arrested for a felony?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-2">
            <SharedBoolean ident="felonyConviction" currentValue={this.state.felonyConviction} setValue={this.changeFelonyConviction} />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been convicted of a felony?</label>
          </div>
        </div>
        <div className="form-group">
          <div className="col-md-12">
            <label>What is your primary reason for volunteering to join search and rescue?</label>
            <div>
              <textarea className="form-control" value={this.state.primaryReason} onChange={this.fieldChange.bind(this, 'primaryReason')} />
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
