window.SharedBoolean = React.createClass

  setToTrue: ->
    @props.setValue true
  
  setToFalse: ->
    @props.setValue false
  
  render: ->
    `<div>
      <label className="radio-inline">
        <input
          type="radio"
          name="Yes"
          value={true}
          checked={this.props.value === true}
          onChange={this.setToTrue}
        />
        Yes
      </label>
      <label className="radio-inline">
        <input
          type="radio"
          name="No"
          value={false}
          checked={this.props.value != true}
          onChange={this.setToFalse}
        />
        No
      </label>
    </div>`
