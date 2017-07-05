class Responder extends ViewComponent {

  recipientAvailable(r, status) {
    if (!this.props.incident.id) {
      return;
    }
    $.ajax({
      method: 'patch',
      data: {
        status: status,
        member_id: r.id,
        incident_id: this.props.incident.id
      },
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

  responder(r) {
    let note = '';
    if (r.status_id != 1) {
      note = 'non-op';
    }
    return (
      <span className={`responder-column ${r.status}`} key={r.id}>
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

  render() {
    return this.responder(this.props.responder);
  }
}

window.Responder = Responder;
