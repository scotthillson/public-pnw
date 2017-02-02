window.SharedCheckbox = React.createClass

  clickHandler: ->
    @props.clickHandler(@props.field)
  
  render: ->
    if @props.checked.toString() is 'true'
      `<a className="btn btn-success" onClick={this.clickHandler}>
        <i className="fa fa-check"></i>
      </a>`
    else
      `<a className="btn btn-danger" onClick={this.clickHandler}>Click to Agree</a>`
