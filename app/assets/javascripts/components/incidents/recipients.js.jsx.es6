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

  recipientAvailable(r, status) {
    if (!this.props.incident.id) {
      return;
    }
    $.ajax({
      method: 'patch',
      data: {status: status, member_id: r.id, incident_id: this.props.incident.id},
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

  availableButton(r) {
    if (r.status != 'available') {
      return(
        <span
          className="btn btn-xs btn-success pull-right"
          onClick={this.recipientAvailable.bind(this, r, 'available')}>
          avail
        </span>
      );
    }
  }

  unavailableButton(r) {
    if (r.status != 'unavailable') {
      return (
        <span
          className="btn btn-xs btn-danger pull-right"
          onClick={this.recipientAvailable.bind(this, r, 'unavailable')}>
          unavail
        </span>
      );
    }
  }

  unknownButton(r) {
    if (r.status != 'unknown') {
      return (
        <span
          className="btn btn-xs btn-warning pull-right"
          onClick={this.recipientAvailable.bind(this, r, 'unknown')}>
          unknown
        </span>
      );
    }
  }

  dropButton(r){
    return (
      <span className="btn btn-xs btn-danger pull-right"
      onClick={this.dropRecipient.bind(this, r)}>
        <i className="fa fa-ban" aria-hidden="true"></i>
      </span>
    );
  }

  recipient(r) {
    let note = '';
    if (r.status_id != 1) {
      note = 'non-op';
    }
    return (
      <span className="col-md-4" key={r.id}>
        <span>
          {r.name}
          {note}
        </span>
        {this.dropButton(r)}
        {this.availableButton(r)}
        {this.unknownButton(r)}
        {this.unavailableButton(r)}
      </span>
    );
  }

  incidentMembers() {
    if (!this.props.members) {
      return [];
    }
    let recipients = [];
    for (var i of this.props.incident.incident_members) {
      let recipient = _.find(this.props.members, { id: i.member_id });
      if (recipient) {
        recipient.status = i.status;
        recipients.push(recipient);
      }
    }
    return recipients;
  }

  sortedNames() {
    return(
      this.incidentMembers().sort((a, b) => {
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
    let recipients = [];
    let names = this.sortedNames();
    let unknown = _.find(names, {status: 'unknown'})
    while (names.length > 0) {
      let avail = _.find(names, {status: 'available'})
      if (avail) {
        _.remove(names, { id: avail.id });
        avail = this.recipient(avail);
      } else {
        avail = <span className="col-md-4"></span>
      }
      let unknown = _.find(names, {status: 'unknown'})
      if (unknown) {
        _.remove(names, { id: unknown.id });
        unknown = this.recipient(unknown);
      } else {
        unknown = <span className="col-md-4"></span>
      }
      let unavail = _.find(names, {status: 'unavailable'})
      if (unavail) {
        _.remove(names, { id: unavail.id });
        unavail = this.recipient(unavail);
      } else {
        unavail = <span className="col-md-4"></span>
      }
      recipients.push (
        <div className="row">
          {avail}
          {unknown}
          {unavail}
        </div>
      );
    }
    return recipients;
  }

  render() {
    return (
      <div>
        {this.recipients()}
      </div>
    );
  }
}

window.Recipients =  Recipients;
