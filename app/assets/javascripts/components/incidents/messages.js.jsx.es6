class Messages extends ViewComponent {

  detailedMessage(message) {
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
