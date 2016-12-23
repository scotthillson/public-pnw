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
          value={true}
          checked={this.props.currentValue == true}
          onChange={this.setToTrue}
        />
        Yes
      </label>
      <label className="radio-inline">
        <input
          type="radio"
          value={false}
          checked={this.props.currentValue != true}
          onChange={this.setToFalse}
        />
        No
      </label>
    </div>`
