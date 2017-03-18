class Responders extends ViewComponent {

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
          className="btn btn-xs btn-warning pull-right"
          onClick={this.recipientAvailable.bind(this, r, 'unavailable')}>
          unav
        </span>
      );
    }
  }

  unknownButton(r) {
    if (r.status != 'unknown') {
      return (
        <span
          className="btn btn-xs btn-default pull-right"
          onClick={this.recipientAvailable.bind(this, r, 'unknown')}>
          unkn
        </span>
      );
    }
  }

  messagesToMember(r) {
    return (
      _.filter(this.props.messages, (m) => {
        if (m.member) {
          if (m.member.id == r.id) {
            if (m.to == r.mobile_phone) {
              return true;
            }
          }
        }
      })
    );
  }

  memberMessages(r) {
    return (
      _.filter(this.props.messages, (m) => {
        if (m.member) {
          if (m.member.id == r.id) {
            return true;
          }
        }
      })
    );
  }

  messages(r) {
    let messages = [];
    for (var m of this.memberMessages(r)) {
      messages.push(
        <div>
          {m.body}
        </div>
      );
    }
    return (
      <div>
        {messages}
      </div>
    );
  }

  recipient(r) {
    let note = '';
    if (r.status_id != 1) {
      note = 'non-op';
    }
    return (
      <span className={`recipient-column ${r.status}`} key={r.id}>
        <div>
          <span>
            {r.name}
            {note}
          </span>
          {this.availableButton(r)}
          {this.unknownButton(r)}
          {this.unavailableButton(r)}
          {this.messages(r)}
        </div>
      </span>
    );
  }

  incidentMembers() {
    if (!this.props.members || !this.props.incident) {
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

  responders() {
    let recipients = [];
    let names = this.sortedNames();
    let unknown = _.find(names, {status: 'unknown'})
    while (names.length > 0) {
      let avail = _.find(names, {status: 'available'})
      if (avail) {
        _.remove(names, { id: avail.id });
        avail = this.recipient(avail);
      } else {
        avail = <span className="recipient-column"></span>
      }
      let unknown = _.find(names, {status: 'unknown'})
      if (unknown) {
        _.remove(names, { id: unknown.id });
        unknown = this.recipient(unknown);
      } else {
        unknown = <span className="recipient-column"></span>
      }
      let unavail = _.find(names, {status: 'unavailable'})
      if (unavail) {
        _.remove(names, { id: unavail.id });
        unavail = this.recipient(unavail);
      } else {
        unavail = <span className="recipient-column"></span>
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
    if (this.props.loading){
      return (
        <div>Loading!</div>
      );
    }
    return (
      <div>
        {this.responders()}
      </div>
    );
  }
}

window.Responders = Responders;
