class Recipients extends ViewComponent {

  constructor() {
    super();
    this.state = {
      messages: [],
      sentMessages: []
    };
  }

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
      url: '/messages',
      dataType: 'json',
      success: (data) => {
        this.setState({ messages: data });
      },
      error: (jqXHR) => {
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

  sentMessages() {
    $.ajax({
      method: 'get',
      url: '/sent_messages',
      dataType: 'json',
      success: (data) => {
        this.setState({ sent_messages: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  dropRecipient(r) {
    if (!this.props.incident.id) {
      return;
    }
    $.ajax({
      method: 'delete',
      data: {member_id: r.id},
      url: `incidents/${this.props.incident.id}/remove_member`,
      dataType: 'json',
      success: (data) => {
        this.props.getIncident();
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  recipientAvailable(status) {
    if (!this.props.incident.id) {
      return;
    }
    $.ajax({
      method: 'patch',
      data: {status: status},
      url: `update_incident_member`,
      dataType: 'json',
      success: (data) => {
        this.props.getIncident();
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  message(m) {
    return (
      <div className="row" key={m.id}>
        <div className="col-md-6">{m.member.name}</div>
        <div className="col-md-6">{m.body}</div>
      </div>
    );
  }

  messages() {
    let messages = [];
    for (var m of this.state.messages) {
      if(!_.find(this.props.incident.members, {id: m.member.id})) {
        messages.push(this.message(m));
      }
    }
    return messages;
  }

  recipient(r) {
    let avail = 'unknown btn-xs btn';
    let note = '';
    if (r.status_id != 1) {
      note = 'non-op';
    }
    return (
      <div className="row" key={r.id}>
        <div className={`col-md-3 ${avail}`}>
          <p className="pull-left">{r.name}</p>
          <p className="pull-right">{note}</p>
        </div>
        <div className="btn btn-xs btn-danger pnw-btn" onClick={this.dropRecipient.bind(this, r)}>
          <i className="fa fa-ban" aria-hidden="true"></i>
        </div>
        <div
          className="btn btn-xs btn-success pnw-btn"
          onClick={this.recipientAvailable.bind(this, r, 'available')}
          >avail
        </div>
        <div
          className="btn btn-xs btn-danger pnw-btn"
          onClick={this.recipientAvailable.bind(this, r, 'unavailable')}
          >unavail
        </div>
      </div>
    );
  }

  sortedNames(names) {
    return(
      names.sort((a, b) => {
        let nameA = a.name.toUpperCase();
        let nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      })
    );
  }

  recipients() {
    let names = [];
    let recipients = [];
    for (var r of this.props.incident.members) {
      names.push(r);
    }
    names = this.sortedNames(names)
    for (var r of names) {
      recipients.push(
        this.recipient(r)
      );
    }
    return recipients;
  }

  render() {
    return (
      <div>
        {this.recipients()}
        {this.messages()}
      </div>
    );
  }
}

window.Recipients =  Recipients;
