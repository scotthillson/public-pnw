window.Messages = React.createClass

  getInitialState: ->
    {
      body: ''
      messages: []
    }
  
  componentDidMount: ->
    $.ajax {
      method: 'GET'
      url: '/messages'
      dataType: 'json'
      context: this
      success: (data) ->
        @setState(messages: data)
      error: (jqXHR, ajaxSettings, thrownError)->
        console.log jqXHR
      }
  
  bodyChange: ->
    true
  
  render: ->
    `<div>
      <textarea
        name="body"
        className="form-control"
        value={this.state.body}
        onChange={this.bodyChange}
      />
    </div>`
