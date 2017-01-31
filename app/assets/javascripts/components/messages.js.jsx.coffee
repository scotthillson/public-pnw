window.Messages = React.createClass

  getInitialState: ->
    {messages: []}
  
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
  
  render: ->
    `<h3>Loading!</h3>`
