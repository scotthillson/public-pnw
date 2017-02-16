class Emails extends ViewComponent {

  constructor() {
    super();
    this.state = {
      emails: []
    };
  }

  componentDidMount() {
    this.loadMessages();
  }

  loadMessages() {
    $.ajax({
      method: 'GET',
      url: '/emails',
      dataType: 'json',
      context: this,
      success: (data) => {
        this.setState({ messages: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  messageFor(message) {
    return (
      <tr key={message.sid}>
        <td>{message.date_created}</td>
        <td>{message.from}</td>
        <td>{message.date_sent}</td>
        <td>{message.body}</td>
        <td>{message.status}</td>
        <td>{message.direction}</td>
      </tr>
    );
  }
  
  render() {
    if (this.state.messages.length > 0) {
      let messages = [];
      for (var message of this.state.messages)
        messages.push @messageFor(message)
      <table className="table">
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
      </table>
    }
    return (
      <h3>Loading!</h3>
    );
  }
}

window.Emails = Emails;
