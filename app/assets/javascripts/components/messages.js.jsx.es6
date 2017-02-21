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
      <tr>
        <td>{message.time}</td>
        <td>{message.from}</td>
        <td>{message.body}</td>
      </tr>
    );
  }

  messages(){
    let messages = [];
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
          {messages}
        </tbody>
      </table>
    );
  }

}

window.Messages = Messages;
