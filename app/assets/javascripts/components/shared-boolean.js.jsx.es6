class SharedBoolean extends ViewComponent {

  render() {
    return (
      <div>
        <label className="radio-inline">
          <input
            type="radio"
            value={true}
            checked={this.props.currentValue == "true" || this.props.currentValue == true}
            onChange={this.props.onChange}
            readOnly={this.props.readOnly}
          />
          Yes
        </label>
        <label className="radio-inline">
          <input
            type="radio"
            value={false}
            checked={this.props.currentValue == "false" || this.props.currentValue == false}
            onChange={this.props.onChange}
            readOnly={this.props.readOnly}
          />
          No
        </label>
      </div>
    )
  }

}

window.SharedBoolean = SharedBoolean;
