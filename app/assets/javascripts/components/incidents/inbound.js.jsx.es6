class Messages extends ViewComponent {

  componentDidMount() {
    this.loadMessages();
    this.interval = setInterval(() => {
      this.updateMessages();
    }, 5000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  loadMessages() {
    $.ajax({
      method: 'get',
      url: '/incident_messages',
      dataType: 'json',
      success: (data) => {
        this.props.setMessages(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

  updateMessages() {
    $.ajax({
      method: 'get',
      url: '/update_messages',
      dataType: 'json',
      success: (data) => {
        this.setState({ messages: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  detailedMessage(message) {
    return (
      <tr key={ message.id }>
        <td>{ message.date_created }</td>
        <td>{ message.from_phone }</td>
        <td>{ message.to_phone }</td>
        <td>{ message.body }</td>
        <td>{ message.role }</td>
        <td>{ message.status }</td>
        <td>{ message.direction }</td>
        <td>{ message.account }</td>
      </tr>
    )
  }

  detailedMessages(){
    let messages = [];
    for (var message of this.props.messages) {
      messages.push(this.message(message));
    }
    return messages;
  }

  message(m) {
    let avail = 'unknown btn btn-xs';
    if (m.translation == 'available') {
      avail = 'available btn btn-xs';
    }
    if (m.translation == 'unavailable') {
      avail = 'unavailable btn btn-xs'
    }
    return (
      <div className="row" key={m.id}>
        <div className={`col-md-6 ${avail}`}>
          <span>{m.member.name}</span>
          <span>{m.body}</span>
        </div>
      </div>
    );
  }

  messages() {
    if (!this.props.messages) {
      return;
    }
    let messages = [];
    for (var m of this.props.messages) {
      if(!_.find(this.props.incident.incident_members, {member_id: m.member.id})) {
        messages.push(this.message(m));
      }
    }
    return messages;
  }

  render() {
    return (
      <div>
        {this.messages()}
      </div>
    );
  }

}

window.Messages = Messages;
