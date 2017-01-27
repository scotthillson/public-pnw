window.ReviewProspectApplication = React.createClass

  getInitialState: ->
    {fields: @props.fields}
  
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
                readOnly="true"
                value={this.state.fields['name']}
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
                value={this.state.fields['birthday']}
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
                value={this.state.fields['email']}
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
                value={this.state.fields['mobilePhone']}
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
                value={this.state.fields['homePhone']}
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
                value={this.state.fields['workPhone']}
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
                value={this.state.fields['address']}
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
                value={this.state.fields['city']}
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
                value={this.state.fields['addressState']}
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
                value={this.state.fields['postal']}
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
                value={this.state.fields['employer']}
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
                value={this.state.fields['job']}
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
                value={this.state.fields['emergencyOne']}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneOne"
              className="form-control"
              type="text"
              readOnly="true"
                value={this.state.fields['emergencyPhoneOne']}
            />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipOne"
              className="form-control"
              type="text"
              readOnly="true"
                value={this.state.fields['emergencyRelationshipOne']}
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
                value={this.state.fields['emergencyTwo']}
            />
          </div>
          <div className="col-md-4">
            <label>Phone Number</label>
            <input
              name="emergencyPhoneTwo"
              className="form-control"
              type="text"
              readOnly="true"
                value={this.state.fields['emergencyPhoneTwo']}
            />
          </div>
          <div className="col-md-4">
            <label>Relationship</label>
            <input
              name="emergencyRelationshipTwo"
              className="form-control"
              type="text"
              readOnly="true"
                value={this.state.fields['emergencyRelationshipTwo']}
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
                value={this.state.fields['referenceOne']}
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
                value={this.state.fields['referencePhoneOne']}
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
                value={this.state.fields['referenceAddressOne']}
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
                value={this.state.fields['referenceCityOne']}
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
                value={this.state.fields['referenceStateOne']}
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
                value={this.state.fields['referencePostalOne']}
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
                value={this.state.fields['referenceTwo']}
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
              value={this.state.fields['referencePhoneTwo']}
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
                value={this.state.fields['referenceAddressTwo']}
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
                value={this.state.fields['referenceCityTwo']}
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
                value={this.state.fields['referenceStateTwo']}
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
                value={this.state.fields['referencePostalTwo']}
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
                value={this.state.fields['referenceThree']}
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
                value={this.state.fields['referencePhoneThree']}
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
                value={this.state.fields['referenceAddressThree']}
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
                value={this.state.fields['referenceCityThree']}
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
                value={this.state.fields['referenceStateThree']}
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
                value={this.state.fields['referencePostalThree']}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['physicalShape']}
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
                value={this.state.fields['explainPhysical']}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['firstAid']}
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
                value={this.state.fields['firstAidIssued']}
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
                value={this.state.fields['certifications']}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-2">
            <SharedBoolean
              currentValue={this.state.fields['license']}
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
              currentValue={this.state.fields['felony']}
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
              currentValue={this.state.fields['felonyConviction']}
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
                value={this.state.fields['primaryReason']}
              />
            </div>
          </div>
        </div>
        <div className="row form-group">
          <div className="col-md-1">
            <input
              type="checkbox"
              readOnly="true"
              checked={this.state.fields['liability']}
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
              checked={this.state.fields['acknowledge']}
              />
          </div>
          <div className="col-md-11">
            <label>I am telling the truth.</label>
          </div>
        </div>
      </form>
      <div className="col-md-12">
        <button
          onClick={this.approveApplication}
          className="btn btn-sm btn-success btn-space">Approve</button>
        <button
          onClick={this.waiverSigned}
          className="btn btn-sm btn-default btn-space">Waiver Signed</button>
        <button
          onClick={this.duesPaid}
          className="btn btn-sm btn-success btn-space">Dues Paid</button>
        <button
          onClick={this.photoTaken}
          className="btn btn-sm btn-default btn-space">Photo Taken</button>
        <button
          onClick={this.d4hCreated}
          className="btn btn-sm btn-success btn-space">D4H created</button>
      </div>
    </div>`
