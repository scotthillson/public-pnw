class MessageInbox extends ViewComponent {
  
  constructor() {
    super();
    this.state = {
      mssages: []
    };
  }
  
  componentDidMount() {
    $.ajax({
      method: 'GET'
      url: '/messages'
      dataType: 'json'
      context: this
      success: (data) {
        this.setState(messages: data);
      }
      error: (jqXHR, ajaxSettings, thrownError) {
        console.log(jqXHR);
      }})
  }
  
  messageFor (message) {
    return (<tr key={message.sid}>
      <td>{message.date_created}</td>
      <td>{message.from}</td>
      <td>{message.date_sent}</td>
      <td>{message.body}</td>
      <td>{message.status}</td>
      <td>{message.direction}</td>
      <td>{message.sid}</td>
      <td>{message.account}</td>
      <td>{message.messaging_service_sid}</td>
    </tr>)
  }
  render(){
    if (this.state.messages.length > 0){
      let messages = [];
      for message in @state.messages
        messages.push @messageFor(message)
      return(<table className="table">
        <thead>
          <tr>
            <th>Created</th>
            <th>From</th>
            <th>Sent</th>
            <th>body</th>
            <th>Status</th>
            <th>Direction</th>
            <th>SID</th>
            <th>Account</th>
            <th>Service</th>
          </tr>
        </thead>
        <tbody>
          {messages}
        </tbody>
      </table>);
    }
    else{
      return (<h3>Loading!</h3>);
    }
  }
}

window.MessageInbox = MessageInbox;
