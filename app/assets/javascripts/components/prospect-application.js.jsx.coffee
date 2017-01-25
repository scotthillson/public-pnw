window.ProspectApplication = React.createClass

  getInitialState: ->
    {
      fields:
        name: {check: 'wordChecks', value: null}
        email: {check: 'emailChecks', value: null}
        birthday: {check: 'lengthChecks', value: null}
        mobilePhone: {check: 'numberChecks', value: null}
        homePhone: {check: 'numberChecks', value: null}
        workPhone: {check: 'numberChecks', value: null}
        address: {check: 'mixChecks', value: null}
        city: {check: 'wordChecks', value: null}
        addressState: {check: 'stateChecks', value: null}
        postal: {check: 'numberChecks', value: null}
        employer: {check: 'mixChecks', value: null}
        job: {check: 'mixChecks', value: null}
        emergencyOne: {check: 'wordChecks', value: null}
        emergencyTwo: {check: 'wordChecks', value: null}
        emergencyPhoneOne: {check: 'numberChecks', value: null}
        emergencyPhoneTwo: {check: 'numberChecks', value: null}
        emergencyRelationshipOne: {check: 'wordChecks', value: null}
        emergencyRelationshipTwo: {check: 'wordChecks', value: null}
        referenceOne: {check: 'wordChecks', value: null}
        referencePhoneOne: {check: 'numberChecks', value: null}
        referenceAddressOne: {check: 'mixChecks', value: null}
        referenceCityOne: {check: 'wordChecks', value: null}
        referenceStateOne: {check: 'stateChecks', value: null}
        referencePostalOne: {check: 'numberChecks', value: null}
        referenceTwo: {check: 'wordChecks', value: null}
        referencePhoneTwo: {check: 'numberChecks', value: null}
        referenceAddressTwo: {check: 'mixChecks', value: null}
        referenceCityTwo: {check: 'wordChecks', value: null}
        referenceStateTwo: {check: 'stateChecks', value: null}
        referencePostalTwo: {check: 'numberChecks', value: null}
        referenceThree: {check: 'wordChecks', value: null}
        referencePhoneThree: {check: 'numberChecks', value: null}
        referenceAddressThree: {check: 'mixChecks', value: null}
        referenceCityThree: {check: 'wordChecks', value: null}
        referenceStateThree: {check: 'stateChecks', value: null}
        referencePostalThree: {check: 'numberChecks', value: null}
        physicalShape: {check: 'skipChecks', value: 'false'}
        explainPhysical: {check: 'wordChecks', value: null, blank: true}
        firstAid: {check: 'skipChecks', value: 'false'}
        firstAidIssued: {check: 'wordChecks', value: null, blank: true}
        certifications: {check: 'wordChecks', value: null, blank: true}
        license: {check: 'skipChecks', value: 'false'}
        felony: {check: 'skipChecks', value: 'true'}
        felonyConviction: {check: 'skipChecks', value: 'true'}
        primaryReason: {check: 'mixChecks', value: null}
        liability: {check: 'checkboxChecks', value: 'false'}
        acknowledge: {check: 'checkboxChecks', value: 'false'}
      checkField: null
      checkType: null
      errorMessage: null
    }
  
  fieldChange: (field, type, e) ->
    newState = {}
    newState.fields = _.cloneDeep(@state.fields)
    newState.fields[field].value = e.target.value
    newState.checkField = field
    newState.checkType = type
    @setState(newState, @sanityChecks)
  
  showErrors: (name) ->
    field = document.getElementsByName(name)[0]
    className = field.className
    unless className.indexOf('error-danger') > -1
      field.className += " error-danger"
    1
  
  fixErrors: (name) ->
    field = document.getElementsByName(name)[0]
    className = field.className
    fix = className.replace(' error-danger','')
    field.className = fix
    0
  
  sanityChecks: ->
    @[@state.checkType](@state.checkField)
  
  wordChecks: (field) ->
    if !@state.fields[field].blank and !@state.fields[field].value?
      @showErrors(field)
    else if /^[a-zA-z\s]+$/.test(@state.fields[field].value)
      @fixErrors(field)
    else
      @showErrors(field)
  
  numberChecks: (field) ->
    if /^[\d-]+$/.test(@state.fields[field].value)
      @fixErrors(field)
    else
      @showErrors(field)
  
  emailChecks: (field) ->
    if /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(@state.fields[field].value)
      @fixErrors(field)
    else
      @showErrors(field)
  
  checkboxChecks: (field) ->
    console.log field
    console.log @state.fields[field]
    unless @state.fields[field].value is 'true'
      return @showErrors(field)
    @fixErrors(field)
  
  mixChecks: (field) ->
    if /^[a-zA-z\s\d-]+$/.test(@state.fields[field].value) and @state.fields[field].value?
      @fixErrors(field)
    else
      @showErrors(field)
  
  stateChecks: (field) ->
    if /^[A-z]+$/.test(@state.fields[field].value) and @state.fields[field].value?
      @fixErrors(field)
    else
      @showErrors(field)
  
  lengthChecks: (field) ->
    unless @state.fields[field].value?
      return @showErrors(field)
    @fixErrors(field)
  
  skipChecks: ->
    0
  
  startSubmit: ->
    errors = 0
    for key, field of @state.fields
      errors += this[field.check](key)
    if errors > 0
      window.scrollTo(0,0)
    else
      @finishSubmit()
  
  finishSubmit: ->
    $.ajax
      type: 'post'
      url: "/submit_new_member_application"
      data: @state.fields
      success: (data) ->
        console.log data
      error: (jqXHR, textStatus, errorThrown) ->
        console.log jqXHR
  
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
                value={this.state.fields['name'].value}
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
                value={this.state.fields['birthday'].value}
                onChange={this.fieldChange.bind(this, 'birthday', 'lengthChecks')}
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
                value={this.state.fields['email'].value}
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
                value={this.state.fields['mobilePhone'].value}
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
                value={this.state.fields['homePhone'].value}
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
                value={this.state.fields['workPhone'].value}
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
                value={this.state.fields['address'].value}
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
                value={this.state.fields['city'].value}
                onChange={this.fieldChange.bind(this, 'city', 'wordChecks')}
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
                value={this.state.fields['addressState'].value}
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
                value={this.state.fields['postal'].value}
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
                value={this.state.fields['employer'].value}
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
                value={this.state.fields['job'].value}
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
              value={this.state.fields['emergencyOne'].value}
              onChange={this.fieldChange.bind(this, 'emergencyOne', 'wordChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneOne"
              className="form-control"
              type="text"
              value={this.state.fields['emergencyPhoneOne'].value}
              onChange={this.fieldChange.bind(this, 'emergencyPhoneOne', 'numberChecks')} />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipOne"
              className="form-control"
              type="text"
              value={this.state.fields['emergencyRelationshipOne'].value}
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
              value={this.state.fields['emergencyTwo'].value}
              onChange={this.fieldChange.bind(this, 'emergencyTwo', 'wordChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneTwo"
              className="form-control"
              type="text"
              value={this.state.fields['emergencyPhoneTwo'].value}
              onChange={this.fieldChange.bind(this, 'emergencyPhoneTwo', 'numberChecks')}
            />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipTwo"
              className="form-control"
              type="text"
              value={this.state.fields['emergencyRelationshipTwo'].value}
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
                value={this.state.fields['referenceOne'].value}
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
              value={this.state.fields['referencePhoneOne'].value}
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
                value={this.state.fields['referenceAddressOne'].value}
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
                value={this.state.fields['referenceCityOne'].value}
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
                value={this.state.fields['referenceStateOne'].value}
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
                value={this.state.fields['referencePostalOne'].value}
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
                placeholder="first and last name"
                type="text"
                value={this.state.fields['referenceTwo'].value}
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
              value={this.state.fields['referencePhoneTwo'].value}
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
                value={this.state.fields['referenceAddressTwo'].value}
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
                value={this.state.fields['referenceStateTwo'].value}
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
                value={this.state.fields['referencePostalTwo'].value}
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
                value={this.state.fields['referenceThree'].value}
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
              value={this.state.fields['referencePhoneThree'].value}
              onChange={this.fieldChange.bind(this, 'referencePhoneThree', 'numberChecks')}
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
                value={this.state.fields['referenceAddressThree'].value}
                onChange={this.fieldChange.bind(this, 'referenceAddressThree', 'mixChecks')}
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
                value={this.state.fields['referenceCityThree'].value}
                onChange={this.fieldChange.bind(this, 'referenceCityThree', 'wordChecks')}
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
                value={this.state.fields['referenceStateThree'].value}
                onChange={this.fieldChange.bind(this, 'referenceStateThree', 'stateChecks')}
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
                value={this.state.fields['referencePostalThree'].value}
                onChange={this.fieldChange.bind(this, 'referencePostalThree', 'numberChecks')} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['physicalShape'].value}
              setValue={this.fieldChange.bind(this, 'physicalShape', 'skipChecks')}
            />
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
              <input
                name="explainPhysical"
                type="text"
                className="form-control"
                value={this.state.fields['explainPhysical'].value}
                onChange={this.fieldChange.bind(this, 'explainPhysical', 'skipChecks')}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['firstAid'].value}
              setValue={this.fieldChange.bind(this, 'firstAid', 'skipChecks')}
            />
          </div>
          <div className="col-md-5 height-control">
            <label>Do you have a first aid/CPR card?</label>
          </div>
          <div className="col-md-5">
            <input
              name="firstAidIssued"
              type="text"
              placeholder="If yes, who issued it?"
              className="form-control"
              value={this.state.fields['firstAidIssued'].value}
              onChange={this.fieldChange.bind(this, 'firstAidIssued', 'skipChecks')}
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
                value={this.state.fields['certifications'].value}
                onChange={this.fieldChange.bind(this, 'certifications', 'skipChecks')}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['license'].value}
              setValue={this.fieldChange.bind(this, 'license', 'skipChecks')}
            />
          </div>
          <div className="col-md-10 height-control">
            <label>{"Do you have a valid driver's license?"}</label>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['felony'].value}
              setValue={this.fieldChange.bind(this, 'felony', 'skipChecks')}
            />
          </div>
          <div className="col-md-10 height-control">
            <label>Have you ever been arrested for a felony?</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['felonyConviction'].value}
              setValue={this.fieldChange.bind(this, 'felonyConviction', 'skipChecks')}
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
                value={this.state.fields['primaryReason'].value}
                onChange={this.fieldChange.bind(this, 'primaryReason', 'mixChecks')}
              />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input
              type="checkbox"
              value={this.state.fields['liability'].value}
              onChange={this.fieldChange.bind(this, 'liability', 'checkboxChecks')}
            />
          </div>
          <div className="col-md-11">
            <label name="liability">Pacific Northwest Search and Rescue does not provide medical, liability or disability insurance for any members or visitors at group functions. I acknowledge that I am responsible for my own safety and any personal insurance I deem necessary.</label>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input
              type="checkbox"
              value={this.state.fields['acknowledge'].value}
              onChange={this.fieldChange.bind(this, 'acknowledge', 'checkboxChecks')}
              />
          </div>
          <div className="col-md-11">
            <label name="acknowledge">By submitting this application I certify that the information set forth in this application is true and complete to the best of my knowledge.</label>
          </div>
        </div>
        <input className="btn btn-primary" value="Submit Application" type="button" onClick={this.startSubmit} />
        <p>Pacific Northwest Search and Rescue, Inc. does not discriminate against race, religion, sex, or national origin. Pacific Northwest Search and Rescue, Inc. is a non-profit volunteer search and rescue organization (501(c)(3), ID# 93-119739)</p>
      </form>
    </div>`
