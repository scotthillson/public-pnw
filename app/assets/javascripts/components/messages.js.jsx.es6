class Messages extends ViewComponent {

  constructor() {
    super();
    this.state = {
      mode: 'inbox',
      messages: [],
      body: null
    };
  }

  componentDidMount() {
    this.loadMessages();
  }

  loadMessages() {
    $.ajax({
      method: 'GET',
      url: '/messages',
      dataType: 'json',
      context: this,
      success: (data) => {
        this.setState({ messages: data }, this.updateMessages);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateMessages(){
    $.ajax({
      method: 'GET',
      url: '/update_messages',
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

  message(message) {
    return (
      <tr key={ message.sid }>
        <td>{ message.date_created }</td>
        <td>{ message.from }</td>
        <td>{ message.date_sent }</td>
        <td>{ message.body }</td>
        <td>{ message.status }</td>
        <td>{ message.direction }</td>
        <td>{ message.sid }</td>
        <td>{ message.account }</td>
        <td>{ message.messaging_service_sid }</td>
      </tr>
    )
  }

  messages(){
    let messages = [];
    for (var message of this.state.messages) {
      messages.push(this.message(message));
    }
    return messages;
  }

  render() {
    return (
      <table>
        <thead>
          <tr>
            <th>time</th>
            <th>from</th>
            <th>body</th>
          </tr>
        </thead>
        <tbody>
          { this.messages() }
        </tbody>
      </table>
    );
  }

}

window.Messages = Messages;
