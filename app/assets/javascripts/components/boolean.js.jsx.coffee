window.SharedBoolean = React.createClass

  render: ->
    `<div>
      <label className="radio-inline">
        <input
          type="radio"
          value={true}
          checked={this.props.currentValue == "true"}
          onChange={this.props.setValue}
        />
        Yes
      </label>
      <label className="radio-inline">
        <input
          type="radio"
          value={false}
          checked={this.props.currentValue == "false"}
          onChange={this.props.setValue}
        />
        No
      </label>
    </div>`
