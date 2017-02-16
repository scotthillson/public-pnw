class MessageInbox extends ViewComponent {

  constructor() {
    super();
    this.state = {
      mssages: []
    };
  }

  componentDidMount() {
    $.ajax({
      method: 'GET',
      url: '/messages',
      dataType: 'json',
      context: this,
      success: (data) =>{
        this.setState({messages: data});
      },
      error: (jqXHR, ajaxSettings, thrownError) =>{
        console.log(jqXHR);
      }})
  }

  message(message) {
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
    return (<h3>Loading!</h3>);
  }
}

window.MessageInbox = MessageInbox;
