window.MessageInbox = React.createClass

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
  
  messageFor: (message) ->
    `<tr key={message.sid}>
      <td>{message.date_created}</td>
      <td>{message.from}</td>
      <td>{message.date_sent}</td>
      <td>{message.body}</td>
      <td>{message.status}</td>
      <td>{message.direction}</td>
    </tr>`
  
  render: ->
    if @state.messages.length > 0
      messages = []
      for message in @state.messages
        messages.push @messageFor(message)
      `<table className="table">
        <thead>
          <tr>
            <th>Created</th>
            <th>From</th>
            <th>Sent</th>
            <th>body</th>
            <th>Status</th>
            <th>Direction</th>
          </tr>
        </thead>
        <tbody>
          {messages}
        </tbody>
      </table>`
    else
      `<h3>Loading!</h3>`
